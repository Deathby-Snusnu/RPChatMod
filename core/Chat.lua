-- Chat functionality.
-- ==========================================
-- CHAT
-- ==========================================

function RPChatMod_GetChatChannel()
    if RPChatMod_Settings.chatChannel ~= "AUTO" then
        return RPChatMod_Settings.chatChannel
    end

    if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
        return "INSTANCE_CHAT"
    end

    if IsInGroup() then
        return "PARTY"
    end

    return "SAY"
end


function RPChatMod_SendText(text)
    if not text then
        return
    end

    local channel = RPChatMod_GetChatChannel()

    C_ChatInfo.SendChatMessage(
        text,
        channel
    )
end