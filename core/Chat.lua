-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Kanalauswahl und zentraler Versand.
local _, addon = ...

addon.channels = {
    SAY = true, YELL = true, GROUP = true, PARTY = true, RAID = true, INSTANCE_CHAT = true, AUTO = true,
}
local racialLanguageIDs = {
    Human = 7, Dwarf = 6, Gnome = 13, NightElf = 2, Skyborne = 2, Draenei = 35,
    Orc = 1, Troll = 14, Tauren = 3, Scourge = 33, Undead = 33, BloodElf = 10,
}

local fallbackLanguageNames = {
    Human = "Gemeinsprache", Dwarf = "Zwergisch", Gnome = "Gnomisch",
    NightElf = "Darnassisch", Skyborne = "Darnassisch", Draenei = "Draenei",
    Orc = "Orcisch", Troll = "Trollisch", Tauren = "Taur-ahe",
    Scourge = "Gossensprache", Undead = "Gossensprache", BloodElf = "Thalassisch",
}

local function GetKnownLanguageByID(wanted)
    if not wanted or type(GetNumLanguages) ~= "function" or type(GetLanguageByIndex) ~= "function" then
        return nil, nil
    end
    for index = 1, GetNumLanguages() do
        local name, languageID = GetLanguageByIndex(index)
        if languageID == wanted then
            return languageID, name
        end
    end
    return nil, nil
end

function addon.GetRacialLanguageID(force)
    local race = addon.GetPlayerRaceToken()
    local wanted = racialLanguageIDs[race]
    if not wanted then
        return nil
    end
    local languageID = GetKnownLanguageByID(wanted)
    if languageID then
        return languageID
    end
    if force then
        return wanted
    end
    return nil
end

function addon.GetRacialLanguageName(force)
    local race = addon.GetPlayerRaceToken()
    local wanted = racialLanguageIDs[race]
    if not wanted then
        return "Standard"
    end
    local _, name = GetKnownLanguageByID(wanted)
    if name then
        return name
    end
    if force then
        return fallbackLanguageNames[race] or ("Sprach-ID " .. tostring(wanted))
    end
    return "Standard"
end

function addon.GetRacialLanguageMode()
    return addon.db and addon.db.racialLanguageMode or addon.defaults.racialLanguageMode
end

function addon.GetChatLanguageID(channel)
    if channel ~= "SAY" and channel ~= "YELL" then
        return nil
    end
    local mode = addon.GetRacialLanguageMode()
    if mode == "off" then
        return nil
    end
    return addon.GetRacialLanguageID(mode == "on")
end

function addon.GetRacialLanguageDebugInfo()
    local race = addon.GetPlayerRaceToken() or "<nil>"
    local wanted = racialLanguageIDs[race]
    local knownID, knownName = GetKnownLanguageByID(wanted)
    return race, wanted, knownID, knownName
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

local function PrepareText(text)
    local startsWithStar = text:sub(1, 1) == "*"
    local endsWithStar = text:sub(-1) == "*"

    if startsWithStar ~= endsWithStar then
        addon.Notify("Text nicht gesendet: fehlerhafte Emote-Markierung.")
        return nil, nil
    end

    if startsWithStar and endsWithStar then
        local emoteText = text:sub(2, -2):match("^%s*(.-)%s*$")
        if not emoteText or emoteText == "" then
            addon.Notify("Text nicht gesendet: leeres Emote.")
            return nil, nil
        end
        return emoteText, true
    end

    return text, false
end

function addon.SendText(text)
    if type(text) ~= "string" or text == "" then
        addon.Notify("Kein nutzbarer Text vorhanden.")
        return false
    end

    local message, isEmote = PrepareText(text)
    if not message then
        return false
    end

    if #message > 255 or message:find("[\r\n]") or message:find("|", 1, true) then
        addon.Notify("Text nicht gesendet: maximal 255 Bytes, keine Zeilenumbrüche oder Chat-Markierungen.")
        return false
    end

    -- *...* ist eine beschreibende RP-Aktion und wird immer als /me ausgegeben.
    -- Nur gesprochene Texte verwenden den konfigurierten Chatkanal/Volkssprache.
    local channel = isEmote and "EMOTE" or addon.GetChatChannel()
    if not channel then
        return false
    end
    if not C_ChatInfo or type(C_ChatInfo.SendChatMessage) ~= "function" then
        addon.Notify("Dieser Client stellt keine unterstützte Chat-API bereit.")
        return false
    end

    local languageID = addon.GetChatLanguageID(channel)
    C_ChatInfo.SendChatMessage(message, channel, languageID)
    return true
end

function RPChatMod_GetChatChannel()
    return addon.GetChatChannel()
end

function RPChatMod_SendText(text)
    return addon.SendText(text)
end
