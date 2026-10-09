-- Chat functionality.
-- ==========================================
-- CHAT
-- ==========================================

function RPChatMod_GetChatChannel()
    local channel = RPChatMod_Settings.chatChannel

    if channel == "SAY" then
        return "SAY"
    end

    if channel == "INSTANCE_CHAT" then
        if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
            return "INSTANCE_CHAT"
        end

        return "SAY"
    end

    if channel == "GROUP" then
        if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
            return "INSTANCE_CHAT"
        end

        if IsInRaid() then
            return "RAID"
        end

        if IsInGroup() then
            return "PARTY"
        end

        return "SAY"
    end

    if channel == "AUTO"
        and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
        return "INSTANCE_CHAT"
    end

    if channel == "AUTO" and IsInRaid() then
        return "RAID"
    end

    if channel == "AUTO" and IsInGroup() then
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