"""Contracts for Rogue and Shaman social-voice wave in all locales."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LANGUAGES = ("deDE", "enUS", "frFR")
KEYS = ("WAVE", "THANK", "SIT", "LAUGH", "SALUTE")
COMBOS = (
    ("Gnome", "ROGUE"), ("Human", "ROGUE"), ("Undead", "ROGUE"),
    ("Orc", "SHAMAN"), ("Tauren", "SHAMAN"), ("Troll", "SHAMAN"),
)


class RogueShamanVoiceTests(unittest.TestCase):
    def test_existing_locale_files_are_loaded(self):
        toc = (ROOT / "RPChatMod.toc").read_text(encoding="utf-8")
        self.assertIn("## Version: 0.6.5", toc)
        for lang in LANGUAGES:
            self.assertIn(f"locales\\{lang}\\SocialVoices.lua", toc)

    def test_rogue_and_shaman_manual_actions(self):
        for lang in LANGUAGES:
            with self.subTest(lang=lang):
                source = (ROOT / "locales" / lang / "SocialVoices.lua").read_text(
                    encoding="utf-8"
                )
                self.assertEqual(source.count("-- Wave 3: rogue and shaman-specific manual social actions."), 1)
                wave3 = source.split("-- Wave 3: rogue and shaman-specific manual social actions.", 1)[1]
                for klass in ("ROGUE", "SHAMAN"):
                    for key in KEYS:
                        pattern = rf'extend\(locale\.classTexts\.{klass}, "{key}", \{{(.*?)\}}, \{{(.*?)\}}\)'
                        match = re.search(pattern, wave3, re.S)
                        self.assertIsNotNone(match, (lang, klass, key))
                        target_lines = re.findall(r'"((?:\\.|[^"\\])*)"', match.group(1))
                        group_lines = re.findall(r'"((?:\\.|[^"\\])*)"', match.group(2))
                        self.assertGreaterEqual(len(target_lines), 1)
                        self.assertGreaterEqual(len(group_lines), 2)
                        self.assertTrue(all("%s" in x for x in target_lines))
                        self.assertTrue(all("%s" not in x for x in group_lines))
                        self.assertTrue(all(len(x.encode("utf-8")) <= 255 for x in target_lines+group_lines))
                for race, klass in COMBOS:
                    for key in ("HELLO", "THANK"):
                        self.assertIn(
                            f'extend(locale.raceClassTexts.{race}.{klass}, "{key}"',
                            wave3,
                        )
                self.assertNotIn("COMBAT_LOG_EVENT_UNFILTERED", wave3)
                self.assertNotIn("SendChatMessage", wave3)
                self.assertNotIn('"*', wave3)


if __name__ == "__main__":
    unittest.main()
