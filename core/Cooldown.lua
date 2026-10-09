-- Gemeinsame Abklingzeit fuer alle Rollenspieltexte dieser AddOn-Instanz.
local _, addon = ...
local lastTextTime

function addon.CooldownReady()
    return not lastTextTime or GetTime() - lastTextTime >= addon.db.cooldown
end

function addon.GetRemainingCooldown()
    if not lastTextTime then
        return 0
    end
    return math.max(0, addon.db.cooldown - (GetTime() - lastTextTime))
end

function addon.StartCooldown()
    lastTextTime = GetTime()
end

addon.UpdateCooldown = addon.StartCooldown

function RPChatMod_CooldownReady()
    return addon.CooldownReady()
end

function RPChatMod_GetRemainingCooldown()
    return addon.GetRemainingCooldown()
end

function RPChatMod_UpdateCooldown()
    return addon.UpdateCooldown()
end