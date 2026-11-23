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
