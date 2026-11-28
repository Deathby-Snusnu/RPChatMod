"""Wave 4: ensure all eleven races receive authentic, localized race/class voices."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LANGUAGES = ("deDE", "enUS", "frFR")
PROFILES = (
    ("Dwarf", "PRIEST"), ("Gnome", "WARRIOR"), ("Human", "PALADIN"),
    ("NightElf", "HUNTER"), ("Skyborne", "DRUID"), ("Draenei", "SHAMAN"),
    ("Orc", "WARRIOR"), ("Troll", "ROGUE"), ("Tauren", "DRUID"),
    ("Undead", "PRIEST"), ("BloodElf", "MAGE"),
)


class RaceClassWaveFourTests(unittest.TestCase):
    def test_toc_and_profiles(self):
        toc = (ROOT / "RPChatMod.toc").read_text(encoding="utf-8")
        self.assertIn("## Version: 0.6.6", toc)
        for language in LANGUAGES:
            self.assertIn(f"locales\\{language}\\SocialVoices.lua", toc)
            source = (ROOT / "locales" / language / "SocialVoices.lua").read_text(
                encoding="utf-8"
            )
            marker = "-- Wave 4: additional original race/class dialogue in three locales."
            self.assertEqual(source.count(marker), 1)
            wave = source.split(marker, 1)[1]
            self.assertNotIn("SendChatMessage", wave)
            self.assertNotIn("COMBAT_LOG_EVENT_UNFILTERED", wave)
            self.assertNotIn('"*', wave)
            for race, klass in PROFILES:
                with self.subTest(lang=language, race=race, klass=klass):
                    for key in ("HELLO", "THANK", "FAREWELL"):
                        pattern = (
                            rf'extend\(locale\.raceClassTexts\.{race}\.{klass}, '
                            rf'"{key}", \{{(.*?)\}}, \{{(.*?)\}}\)'
                        )
                        match = re.search(pattern, wave)
                        self.assertIsNotNone(match)
                        target = re.findall(r'"((?:\\.|[^"\\])*)"', match.group(1))
                        group = re.findall(r'"((?:\\.|[^"\\])*)"', match.group(2))
                        if key in ("HELLO", "THANK"):
                            self.assertEqual(len(target), 1)
                            self.assertFalse(group)
                            self.assertEqual(target[0].count("%s"), 1)
                        else:
                            self.assertFalse(target)
                            self.assertEqual(len(group), 1)
                            self.assertNotIn("%s", group[0])
                        for line in target + group:
                            self.assertLessEqual(len(line.encode("utf-8")), 255)


if __name__ == "__main__":
    unittest.main()
