-- Addon settings.
-- ==========================================
-- RP CHAT MOD
-- EINSTELLUNGEN
-- ==========================================

local _, addon = ...

addon.defaults = {

    -- Wahrscheinlichkeit, dass zusätzlich zum Emote
    -- ein Text ausgegeben wird.
    textChance = 30,

    -- Mindestabstand zwischen zwei Textnachrichten.
    cooldown = 20,

    -- Verzögerung zwischen Chatnachricht und Animation.
    emoteDelay = 0.3,

    -- SAY, GROUP, PARTY, RAID, INSTANCE_CHAT oder AUTO.
    chatChannel = "SAY",
}
