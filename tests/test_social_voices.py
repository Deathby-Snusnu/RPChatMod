"""Regression guards for the additive, manual social-voice expansion."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LOCALES = ("deDE", "enUS", "frFR")
RACES = ("Dwarf", "Gnome", "Human", "NightElf", "Skyborne", "Draenei",
         "Orc", "Troll", "Tauren", "Undead", "BloodElf")
CLASSES = ("WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN",
           "MAGE", "WARLOCK", "DRUID")
COMBINATIONS = (("Gnome", "MAGE"), ("Dwarf", "HUNTER"), ("Dwarf", "PALADIN"))
WAVE2_COMBINATIONS = (("Dwarf", "PALADIN"), ("Dwarf", "HUNTER"),
    ("Gnome", "MAGE"), ("Gnome", "WARLOCK"), ("NightElf", "DRUID"),
    ("Human", "WARRIOR"), ("Troll", "SHAMAN"), ("Undead", "ROGUE"),
    ("BloodElf", "PRIEST"))


class SocialVoiceTests(unittest.TestCase):
    def test_all_languages_registered_after_base_tables(self):
        toc = (ROOT / "RPChatMod.toc").read_text(encoding="utf-8")
        self.assertIn("## Version: 0.6.6", toc)
        for language in LOCALES:
            base = f"locales\\{language}\\RaceClass.lua"
            extras = f"locales\\{language}\\SocialVoices.lua"
            self.assertIn(base, toc)
            self.assertIn(extras, toc)
            self.assertLess(toc.index(base), toc.index(extras))

    def test_all_races_classes_and_character_combinations(self):
        for language in LOCALES:
            with self.subTest(language=language):
                source = (ROOT / "locales" / language / "SocialVoices.lua").read_text(
                    encoding="utf-8"
                )
                self.assertNotIn("COMBAT_LOG_EVENT_UNFILTERED", source)
                self.assertIn("local function append(pool, lines)", source)
                for race in RACES:
                    self.assertIn(f'extend(locale.raceTexts.{race}, "THANK"', source)
                for klass in CLASSES:
                    self.assertIn(f'extend(locale.classTexts.{klass}, "FAREWELL"', source)
                for race, klass in COMBINATIONS:
                    for key in ("HELLO", "THANK", "FAREWELL"):
                        self.assertIn(
                            f'extend(locale.raceClassTexts.{race}.{klass}, "{key}"',
                            source,
                        )
                # Three locales and no accidental substitution of text targets.
                self.assertIn("%s", source)
                self.assertNotIn("Neuer RP-Text", source)

    def test_wave2_races_classes_and_combinations(self):
        for language in LOCALES:
            with self.subTest(language=language):
                source = (ROOT / "locales" / language / "SocialVoices.lua").read_text(
                    encoding="utf-8"
                )
                for race in RACES:
                    self.assertIn(f'extend(locale.raceTexts.{race}, "HELLO"', source)
                for klass in CLASSES:
                    self.assertIn(f'extend(locale.classTexts.{klass}, "CHEER"', source)
                for race, klass in WAVE2_COMBINATIONS:
                    for key in ("HELLO", "FAREWELL"):
                        self.assertIn(
                            f'extend(locale.raceClassTexts.{race}.{klass}, "{key}"',
                            source.partition("-- Wave 2:")[2],
                        )
                self.assertNotIn("StartBuffThanksListener()", source)
                self.assertNotIn("C_ChatInfo.SendChatMessage", source)

    def test_new_social_lines_are_speech_not_duplicate_native_emotes(self):
        for language in LOCALES:
            source = (ROOT / "locales" / language / "SocialVoices.lua").read_text(
                encoding="utf-8"
            )
            self.assertNotIn('"*', source)
            self.assertNotIn("SendChatMessage", source)


if __name__ == "__main__":
    unittest.main()
