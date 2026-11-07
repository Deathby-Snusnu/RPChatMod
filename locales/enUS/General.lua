-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.generalTexts = {HELLO={ziel={"Greetings, %s.","Good to see you, %s."},gruppe={"Greetings, everyone."}},WAVE={ziel={"A friendly wave to you, %s."},gruppe={"A friendly wave to all."}},SALUTE={ziel={"My respect, %s."},gruppe={"My respect to you all."}},BOW={ziel={"A respectful bow, %s."},gruppe={"A respectful bow to all."}},LAUGH={ziel={"Ha! Well said, %s."},gruppe={"Ha! Well said."}},DANCE={ziel={"Care to dance, %s?"},gruppe={"Come, let us dance!"}},SIT={ziel={"Take a seat, %s."},gruppe={"Time for a short rest."}},SLEEP={ziel={"Sleep well, %s."},gruppe={"Rest well, everyone."}},THANK={ziel={"Thank you, %s."},gruppe={"Thank you all."}},
    FLIRT = {
        ziel = {
            "You have my attention, %s.",
            "Your company is remarkably pleasant, %s.",
            "May I pay you a compliment, %s?",
        },
        gruppe = {
            "A little charm never hurts.",
            "Good company makes every road easier.",
            "There is something special in the air tonight.",
        },
    },
    -- Zehn weitere universelle RP-Emotes mit /say und /me
    APPLAUD = { gruppe = { "A well-earned round of applause!", "Some deeds deserve more than a speech.", "*claps with genuine enthusiasm.*", "*nods appreciatively and applauds.*" }, ziel = { "You have earned that praise, %s!" } },
    SORRY = { gruppe = { "Sometimes one word is enough. This one is overdue: sorry.", "I am sorry. I will do better.", "*lowers the gaze and bows the head apologetically.*", "*places a hand over the heart and asks forgiveness.*" }, ziel = { "%s, please accept my apology." } },
    CHEER = { gruppe = { "That is something to be proud of!", "To everyone who refused to give up!", "*throws both arms into the air with joy.*", "*lets out an exuberant cheer.*" }, ziel = { "Well done, %s! Keep going!" } },
    WAIT = { gruppe = { "One moment more. Not every road must begin at a sprint.", "Those who wait sometimes hear what others miss.", "*raises an open hand to signal a pause.*", "*steps aside and checks the surroundings.*" }, ziel = { "Please wait a moment, %s." } },
    SHRUG = { gruppe = { "Well. Not every mystery needs solving today.", "Sometimes a shrug is the wisest response.", "*lifts both shoulders in a questioning gesture.*", "*raises the eyebrows and opens both hands.*" }, ziel = { "%s, what can I say?" } },
    POINT = { gruppe = { "Over there! Do you see it too?", "The road clearly runs in that direction.", "*points decisively toward the horizon.*", "*traces a direction through the air with one finger.*" }, ziel = { "This way, %s!" } },
    CHEERS = { gruppe = { "To coming home, and all the stories in between!", "A fine toast needs fine company.", "*raises the mug and grins at the gathering.*", "*clinks cups with the companions.*" }, ziel = { "Cheers, %s! Here's to you!" } },
    COMFORT = { gruppe = { "Not everything must be all right again immediately.", "I cannot talk away the burden, but I can carry part of it.", "*sits quietly beside a tired companion.*", "*rests a gentle hand on a shoulder.*" }, ziel = { "%s, you need not carry this alone." } },
    HUG = { gruppe = { "Sometimes an embrace is the entire answer.", "Come here. For a moment the world can be small enough.", "*opens both arms in welcome.*", "*gives a familiar companion a warm hug.*" }, ziel = { "%s, come and have a hug." } },
    KNEEL = { gruppe = { "Respect is clearest without grand speeches.", "For this moment, I kneel by my own choice.", "*drops to one knee and bows the head.*", "*rests a hand on the ground and holds a quiet posture.*" }, ziel = { "Before you, %s, I bow my head." } },
}