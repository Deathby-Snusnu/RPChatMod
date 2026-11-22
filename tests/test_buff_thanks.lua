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
print("BuffThanks regression tests: OK")
