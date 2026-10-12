-- Kanalauswahl und zentraler Versand.
local _, addon = ...

addon.channels = {
    SAY = true, YELL = true, GROUP = true, PARTY = true, RAID = true, INSTANCE_CHAT = true, AUTO = true,
}
local racialLanguageIDs = {
    Human = 7, Dwarf = 6, Gnome = 13, NightElf = 2, Skyborne = 2, Draenei = 35,
    Orc = 1, Troll = 14, Tauren = 3, Scourge = 33, Undead = 33, BloodElf = 10,
}

function addon.GetRacialLanguageID()
    local race = addon.GetPlayerRaceToken()
    local wanted = racialLanguageIDs[race]
    if not wanted then
        return nil
    end
    for index = 1, GetNumLanguages() do
        local _, languageID = GetLanguageByIndex(index)
        if languageID == wanted then
            return languageID
        end
    end
    return nil
end

function addon.GetRacialLanguageName()
    local wanted = addon.GetRacialLanguageID()
    if not wanted then
        return "Standard"
    end
    for index = 1, GetNumLanguages() do
        local name, languageID = GetLanguageByIndex(index)
        if languageID == wanted then
            return name or tostring(languageID)
        end
    end
    return tostring(wanted)
end

local function GetGroupChannel()
    if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
        return "INSTANCE_CHAT"
    end
    if IsInRaid() then
        return "RAID"
    end
    if IsInGroup() then
        return "PARTY"
    end
    return nil
end

function addon.GetChatChannel()
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return nil
    end
    local channel = addon.db.chatChannel
    if not addon.channels[channel] then
        addon.Notify("Ungültiger Chatkanal. Nutzt /rc channel.")
        return nil
    end
    if channel == "AUTO" then
        return GetGroupChannel() or "SAY"
    end
    if channel == "GROUP" then
        local groupChannel = GetGroupChannel()
        if groupChannel then
            return groupChannel
        end
    elseif channel == "SAY" or channel == "YELL" then
        return channel
    elseif channel == "PARTY" and IsInGroup()
        or channel == "RAID" and IsInRaid()
        or channel == "INSTANCE_CHAT" and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
        return channel
    end
    addon.Notify("Der eingestellte Chatkanal ist hier nicht verfügbar. Nutzt /rc channel auto.")
    return nil
end

function addon.SendText(text)
    if type(text) ~= "string" or text == "" then
        addon.Notify("Kein nutzbarer Text vorhanden.")
        return false
    end
    if #text > 255 or text:find("[\r\n]") or text:find("|", 1, true) then
        addon.Notify("Text nicht gesendet: maximal 255 Bytes, keine Zeilenumbrüche oder Chat-Markierungen.")
        return false
    end
    local channel = addon.GetChatChannel()
    if not channel then
        return false
    end
    if not C_ChatInfo or type(C_ChatInfo.SendChatMessage) ~= "function" then
        addon.Notify("Dieser Client stellt keine unterstützte Chat-API bereit.")
        return false
    end
    local languageID = nil
    if channel == "SAY" or channel == "YELL" then
        languageID = addon.GetRacialLanguageID()
    end
    C_ChatInfo.SendChatMessage(text, channel, languageID)
    return true
end

function RPChatMod_GetChatChannel()
    return addon.GetChatChannel()
end

function RPChatMod_SendText(text)
    return addon.SendText(text)
end
