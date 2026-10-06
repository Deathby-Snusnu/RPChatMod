-- Randomization functionality.
-- ==========================================
-- ZUFALLSFUNKTIONEN
-- ==========================================

function RPChatMod_GetRandom(list)
    if not list or #list == 0 then
        return nil
    end

    return list[math.random(1, #list)]
end