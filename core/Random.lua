-- Randomization functionality.
-- ==========================================
-- ZUFALLSFUNKTIONEN
-- ==========================================

local _, addon = ...

function addon.GetRandom(list)
    if type(list) ~= "table" or #list == 0 then
        return nil
    end
    return list[math.random(1, #list)]
end

function RPChatMod_GetRandom(list)
    return addon.GetRandom(list)
end