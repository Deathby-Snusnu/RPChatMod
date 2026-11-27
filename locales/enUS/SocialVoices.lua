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
extend(locale.raceClassTexts.Dwarf.HUNTER, "FAREWELL", {}, { "The trail calls. If you hear snoring, it's my companion." })
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
