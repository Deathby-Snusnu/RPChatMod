-- SPDX-License-Identifier: MPL-2.0
-- Optional, opt-in thank-you for helpful buffs received from another player.
-- The Classic/Forever combat-log API must be confirmed in game.
local _, addon = ...

local lastGlobal, lastByCaster = nil, {}
local GLOBAL_COOLDOWN = 90
local CASTER_COOLDOWN = 300
local thanks = {
    deDE = {
        "Habt Dank, %s! Das kommt zur rechten Zeit.",
        "Besten Dank, %s. Das merk ich mir!",
        "Euer Beistand ehrt Euch, %s.",
        "Auf Euch ist Verlass, %s. Danke!",
        "Das hilft! Möge Euer Krug niemals leer werden, %s.",
    },
    enUS = {
        "Many thanks, %s! Just what I needed.",
        "Much obliged, %s. I won't forget this.",
        "Your help is appreciated, %s.",
        "I can count on you, %s. Thank you!",
        "That helps! May your mug never run dry, %s.",
    },
    frFR = {
        "Grand merci, %s ! Cela tombe à point.",
        "Je vous suis redevable, %s.",
        "Votre aide m'honore, %s.",
        "Je peux compter sur vous, %s. Merci !",
        "Voilà qui aide ! Que votre chope ne soit jamais vide, %s.",
    },
}

local function IsPlayerSource(sourceGUID, sourceFlags)
    if type(sourceGUID) ~= "string" or not sourceGUID:match("^Player%-") then
        return false
    end
    local band = bit and bit.band or bit32 and bit32.band
    if band and type(sourceFlags) == "number" and COMBATLOG_OBJECT_TYPE_PLAYER then
        return band(sourceFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0
    end
    -- On beta clients without flag constants, a Player-* GUID remains necessary.
    return true
end

function addon.ProcessBuffThanks(subevent, sourceGUID, sourceName, sourceFlags,
                                 destGUID, spellName, auraType)
    if not addon.ready or not addon.db or not addon.db.buffThanksEnabled then return false end
    if subevent ~= "SPELL_AURA_APPLIED" or auraType ~= "BUFF" then return false end
    if type(UnitGUID) ~= "function" or destGUID ~= UnitGUID("player") then return false end
    if not IsPlayerSource(sourceGUID, sourceFlags) or sourceGUID == destGUID then return false end
    if type(sourceName) ~= "string" or sourceName == "" then return false end
    if type(InCombatLockdown) == "function" and InCombatLockdown() then return false end
    local now = type(GetTime) == "function" and GetTime() or nil
    if not now then return false end
    if lastGlobal and now - lastGlobal < GLOBAL_COOLDOWN then return false end
    if lastByCaster[sourceGUID] and now - lastByCaster[sourceGUID] < CASTER_COOLDOWN then return false end
    if type(addon.CooldownReady) == "function" and not addon.CooldownReady() then return false end
    local chance = addon.db.buffThanksChance or 0
    if math.random(100) > chance then return false end
    -- Realm-qualified combat-log names are shortened, never used as chat markup.
    local name = sourceName:match("^([^%-]+)") or sourceName
    if not name:match("^[%a\128-\255][%a\128-\255']*$") then return false end
    local language = type(addon.GetOutputLanguage) == "function" and addon.GetOutputLanguage() or "deDE"
    local pool = thanks[language] or thanks.deDE
    local message = string.format(pool[math.random(#pool)], name)
    if not addon.SendText(message) then return false end
    lastGlobal, lastByCaster[sourceGUID] = now, now
    if type(addon.StartCooldown) == "function" then addon.StartCooldown() end
    return true
end

function addon.StartBuffThanksListener()
    if addon.buffThanksFrame or type(CreateFrame) ~= "function" then return end
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    frame:SetScript("OnEvent", function()
        if not addon.db or not addon.db.buffThanksEnabled then return end
        if type(CombatLogGetCurrentEventInfo) ~= "function" then return end
        local _, subevent, _, sourceGUID, sourceName, sourceFlags, _,
              destGUID, _, _, _, _, spellName, _, auraType = CombatLogGetCurrentEventInfo()
        addon.ProcessBuffThanks(subevent, sourceGUID, sourceName, sourceFlags,
                                destGUID, spellName, auraType)
    end)
    addon.buffThanksFrame = frame
end
