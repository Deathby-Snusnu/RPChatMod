"""Regression contract for WoW emote speech without duplicate /me output."""
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
LANGUAGES = ("deDE", "enUS", "frFR")
VOLUMES = ("01", "02", "03", "04", "05")
CLASSIC = """
ANGRY APPLAUD APPLAUSE ATTACKTARGET BASHFUL BEG BLOW BLUSH BOGGLE BOW BRAVO
BYE CACKLE CHARGE CHEER CHEW CHICKEN CHUCKLE CLAP COMMEND CONFUSED CONGRATS
CONGRATULATE CRY CURIOUS CURTSEY DANCE DRINK EAT FAREWELL FEAST FLAP FLEE
FLEX FLIRT FOLLOWME GASP GIGGLE GLOAT GOLFCLAP GOODBYE GREET GREETINGS
GROVEL GUFFAW HAIL HEALME HELLO HELPME HI INCOMING INSULT KISS KNEEL LAY
LAYDOWN LIE LIEDOWN LOL LOST MAD MOURN OOM OPENFIRE PARTY PEON PLEAD POINT
PONDER PUZZLED QUESTION RASP ROAR ROFL RUDE SALUTE SHINDIG SHRUG SHY SIT
SLEEP SOB STRONG STRUT SURRENDER TALK TALKEX TALKQ TAUNT TRAIN VICTORY
VIOLIN WAVE WEEP WELCOME YES AGREE AMAZE APOLOGIZE BARK BECKON BELCH BITE
BLEED BLINK BLOOD BONK BORED BOUNCE BRB BURP CALM CAT CATTY COLD COMFORT
COUGH COWER CRACK CRINGE CUDDLE DISAPPOINTED DOH DOOM DROOL DUCK EYE FART
FEAR FIDGET FLOP FOOD FROWN GAZE GLAD GLARE GRIN GROAN HAPPY HUG HUNGRY
IMPATIENT INTRODUCE JK KNUCKLES LAVISH LICK LISTEN MASSAGE MOAN MOCK MOON
NO NOD NOSEPICK PANIC PAT PEER PEST PICK PITY PIZZA POKE POUNCE PRAISE PURR
RAISE RDY READY REAR SCRATCH SEXY SHAKE SHIMMY SHIVER SHOO SIGH SLAP SMELL
SMIRK SNARL SNICKER SNIFF SNUB SOOTHE SORRY SPIT SPOON STARE STINK
SURPRISED TAP TEASE THANK THANKS THIRSTY THREAT TICKLE THREATEN TIRED TY
VETO VOLUNTEER WHINE WHISTLE WICKED WICKEDLY WORK WRATH YAWN
""".split()


class SpokenEmoteTests(unittest.TestCase):
    def test_194_keys_and_same_locales(self):
        all_locales = []
        for lang in LANGUAGES:
            general = (ROOT / "locales" / lang / "General.lua").read_text(
                encoding="utf-8"
            )
            base = re.findall(
                r"\b([A-Z][A-Z0-9_]*)\s*=\s*\{", general
            )
            self.assertEqual(len(base), 20)
            newly = []
            for volume in VOLUMES:
                file = ROOT / "locales" / lang / ("SpokenEmotes" + volume + ".lua")
                src = file.read_text(encoding="utf-8")
                for line in src.splitlines():
                    prefix = f"addon.localeData.{lang}.generalTexts."
                    if not line.startswith(prefix):
                        continue
                    match = re.match(
                        re.escape(prefix) + r"([A-Z][A-Z0-9_]*)\s*=\s*\{",
                        line,
                    )
                    self.assertIsNotNone(match, (lang, volume, line))
                    key = match.group(1)
                    newly.append(key)
                    self.assertIn("gruppe = {", line, key)
                    self.assertIn("ziel = {", line, key)
                    values = [json.loads(m) for m in re.findall(
                        r'"(?:\\.|[^"\\])*"', line
                    )]
                    self.assertEqual(len(values), 4, (lang, key))
                    for value in values:
                        self.assertTrue(value and len(value.encode("utf-8")) <= 255)
                        self.assertFalse(value.startswith("*") and value.endswith("*"))
                        self.assertNotIn("|", value)
                        self.assertNotIn("\n", value)
                        self.assertNotIn("\r", value)
                    self.assertEqual(sum("%s" in v for v in values), 2)
            self.assertEqual(len(newly), 174, lang)
            self.assertEqual(len(set(newly)), 174, lang)
            self.assertFalse(set(base) & set(newly), lang)
            all_keys = set(base) | set(newly)
            self.assertEqual(len(all_keys), 194, lang)
            all_locales.append(all_keys)
        self.assertEqual(all_locales[0], all_locales[1])
        self.assertEqual(all_locales[0], all_locales[2])

    def test_classic_slash_commands_resolve_to_pool_or_alias(self):
        general = (ROOT / "locales" / "deDE" / "General.lua").read_text(
            encoding="utf-8"
        )
        keys = set(re.findall(r"\b([A-Z][A-Z0-9_]*)\s*=\s*\{", general))
        for num in VOLUMES:
            src = (ROOT / "locales" / "deDE" /
                   ("SpokenEmotes" + num + ".lua")).read_text(encoding="utf-8")
            keys.update(re.findall(
                r"(?m)^addon\.localeData\.deDE\.generalTexts\.([A-Z][A-Z0-9_]*)\s*=",
                src
            ))
        aliases = (ROOT / "core" / "Emotes.lua").read_text(encoding="utf-8")
        # Every listed classic emote token has a dedicated pool or is mapped
        # onto an equivalent token (e.g. APPLAUSE -> APPLAUD).
        alias_pairs = dict(re.findall(r'([A-Z][A-Z0-9_]*)\s*=\s*"([A-Z_]+)"',
                                      aliases.split("function addon.ResolveEmoteAlias")[0]))
        self.assertEqual(len(set(CLASSIC)), 210)
        for token in CLASSIC:
            with self.subTest(token=token):
                self.assertIn(alias_pairs.get(token, token), keys)

    def test_toc_loads_every_volume_and_native_spoken_default(self):
        toc = (ROOT / "RPChatMod.toc").read_text(encoding="utf-8")
        self.assertIn("## Version: 0.6.0", toc)
        files = [ln.strip().replace("\\", "/") for ln in toc.splitlines()
                 if ln.strip() and not ln.startswith("#")]
        self.assertEqual(len(files), len(set(files)))
        for file in files:
            self.assertTrue((ROOT / file).is_file(), file)
        for lang in LANGUAGES:
            baseline = files.index(f"locales/{lang}/General.lua")
            for i, num in enumerate(VOLUMES, 1):
                self.assertEqual(
                    files[baseline + i], f"locales/{lang}/SpokenEmotes{num}.lua"
                )
        settings = (ROOT / "config" / "Settings.lua").read_text(encoding="utf-8")
        self.assertIn("nativeEmotes = true", settings)
        text = (ROOT / "core" / "Text.lua").read_text(encoding="utf-8")
        self.assertIn('text:sub(1, 1) == "*"', text)


if __name__ == "__main__":
    unittest.main()
