-- Offline Lua regression harness: lua tests/test_buff_thanks.lua (from repository root)
local addon = {
    ready = true,
    db = { buffThanksEnabled = true, buffThanksChance = 100 },
    CooldownReady = function() return true end,
    GetOutputLanguage = function() return "deDE" end,
    StartCooldown = function() end,
}
local now, sent = 1000, {}
_G.GetTime = function() return now end
_G.UnitGUID = function() return "Player-1-Self" end
_G.InCombatLockdown = function() return false end
_G.C_ChatInfo = {}
addon.SendText = function(message)
    sent[#sent + 1] = message
    return true
end
assert(loadfile("core/BuffThanks.lua"))("RPChatMod", addon)
local function buff(subevent, caster, name, destination, auraType)
    return addon.ProcessBuffThanks(subevent, caster, name, nil,
        destination or "Player-1-Self", "Power Word: Fortitude", auraType or "BUFF")
end
assert(buff("SPELL_AURA_APPLIED", "Player-1-Self", "Self") == false)
assert(buff("SPELL_AURA_APPLIED", "Creature-1-NPC", "NPC") == false)
assert(buff("SPELL_AURA_APPLIED", "Player-2-Friend", "Friend", "Player-9-Other") == false)
assert(buff("SPELL_AURA_REFRESH", "Player-2-Friend", "Friend") == false)
assert(buff("SPELL_AURA_APPLIED", "Player-2-Friend", "Friend", nil, "DEBUFF") == false)
assert(#sent == 0)
assert(buff("SPELL_AURA_APPLIED", "Player-2-Friend", "Friend") == true)
assert(#sent == 1 and sent[1]:find("Friend", 1, true))
assert(buff("SPELL_AURA_APPLIED", "Player-3-Other", "Other") == false)
now = now + 91
assert(buff("SPELL_AURA_APPLIED", "Player-2-Friend", "Friend") == false)
assert(buff("SPELL_AURA_APPLIED", "Player-3-Other", "Other") == true)
now = now + 301
addon.db.buffThanksEnabled = false
assert(buff("SPELL_AURA_APPLIED", "Player-2-Friend", "Friend") == false)
assert(#sent == 2)

-- Exercise the localized race/class flavor without relying on the random seed.
addon.GetPlayerRaceToken = function() return "Dwarf" end
_G.UnitClass = function() return "Paladin", "PALADIN" end
addon.db.buffThanksEnabled = true
now = now + 400
local originalRandom = math.random
math.random = function(upper) return 1 end -- chance, race pick and first sentence
assert(buff("SPELL_AURA_APPLIED", "Player-4-Ally", "Ally") == true)
assert(sent[#sent]:find("Das geht auf meine Rechnung", 1, true))

addon.GetPlayerRaceToken = function() return "Human" end
math.random = function(upper) return upper == 100 and 50 or 1 end -- chance, class pool, first sentence
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-5-Cleric", "Cleric") == true)
assert(sent[#sent]:find("Beistand", 1, true) or sent[#sent]:find("Licht", 1, true))

addon.GetPlayerRaceToken = function() return "Dwarf" end
addon.GetOutputLanguage = function() return "enUS" end
math.random = function(upper) return 1 end
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-6-Allied", "Allied") == true)
assert(sent[#sent]:find("round", 1, true))

addon.GetOutputLanguage = function() return "frFR" end
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-7-Ami", "Ami") == true)
assert(sent[#sent]:find("tournée", 1, true))

-- Verify classes without standalone class AddOns also receive distinct lines.
addon.GetPlayerRaceToken = function() return "Human" end
addon.GetOutputLanguage = function() return "enUS" end
_G.UnitClass = function() return "Rogue", "ROGUE" end
math.random = function(upper) return upper == 100 and 50 or 1 end
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-8-RogueFriend", "RogueFriend") == true)
assert(sent[#sent]:find("saw nothing", 1, true))
_G.UnitClass = function() return "Shaman", "SHAMAN" end
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-9-ShamanFriend", "ShamanFriend") == true)
assert(sent[#sent]:find("elements", 1, true))

-- Exercise the race/class/generic boundaries and fallback redistribution.
addon.GetOutputLanguage = function() return "enUS" end
addon.GetPlayerRaceToken = function() return "Human" end
_G.UnitClass = function() return "Paladin", "PALADIN" end
local function setRoll(roll)
    local randomCall = 0
    math.random = function(upper)
        randomCall = randomCall + 1
        if randomCall == 1 then return 1 end
        if upper == 100 then return roll end
        return 1
    end
end

setRoll(45)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-10-Race45", "Race") == true)
assert(sent[#sent]:find("Stormwind", 1, true))
setRoll(46)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-11-Class46", "Class") == true)
assert(sent[#sent]:find("light", 1, true))
setRoll(80)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-12-Class80", "Class") == true)
assert(sent[#sent]:find("light", 1, true))
setRoll(81)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-13-Generic81", "Generic") == true)
assert(sent[#sent]:find("Many thanks", 1, true))

addon.GetPlayerRaceToken = function() return "Human" end
_G.UnitClass = function() return "Unknown", "UNKNOWN" end
setRoll(80)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-14-RaceOnly", "Race") == true)
assert(sent[#sent]:find("Stormwind", 1, true))
setRoll(81)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-15-RaceFallback", "Race") == true)
assert(sent[#sent]:find("Many thanks", 1, true))

addon.GetPlayerRaceToken = function() return "Unknown" end
_G.UnitClass = function() return "Paladin", "PALADIN" end
setRoll(1)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-16-ClassOnly", "Class") == true)
assert(sent[#sent]:find("light", 1, true))
setRoll(81)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-17-ClassFallback", "Class") == true)
assert(sent[#sent]:find("Many thanks", 1, true))

addon.GetPlayerRaceToken = function() return "Unknown" end
_G.UnitClass = function() return "Unknown", "UNKNOWN" end
setRoll(45)
now = now + 400
assert(buff("SPELL_AURA_APPLIED", "Player-18-NoPools", "Generic") == true)
assert(sent[#sent]:find("Many thanks", 1, true))

math.random = originalRandom
print("BuffThanks regression tests: OK")
