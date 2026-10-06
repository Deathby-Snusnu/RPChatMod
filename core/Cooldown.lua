-- Cooldown functionality.
-- ==========================================
-- COOLDOWN
-- ==========================================

local letzterTextZeit = 0

function RPChatMod_CooldownReady()
    local aktuelleZeit = GetTime()

    return (aktuelleZeit - letzterTextZeit)
        >= RPChatMod_Settings.cooldown
end

function RPChatMod_GetRemainingCooldown()
    local aktuelleZeit = GetTime()
    local verbleibend =
        RPChatMod_Settings.cooldown
        - (aktuelleZeit - letzterTextZeit)

    return math.max(0, verbleibend)
end

function RPChatMod_UpdateCooldown()
    letzterTextZeit = GetTime()
end