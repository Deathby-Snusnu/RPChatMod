-- Emote functionality.
-- ==========================================
-- EMOTES
-- ==========================================

function RPChatMod_PlayEmote(emote)
    if not emote then
        return
    end

    C_Timer.After(
        RPChatMod_Settings.emoteDelay,
        function()
            DoEmote(emote)
        end
    )
end
