-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Additive social voice text pools; all lines are original.
-- Opt-in automatic events are deliberately NOT used.
local _, addon = ...
local locale = addon.localeData.enUS

local function append(pool, lines)
    if type(pool) ~= "table" then return end
    for _, line in ipairs(lines) do
        local exists = false
        for _, old in ipairs(pool) do if old == line then exists = true; break end end
        if not exists then pool[#pool + 1] = line end
    end
end
local function extend(parent, key, ziel, gruppe)
    if type(parent) ~= "table" then return end
    parent[key] = parent[key] or { ziel = {}, gruppe = {} }
    append(parent[key].ziel, ziel)
    append(parent[key].gruppe, gruppe)
end

-- An existing race-specific THANK pool is reachable via /rc thank.
extend(locale.raceTexts.Dwarf, "THANK", { "Much obliged, %s! The next round is mine." }, { "Your help is worth a mine full of ore." })
extend(locale.raceTexts.Gnome, "THANK", { "Splendid, %s! Every instrument agrees." }, { "Thanks! This experiment may actually survive." })
extend(locale.raceTexts.Human, "THANK", { "My sincere thanks, %s." }, { "Help like yours holds a community together." })
extend(locale.raceTexts.NightElf, "THANK", { "May the stars repay your kindness, %s." }, { "My gratitude follows you on the quiet wind." })
extend(locale.raceTexts.Skyborne, "THANK", { "May the sky send you a fair wind, %s." }, { "Your help opens horizons beyond sight." })
extend(locale.raceTexts.Draenei, "THANK", { "May the Light guide your path, %s." }, { "I thank you for your kindness." })
extend(locale.raceTexts.Orc, "THANK", { "Your deed earns respect, %s." }, { "Strength grows when we stand together." })
extend(locale.raceTexts.Troll, "THANK", { "May the loa look kindly on you, %s!" }, { "Ha! That's how you help a friend!" })
extend(locale.raceTexts.Tauren, "THANK", { "May the Earth Mother bless you, %s." }, { "Your aid is as steady as the earth." })
extend(locale.raceTexts.Undead, "THANK", { "Not bad, %s. I'm almost moved." }, { "Thanks. My heart would race if it felt inclined." })
extend(locale.raceTexts.BloodElf, "THANK", { "An exquisitely elegant favor, %s." }, { "Your magic deserves recognition." })

-- Class FAREWELL pools add distinctive departures without a combat event.
extend(locale.classTexts.WARRIOR, "FAREWELL", {}, { "I march ahead. Whoever stays behind can close the door.", "My shield comes along. The weariness stays here." })
extend(locale.classTexts.PALADIN, "FAREWELL", {}, { "May the Light go with you. The hammer goes with me.", "I depart in the Light, and hope to find an open tavern." })
extend(locale.classTexts.HUNTER, "FAREWELL", {}, { "The trail calls. See you at the next campfire.", "I'll scout ahead. If I get lost, ask my companion." })
extend(locale.classTexts.ROGUE, "FAREWELL", {}, { "A pleasure not being seen with you.", "I'm gone. This conversation never took place." })
extend(locale.classTexts.PRIEST, "FAREWELL", {}, { "May light and calm guide your steps.", "I must go. Even silence deserves a moment." })
extend(locale.classTexts.SHAMAN, "FAREWELL", {}, { "The elements are calling. I should listen.", "May the wind guide you safely." })
extend(locale.classTexts.MAGE, "FAREWELL", {}, { "I must go. The kettle is glowing suspiciously again.", "If something explodes: that was a controlled goodbye." })
extend(locale.classTexts.WARLOCK, "FAREWELL", {}, { "I must leave. My shadow is getting impatient.", "Stay well. I brought no spare souls today." })
extend(locale.classTexts.DRUID, "FAREWELL", {}, { "The forest calls me home. Farewell.", "We shall meet when the wind turns the leaves." })

-- Known character combinations override generic race greetings.
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.MAGE = locale.raceClassTexts.Gnome.MAGE or {}
extend(locale.raceClassTexts.Gnome.MAGE, "HELLO", {}, { "Greetings! According to my notes, the crackling is entirely harmless.", "Good day! Has anyone seen my dimensionally stable power socket?" })
extend(locale.raceClassTexts.Gnome.MAGE, "THANK", { "Thank you, %s! My calculations approve wholeheartedly." }, { "Marvelous! Our odds of success are back above zero." })
extend(locale.raceClassTexts.Gnome.MAGE, "FAREWELL", {}, { "I have to go. My experiment is smoking without me.", "Farewell! Please don't touch anything with my handwriting on it." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.HUNTER = locale.raceClassTexts.Dwarf.HUNTER or {}
extend(locale.raceClassTexts.Dwarf.HUNTER, "HELLO", {}, { "Well met! Anyone got a dry place for boots and a companion?", "By my beard! A fine day for fresh tracks." })
extend(locale.raceClassTexts.Dwarf.HUNTER, "THANK", { "Thank you, %s! My companion and I owe you one." }, { "A good ally is worth more than the finest shot. Thanks!" })
extend(locale.raceClassTexts.Dwarf.HUNTER, "FAREWELL", {}, { "The trail calls. If you hear snoring, it's my companion.", "I must move on. Staring won't make the road shorter." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.PALADIN = locale.raceClassTexts.Dwarf.PALADIN or {}
extend(locale.raceClassTexts.Dwarf.PALADIN, "HELLO", {}, { "Stone, steel and Light! Anyone seen the sunrise?", "Well met! I bring blessings, hammer and a mighty thirst." })
extend(locale.raceClassTexts.Dwarf.PALADIN, "THANK", { "Many thanks, %s! May the Light keep your mug full." }, { "A proper blessing! And I say that as a professional." })
extend(locale.raceClassTexts.Dwarf.PALADIN, "FAREWELL", {}, { "The Light calls. Or the tavern. I'll check both.", "Stand firm! And save me a mug." })

-- Wave 2: original race greetings, class cheering and race/class character voices.
extend(locale.raceTexts.Dwarf, "HELLO", { "By the ancestors, %s! Good to see you." }, { "Stone, steel, and a proper greeting!" })
extend(locale.raceTexts.Gnome, "HELLO", { "Welcome, %s! The flashing light is normal." }, { "My greeting machine works. Probably." })
extend(locale.raceTexts.Human, "HELLO", { "Welcome, %s. May your road be safe." }, { "Good company shortens a long journey." })
extend(locale.raceTexts.NightElf, "HELLO", { "May Elune's stars guide you, %s." }, { "The forest listens and bids you welcome." })
extend(locale.raceTexts.Skyborne, "HELLO", { "Fair winds to you, %s!" }, { "The sky has room for new companions." })
extend(locale.raceTexts.Draenei, "HELLO", { "May the Light guide your steps, %s." }, { "Every meeting offers a new beginning." })
extend(locale.raceTexts.Orc, "HELLO", { "May your grip be firm, %s!" }, { "Strength grows when we stand together." })
extend(locale.raceTexts.Troll, "HELLO", { "Hey, %s! The loa seem cheerful today. Hopefully." }, { "Greetings! Don't let the mosquitoes win." })
extend(locale.raceTexts.Tauren, "HELLO", { "May the Earth Mother bear you, %s." }, { "The morning wind brings new roads and visitors." })
extend(locale.raceTexts.Undead, "HELLO", { "Greetings, %s. And I actually mean it." }, { "Welcome. That crack was only my knee." })
extend(locale.raceTexts.BloodElf, "HELLO", { "A graceful arrival, %s. Welcome." }, { "Good company is known by its style." })
extend(locale.classTexts.WARRIOR, "CHEER", {}, { "Hold the line! Courage spreads faster than fear!" })
extend(locale.classTexts.PALADIN, "CHEER", {}, { "The Light shows the path. We walk it together!" })
extend(locale.classTexts.HUNTER, "CHEER", {}, { "Good tracks and clear skies! My companion is ready." })
extend(locale.classTexts.ROGUE, "CHEER", {}, { "A clean plan deserves a quiet cheer." })
extend(locale.classTexts.PRIEST, "CHEER", {}, { "A little hope can be the greatest victory." })
extend(locale.classTexts.SHAMAN, "CHEER", {}, { "Even thunder sounds approving today!" })
extend(locale.classTexts.MAGE, "CHEER", {}, { "Success! All eyebrows remain intact!" })
extend(locale.classTexts.WARLOCK, "CHEER", {}, { "A victory without collateral damage. How unexpected!" })
extend(locale.classTexts.DRUID, "CHEER", {}, { "Even the smallest seedling finds a way!" })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.PALADIN = locale.raceClassTexts.Dwarf.PALADIN or {}
extend(locale.raceClassTexts.Dwarf.PALADIN, "HELLO", { "Well met, %s. My hammer is polished; the mug is not." }, {})
extend(locale.raceClassTexts.Dwarf.PALADIN, "FAREWELL", {}, { "The Light calls. So does the tavern." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.HUNTER = locale.raceClassTexts.Dwarf.HUNTER or {}
extend(locale.raceClassTexts.Dwarf.HUNTER, "HELLO", { "Well met, %s! My companion is inspecting your boots." }, {})
extend(locale.raceClassTexts.Dwarf.HUNTER, "FAREWELL", {}, { "My companion has found fresh tracks. Farewell, and keep your boots dry!" })
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.MAGE = locale.raceClassTexts.Gnome.MAGE or {}
extend(locale.raceClassTexts.Gnome.MAGE, "HELLO", { "Greetings, %s! The crackling is part of the plan." }, {})
extend(locale.raceClassTexts.Gnome.MAGE, "FAREWELL", {}, { "I must go. My portal just swallowed the notes." })
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.WARLOCK = locale.raceClassTexts.Gnome.WARLOCK or {}
extend(locale.raceClassTexts.Gnome.WARLOCK, "HELLO", { "Hello, %s! Please don't feed the little demon." }, {})
extend(locale.raceClassTexts.Gnome.WARLOCK, "FAREWELL", {}, { "I must leave. My imp is keeping a list of mistakes again." })
locale.raceClassTexts.NightElf = locale.raceClassTexts.NightElf or {}
locale.raceClassTexts.NightElf.DRUID = locale.raceClassTexts.NightElf.DRUID or {}
extend(locale.raceClassTexts.NightElf.DRUID, "HELLO", { "The wind knows your name, %s. Welcome." }, {})
extend(locale.raceClassTexts.NightElf.DRUID, "FAREWELL", {}, { "The forest calls for my attention. Farewell." })
locale.raceClassTexts.Human = locale.raceClassTexts.Human or {}
locale.raceClassTexts.Human.WARRIOR = locale.raceClassTexts.Human.WARRIOR or {}
extend(locale.raceClassTexts.Human.WARRIOR, "HELLO", { "Well met, %s. The watch is alert." }, {})
extend(locale.raceClassTexts.Human.WARRIOR, "FAREWELL", {}, { "I'll take the next watch. Get some rest." })
locale.raceClassTexts.Troll = locale.raceClassTexts.Troll or {}
locale.raceClassTexts.Troll.SHAMAN = locale.raceClassTexts.Troll.SHAMAN or {}
extend(locale.raceClassTexts.Troll.SHAMAN, "HELLO", { "The spirits noticed you, %s. A good sign!" }, {})
extend(locale.raceClassTexts.Troll.SHAMAN, "FAREWELL", {}, { "The loa call. Best I answer promptly this time." })
locale.raceClassTexts.Undead = locale.raceClassTexts.Undead or {}
locale.raceClassTexts.Undead.ROGUE = locale.raceClassTexts.Undead.ROGUE or {}
extend(locale.raceClassTexts.Undead.ROGUE, "HELLO", { "Greetings, %s. Didn't hear me coming? Good." }, {})
extend(locale.raceClassTexts.Undead.ROGUE, "FAREWELL", {}, { "I'll be off. Leave the door open; I never knock." })
locale.raceClassTexts.BloodElf = locale.raceClassTexts.BloodElf or {}
locale.raceClassTexts.BloodElf.PRIEST = locale.raceClassTexts.BloodElf.PRIEST or {}
extend(locale.raceClassTexts.BloodElf.PRIEST, "HELLO", { "Welcome, %s. May a gentle light find you." }, {})
extend(locale.raceClassTexts.BloodElf.PRIEST, "FAREWELL", {}, { "The Light remains. I must move on." })

-- Wave 3: rogue and shaman-specific manual social actions.
extend(locale.classTexts.ROGUE, "WAVE", { "%s, we never saw each other. Understood?" }, { "A brief greeting from the shadows will do.", "Even waving discreetly takes practice." })
extend(locale.classTexts.ROGUE, "THANK", { "Thank you, %s. This favor stays between us." }, { "A good alibi is not forgotten.", "A fine favor leaves no tracks." })
extend(locale.classTexts.ROGUE, "SIT", { "Sit, %s. From here we can watch both doors." }, { "The seat against the wall is still free.", "An empty chair reveals more than a full purse." })
extend(locale.classTexts.ROGUE, "LAUGH", { "%s, that is almost as good as a flawless sleight of hand." }, { "I laugh quietly. The guards need not hear everything.", "That joke needs no alibi." })
extend(locale.classTexts.ROGUE, "SALUTE", { "Respect, %s. You have sharp eyes." }, { "A silent greeting can be the sincerest.", "Anyone who protects friends deserves respect." })
extend(locale.classTexts.SHAMAN, "WAVE", { "May the four winds greet you, %s." }, { "Greetings from fire, water, air and earth.", "May the wind carry friendship onward." })
extend(locale.classTexts.SHAMAN, "THANK", { "May the elements thank you, %s." }, { "Your aid has strengthened the balance.", "I owe you more than a dry shelter." })
extend(locale.classTexts.SHAMAN, "SIT", { "Sit, %s. The earth holds us both." }, { "Even a storm needs a quiet moment.", "I listen to the ground. It has many stories." })
extend(locale.classTexts.SHAMAN, "LAUGH", { "Even thunder laughs with you, %s." }, { "The wind carries your laughter far.", "When the stones chuckle, the joke was good." })
extend(locale.classTexts.SHAMAN, "SALUTE", { "The ancestors honor your path, %s." }, { "My respect goes to the living and the spirits.", "May fire and water alike show you respect." })

-- Distinct race/class combinations, without replacing existing lines.
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.ROGUE = locale.raceClassTexts.Gnome.ROGUE or {}
extend(locale.raceClassTexts.Gnome.ROGUE, "HELLO", { "Greetings, %s! My lockpick is mechanically optimized." }, {})
extend(locale.raceClassTexts.Gnome.ROGUE, "THANK", {}, { "If it clicks, it was either the lock or the prototype." })
locale.raceClassTexts.Human = locale.raceClassTexts.Human or {}
locale.raceClassTexts.Human.ROGUE = locale.raceClassTexts.Human.ROGUE or {}
extend(locale.raceClassTexts.Human.ROGUE, "HELLO", { "Good evening, %s. The guards don't know me." }, {})
extend(locale.raceClassTexts.Human.ROGUE, "THANK", {}, { "Some secrets are worth more than silver." })
locale.raceClassTexts.Undead = locale.raceClassTexts.Undead or {}
locale.raceClassTexts.Undead.ROGUE = locale.raceClassTexts.Undead.ROGUE or {}
extend(locale.raceClassTexts.Undead.ROGUE, "HELLO", { "Hello, %s. My bones only rattle in a headwind." }, {})
extend(locale.raceClassTexts.Undead.ROGUE, "THANK", {}, { "I vanish quietly, provided the joints cooperate." })
locale.raceClassTexts.Orc = locale.raceClassTexts.Orc or {}
locale.raceClassTexts.Orc.SHAMAN = locale.raceClassTexts.Orc.SHAMAN or {}
extend(locale.raceClassTexts.Orc.SHAMAN, "HELLO", { "The ancestors greet you, %s. Hear the drums?" }, {})
extend(locale.raceClassTexts.Orc.SHAMAN, "THANK", {}, { "The wind carries voices. I listen." })
locale.raceClassTexts.Tauren = locale.raceClassTexts.Tauren or {}
locale.raceClassTexts.Tauren.SHAMAN = locale.raceClassTexts.Tauren.SHAMAN or {}
extend(locale.raceClassTexts.Tauren.SHAMAN, "HELLO", { "May the Earth Mother bless your path, %s." }, {})
extend(locale.raceClassTexts.Tauren.SHAMAN, "THANK", {}, { "Even in silence, the earth speaks." })
locale.raceClassTexts.Troll = locale.raceClassTexts.Troll or {}
locale.raceClassTexts.Troll.SHAMAN = locale.raceClassTexts.Troll.SHAMAN or {}
extend(locale.raceClassTexts.Troll.SHAMAN, "HELLO", { "The loa greet you, %s. I hope that was friendly." }, {})
extend(locale.raceClassTexts.Troll.SHAMAN, "THANK", {}, { "The loa have spoken. I prefer not to ask questions." })

-- Wave 4: additional original race/class dialogue in three locales.
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.PRIEST = locale.raceClassTexts.Dwarf.PRIEST or {}
extend(locale.raceClassTexts.Dwarf.PRIEST, "HELLO", { "Well met, %s. Even the oldest stone sometimes needs a prayer." }, {})
extend(locale.raceClassTexts.Dwarf.PRIEST, "THANK", { "Thank you, %s. Your kindness outweighs a cart of ore." }, {})
extend(locale.raceClassTexts.Dwarf.PRIEST, "FAREWELL", {}, { "The ancestors keep watch as I take the next step." })
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.WARRIOR = locale.raceClassTexts.Gnome.WARRIOR or {}
extend(locale.raceClassTexts.Gnome.WARRIOR, "HELLO", { "Greetings, %s! My shield was engineered for maximum stability." }, {})
extend(locale.raceClassTexts.Gnome.WARRIOR, "THANK", { "Thanks, %s. You've spared me some elaborate repairs." }, {})
extend(locale.raceClassTexts.Gnome.WARRIOR, "FAREWELL", {}, { "I'm off. If something rattles, it's the armor. Probably." })
locale.raceClassTexts.Human = locale.raceClassTexts.Human or {}
locale.raceClassTexts.Human.PALADIN = locale.raceClassTexts.Human.PALADIN or {}
extend(locale.raceClassTexts.Human.PALADIN, "HELLO", { "Welcome, %s. An oath is only as strong as the deeds behind it." }, {})
extend(locale.raceClassTexts.Human.PALADIN, "THANK", { "My thanks, %s. You have done more than any grand speech." }, {})
extend(locale.raceClassTexts.Human.PALADIN, "FAREWELL", {}, { "The watch changes. My duty does not." })
locale.raceClassTexts.NightElf = locale.raceClassTexts.NightElf or {}
locale.raceClassTexts.NightElf.HUNTER = locale.raceClassTexts.NightElf.HUNTER or {}
extend(locale.raceClassTexts.NightElf.HUNTER, "HELLO", { "Elune's stars have led you here, %s. The tracks are fresh." }, {})
extend(locale.raceClassTexts.NightElf.HUNTER, "THANK", { "Thank you, %s. Even the forest will remember such help." }, {})
extend(locale.raceClassTexts.NightElf.HUNTER, "FAREWELL", {}, { "I follow the wild path where moonlight brushes the leaves." })
locale.raceClassTexts.Skyborne = locale.raceClassTexts.Skyborne or {}
locale.raceClassTexts.Skyborne.DRUID = locale.raceClassTexts.Skyborne.DRUID or {}
extend(locale.raceClassTexts.Skyborne.DRUID, "HELLO", { "The high winds greet you, %s. The earth smells of rain down here." }, {})
extend(locale.raceClassTexts.Skyborne.DRUID, "THANK", { "Thanks, %s. Your help brings sky and roots into harmony." }, {})
extend(locale.raceClassTexts.Skyborne.DRUID, "FAREWELL", {}, { "The wind calls me back to the treetops. Stay safe." })
locale.raceClassTexts.Draenei = locale.raceClassTexts.Draenei or {}
locale.raceClassTexts.Draenei.SHAMAN = locale.raceClassTexts.Draenei.SHAMAN or {}
extend(locale.raceClassTexts.Draenei.SHAMAN, "HELLO", { "Welcome, %s. The elements speak kindly today." }, {})
extend(locale.raceClassTexts.Draenei.SHAMAN, "THANK", { "Your aid honors both the spirits and me, %s." }, {})
extend(locale.raceClassTexts.Draenei.SHAMAN, "FAREWELL", {}, { "The earth awaits my attention. I must answer." })
locale.raceClassTexts.Orc = locale.raceClassTexts.Orc or {}
locale.raceClassTexts.Orc.WARRIOR = locale.raceClassTexts.Orc.WARRIOR or {}
extend(locale.raceClassTexts.Orc.WARRIOR, "HELLO", { "Strength and honor, %s. Our word is our first weapon." }, {})
extend(locale.raceClassTexts.Orc.WARRIOR, "THANK", { "You stood firmly with us, %s. I will not forget." }, {})
extend(locale.raceClassTexts.Orc.WARRIOR, "FAREWELL", {}, { "I march toward the next battle, not the next quarrel." })
locale.raceClassTexts.Troll = locale.raceClassTexts.Troll or {}
locale.raceClassTexts.Troll.ROGUE = locale.raceClassTexts.Troll.ROGUE or {}
extend(locale.raceClassTexts.Troll.ROGUE, "HELLO", { "Hey, %s! No need to count your pockets. Yet." }, {})
extend(locale.raceClassTexts.Troll.ROGUE, "THANK", { "Thanks, %s. The loa and I will keep this quiet." }, {})
extend(locale.raceClassTexts.Troll.ROGUE, "FAREWELL", {}, { "I'm already gone. If you still see me, that's deliberate." })
locale.raceClassTexts.Tauren = locale.raceClassTexts.Tauren or {}
locale.raceClassTexts.Tauren.DRUID = locale.raceClassTexts.Tauren.DRUID or {}
extend(locale.raceClassTexts.Tauren.DRUID, "HELLO", { "The Earth Mother welcomes you, %s. Listen to the grass." }, {})
extend(locale.raceClassTexts.Tauren.DRUID, "THANK", { "Your help makes my hope grow, %s." }, {})
extend(locale.raceClassTexts.Tauren.DRUID, "FAREWELL", {}, { "I follow the turning seasons. We shall meet again." })
locale.raceClassTexts.Undead = locale.raceClassTexts.Undead or {}
locale.raceClassTexts.Undead.PRIEST = locale.raceClassTexts.Undead.PRIEST or {}
extend(locale.raceClassTexts.Undead.PRIEST, "HELLO", { "Greetings, %s. My blessings come with rather cold hands." }, {})
extend(locale.raceClassTexts.Undead.PRIEST, "THANK", { "Thanks, %s. Even a silent heart can recognize sincerity." }, {})
extend(locale.raceClassTexts.Undead.PRIEST, "FAREWELL", {}, { "I must go. Candles burn better when I'm not beside them." })
locale.raceClassTexts.BloodElf = locale.raceClassTexts.BloodElf or {}
locale.raceClassTexts.BloodElf.MAGE = locale.raceClassTexts.BloodElf.MAGE or {}
extend(locale.raceClassTexts.BloodElf.MAGE, "HELLO", { "Welcome, %s. Please mind the arcane alignment lines." }, {})
extend(locale.raceClassTexts.BloodElf.MAGE, "THANK", { "Excellent assistance, %s. My calculations confirm it." }, {})
extend(locale.raceClassTexts.BloodElf.MAGE, "FAREWELL", {}, { "The portal does not wait for good manners. I must leave." })
