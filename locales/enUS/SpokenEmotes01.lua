-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Spoken RP follow-ups. Never /me: the WoW client supplies its own emote.
local _, addon = ...
local texts = addon.localeData.enUS.generalTexts
texts.AGREE = { gruppe = { "For once, we are in agreement.", "That argument stands on its own feet." }, ziel = { "%s, you have my agreement.", "%s: That argument stands on its own feet." } }
texts.AMAZE = { gruppe = { "Well, that has left me speechless.", "By the stars, how is that possible?" }, ziel = { "%s, you truly astonish me.", "%s: By the stars, how is that possible?" } }
texts.ANGRY = { gruppe = { "My patience has officially left the room.", "Do not attempt that again." }, ziel = { "%s, you are testing the very edge of my patience.", "%s: Do not attempt that again." } }
texts.ATTACKTARGET = { gruppe = { "Weapons ready! The target is clear.", "No speeches now, keep your eyes on the enemy!" }, ziel = { "On %s! Hold the line!", "%s: No speeches now, keep your eyes on the enemy!" } }
texts.BARK = { gruppe = { "Woof! I trust that was clear enough.", "A dog often understands more than a councillor." }, ziel = { "%s, was that clear enough for you?", "%s: A dog often understands more than a councillor." } }
texts.BASHFUL = { gruppe = { "A little less attention would be lovely.", "I am a hero, not the evening's entertainment." }, ziel = { "%s, you are making me blush.", "%s: I am a hero, not the evening's entertainment." } }
texts.BECKON = { gruppe = { "Come closer, we can speak better here.", "Don't worry, I have bitten nobody today." }, ziel = { "%s, come over and join us!", "%s: Don't worry, I have bitten nobody today." } }
texts.BEG = { gruppe = { "A little help would work wonders.", "I dislike asking twice, but I could make an exception." }, ziel = { "%s, have a little mercy?", "%s: I dislike asking twice, but I could make an exception." } }
texts.BELCH = { gruppe = { "Excuse me. Dinner evidently had something to say.", "A good roast sometimes gets the last word." }, ziel = { "%s, I hope you won't hold that against me.", "%s: A good roast sometimes gets the last word." } }
texts.BITE = { gruppe = { "Not every threat requires a blade.", "I still have teeth and remarkably little patience." }, ziel = { "%s, keep clear of my teeth.", "%s: I still have teeth and remarkably little patience." } }
texts.BLEED = { gruppe = { "Just a scratch. An exceptionally stubborn one.", "Who said heroes never bleed?" }, ziel = { "%s, a bandage would be welcome now.", "%s: Who said heroes never bleed?" } }
texts.BLINK = { gruppe = { "Did I just see that correctly?", "My eyes are demanding an explanation." }, ziel = { "%s, please do that again for my eyes.", "%s: My eyes are demanding an explanation." } }
texts.BLOW = { gruppe = { "A kiss sent travelling needs a fair wind.", "May the breeze carry a friendly token." }, ziel = { "%s, this blown kiss is for you.", "%s: May the breeze carry a friendly token." } }
texts.BLUSH = { gruppe = { "Well, that was profoundly unexpected.", "My cheeks are speaking faster than I can." }, ziel = { "%s, you are not making it easy to reply.", "%s: My cheeks are speaking faster than I can." } }
texts.BOGGLE = { gruppe = { "Several suitable words have escaped me.", "My mind would like a short break." }, ziel = { "%s, please explain what is happening.", "%s: My mind would like a short break." } }
texts.BONK = { gruppe = { "Sometimes a little reminder needs emphasis.", "That was a lesson, not a declaration of war." }, ziel = { "%s, remember that gentle warning.", "%s: That was a lesson, not a declaration of war." } }
texts.BORED = { gruppe = { "Would someone please switch the adventure back on?", "I have inspected more interesting stones." }, ziel = { "%s, do you happen to have a better idea?", "%s: I have inspected more interesting stones." } }
texts.BOUNCE = { gruppe = { "No chair can hold me today.", "My feet appear to have plans of their own." }, ziel = { "%s, come along, move a little!", "%s: My feet appear to have plans of their own." } }
texts.BRB = { gruppe = { "A brief detour. I'll be right back.", "Save my seat and keep the soup warm." }, ziel = { "%s, I shall return in a moment.", "%s: Save my seat and keep the soup warm." } }
texts.CACKLE = { gruppe = { "Ha! This grows more entertaining by the moment.", "Perhaps I ought to enjoy this less." }, ziel = { "%s, you brought this upon yourself!", "%s: Perhaps I ought to enjoy this less." } }
texts.CALM = { gruppe = { "Easy. Haste gains us nothing.", "A clear head is a dependable weapon." }, ziel = { "%s, take a breath first.", "%s: A clear head is a dependable weapon." } }
texts.CHARGE = { gruppe = { "Forward! The road will not open itself.", "The brave have no reverse gear." }, ziel = { "With me, %s! Here we go!", "%s: The brave have no reverse gear." } }
texts.CHEW = { gruppe = { "This ration deserves a careful inspection.", "Hasty chewing misses half the flavour." }, ziel = { "%s, would you like a piece?", "%s: Hasty chewing misses half the flavour." } }
texts.CHICKEN = { gruppe = { "Cluck! That was clearly a tactical retreat.", "It takes no chicken to recognize danger." }, ziel = { "%s, will you cluck or act?", "%s: It takes no chicken to recognize danger." } }
texts.CHUCKLE = { gruppe = { "That was better than I expected.", "A little laughter can rescue a long day." }, ziel = { "%s, you know how to cheer me up.", "%s: A little laughter can rescue a long day." } }
texts.COLD = { gruppe = { "Does anybody have a second pair of socks?", "Even my thoughts are starting to freeze." }, ziel = { "%s, do you know somewhere warmer?", "%s: Even my thoughts are starting to freeze." } }
texts.CONFUSED = { gruppe = { "The map and reality appear to disagree.", "I'm not lost. I'm considering alternatives." }, ziel = { "%s, could you explain the connection?", "%s: I'm not lost. I'm considering alternatives." } }
texts.CONGRATS = { gruppe = { "You have earned this through hard work!", "Today we may count our victories." }, ziel = { "%s, my heartfelt congratulations!", "%s: Today we may count our victories." } }
texts.COUGH = { gruppe = { "That dust really should have stayed outside.", "Excuse me, the air is particularly uncooperative today." }, ziel = { "%s, might you spare a little water?", "%s: Excuse me, the air is particularly uncooperative today." } }
texts.COWER = { gruppe = { "A small step backward might be wise.", "Courage and recklessness are not the same." }, ziel = { "%s, come behind this wall instead.", "%s: Courage and recklessness are not the same." } }
texts.CRACK = { gruppe = { "The fingers are ready. The rest must follow.", "Time to get moving again." }, ziel = { "%s, ready for another round?", "%s: Time to get moving again." } }
texts.CRINGE = { gruppe = { "That could have been handled more gracefully.", "I shall pretend I saw nothing." }, ziel = { "%s, please tell me that wasn't your plan.", "%s: I shall pretend I saw nothing." } }
texts.CRY = { gruppe = { "Sometimes words are simply too small.", "Even tears deserve room to fall." }, ziel = { "%s, forgive me. I need a moment.", "%s: Even tears deserve room to fall." } }
texts.CURIOUS = { gruppe = { "That looks like an interesting story.", "I would love to know how that works." }, ziel = { "%s, tell me more about it.", "%s: I would love to know how that works." } }
