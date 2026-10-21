-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

local channelAliases = {
    say = "SAY",
    yell = "YELL",
    group = "GROUP",
    instance = "INSTANCE_CHAT",
    auto = "AUTO",
    party = "PARTY",
    raid = "RAID",
    instance_chat = "INSTANCE_CHAT",
}

-- Dynamic text-key listing, including keys added through RP Text Studio.
-- "list": usable for this character; "list racial": racial keys for this race;
-- "list all": all races/classes, with source labels.
local function ShowDynamicList(mode, kind)
    if mode ~= "" and mode ~= "racial" and mode ~= "all" then
        addon.Notify("Benutzung: /" .. kind .. " list [racial|all]")
        return
    end
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    local _, class = UnitClass("player")
    local found = {}
    local function Add(key, source)
        if type(key) ~= "string" then return end
        if not found[key] then found[key] = {} end
        found[key][source] = true
    end
    local function Flat(pool, source)
        if type(pool) ~= "table" then return end
        for key, val in pairs(pool) do
            if type(val) == "table" then Add(key, source) end
        end
    end
    local function Racial(pool, source)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for raceKey, values in pairs(pool) do Flat(values, source .. ":" .. raceKey) end
        else
            Flat(pool[race], source .. ":" .. tostring(race))
        end
    end
    local function Class(pool, source)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for classKey, values in pairs(pool) do Flat(values, source .. ":" .. classKey) end
        else
            Flat(pool[class], source .. ":" .. tostring(class))
        end
    end
    local function RaceClass(pool)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for raceKey, classes in pairs(pool) do
                for classKey, values in pairs(classes) do
                    Flat(values, "Rasse+Klasse:" .. raceKey .. "/" .. classKey)
                end
            end
        else
            local classes = pool[race]
            if type(classes) == "table" then Flat(classes[class], "Rasse+Klasse:" .. tostring(race) .. "/" .. tostring(class)) end
        end
    end
    local lang = addon.GetOutputLanguage and addon.GetOutputLanguage() or "deDE"
    for _, locale in ipairs({lang, "deDE"}) do
        local data = addon.localeData and addon.localeData[locale]
        if type(data) == "table" then
            if mode ~= "racial" then
                if kind == "prp" then
                    for _, tableName in ipairs({"Blessings", "Auras", "Seals", "Abilities"}) do Flat(data[tableName], tableName) end
                    if type(data.GreaterBlessings) == "table" then
                        for key, val in pairs(data.GreaterBlessings) do
                            if type(val) == "table" then Add("GREATER_" .. key, "GreaterBlessings") end
                        end
                    end
                elseif kind == "rc" then
                    Flat(data.generalTexts, "Allgemein")
                    Class(data.classTexts, "Klasse")
                    RaceClass(data.raceClassTexts)
                else
                    Flat(data.texts, "Allgemein")
                end
            end
            if kind == "prp" then Racial(data.Racial, "Rasse")
            elseif kind == "rc" then Racial(data.raceTexts, "Rasse")
            else Racial(data.racial, "Rasse") end
        end
    end
    if mode ~= "racial" and type(addon.db) == "table" then Flat(addon.db.personalTexts, "Persoenlich") end
    local keys = {}
    for key in pairs(found) do keys[#keys + 1] = key end
    table.sort(keys)
    addon.Notify("Textschluessel (" .. (mode == "" and "aktuell" or mode) .. "): " .. #keys)
    if #keys == 0 then addon.Notify("Keine passenden Textschluessel gefunden.") end
    for _, key in ipairs(keys) do
        if mode == "all" then
            local sources = {}
            for source in pairs(found[key]) do sources[#sources + 1] = source end
            table.sort(sources)
            addon.Notify(key .. " [" .. table.concat(sources, ", ") .. "]")
        else
            addon.Notify(key)
        end
    end
end

local function ShowHelp()
    print("|cffc79c6eRP Chat Mod|r")
    for _, emote in ipairs({
        "hello", "wave", "salute", "bow", "laugh",
        "dance", "sit", "sleep", "thank", "flirt",
    }) do
        print("/rc " .. emote)
    end
    print("/rc chance 30")
    print("/rc cooldown 20")
    print("/rc help | list [racial|all] | status")
    print("/rc channel say|yell|group|party|raid|instance|auto")
    print("/rc language deDE|enUS|frFR")
    print("/rc native on|off")
    print("/rc racelanguage auto|on|off")
    print("/rc racelangdebug")
    print("/rc grouplanguage on|off")
    print("/rc languagestatus")
    print("/rc langdebug")
end

local function SetChance(argument)
    local value = tonumber(argument)
    if not argument:match("^%d+$") or not addon.ValidNumber(value, 100) then
        print("Benutzung: /rc chance 0-100")
        return
    end
    addon.SetSetting("textChance", value)
    print(string.format("|cffc79c6eRP Chat Mod:|r Textchance: %d%%", value))
end

local function SetCooldown(argument)
    local value = tonumber(argument)
    if not argument:match("^%d+$") or not addon.ValidNumber(value, 3600) then
        print("Benutzung: /rc cooldown <ganze Zahl 0-3600>")
        return
    end
    addon.SetSetting("cooldown", value)
    print(string.format("|cffc79c6eRP Chat Mod:|r Cooldown: %d Sekunden", value))
end

local function SetChannel(argument)
    if argument == "" then
        addon.Notify("Aktueller Chatkanal: " .. addon.db.chatChannel)
        return
    end
    local channel = channelAliases[string.lower(argument or "")]
    if not channel then
        print("Benutzung: /rc channel say|yell|group|party|raid|instance|auto")
        return
    end
    addon.SetSetting("chatChannel", channel)
    print(string.format(
        "|cffc79c6eRP Chat Mod:|r Chatkanal: %s",
        string.lower(argument)
    ))
end

local function HandleLanguage(argument)
    if argument == "" then
        addon.Notify("Ausgabesprache: " .. addon.GetOutputLanguage() .. " (deDE, enUS, frFR)")
        return
    end
    local aliases = { de = "deDE", dede = "deDE", deDE = "deDE", en = "enUS", enus = "enUS", enUS = "enUS", fr = "frFR", frfr = "frFR", frFR = "frFR" }
    local language = aliases[argument] or aliases[string.lower(argument or "")]
    if not language or not addon.outputLanguages[language] then
        addon.Notify("Sprachen: deDE, enUS, frFR")
        return
    end
    local ok, reason = addon.SetOutputLanguage(language)
    if not ok then
        if reason == "not_loaded" then
            addon.Notify("Sprachdateien fuer " .. language .. " wurden nicht geladen. Bitte AddOn-Dateien/TOC pruefen.")
        else
            addon.Notify("Sprache konnte nicht aktiviert werden.")
        end
        return
    end
    addon.Notify("Ausgabesprache: " .. language .. " (" .. addon.outputLanguageNames[language] .. ")")
end

local function ShowLanguageDebug()
    local selected = addon.db and addon.db.outputLanguage or "<nil>"
    local active = addon.GetOutputLanguage()
    addon.Notify("Sprach-Debug: gespeichert=" .. tostring(selected) .. " | aktiv=" .. tostring(active))
    for _, lang in ipairs({ "deDE", "enUS", "frFR" }) do
        local loaded = addon.IsLocaleLoaded(lang) and "ja" or "nein"
        local thank = addon.GetLocalePoolExact(lang, "generalTexts", "THANK") and "ja" or "nein"
        addon.Notify(lang .. ": geladen=" .. loaded .. " | General.THANK=" .. thank)
    end
end


local function SetNativeEmotes(argument)
    local value = string.lower(argument or "")
    if value == "on" then
        addon.SetSetting("nativeEmotes", true)
        addon.Notify("Native WoW-Emotes: an")
    elseif value == "off" then
        addon.SetSetting("nativeEmotes", false)
        addon.Notify("Native WoW-Emotes: aus")
    else
        addon.Notify("Gruppensprache (SAY/YELL): " .. addon.GetGroupLanguageMode())
        addon.Notify("Native WoW-Emotes: " .. (addon.db.nativeEmotes and "an" or "aus") .. ". Benutzung: /rc native on|off")
    end
end


local function SetRacialLanguage(argument)
    local value = string.lower(argument or "")
    if value == "" then
        addon.Notify("Volkssprache: " .. addon.GetRacialLanguageMode() .. " | erkannt: " .. addon.GetRacialLanguageName(addon.GetRacialLanguageMode() == "on"))
        return
    end
    if value ~= "auto" and value ~= "on" and value ~= "off" then
        addon.Notify("Benutzung: /rc racelanguage auto|on|off")
        return
    end
    addon.SetSetting("racialLanguageMode", value)
    local force = value == "on"
    addon.Notify("Volkssprache: " .. value .. " | erkannt: " .. addon.GetRacialLanguageName(force))
end

local function ShowRacialLanguageDebug()
    local race, wanted, knownID, knownName = addon.GetRacialLanguageDebugInfo()
    addon.Notify("Volkssprachen-Debug: Rasse=" .. tostring(race)
        .. " | Modus=" .. tostring(addon.GetRacialLanguageMode()))
    addon.Notify("Erwartete Sprach-ID=" .. tostring(wanted)
        .. " | vom Client bekannt=" .. tostring(knownID)
        .. " | Name=" .. tostring(knownName))
    if type(GetNumLanguages) == "function" and type(GetLanguageByIndex) == "function" then
        local available = {}
        for index = 1, GetNumLanguages() do
            local name, languageID = GetLanguageByIndex(index)
            available[#available + 1] = tostring(name) .. "(" .. tostring(languageID) .. ")"
        end
        addon.Notify("Verfuegbare Sprachen: " .. (#available > 0 and table.concat(available, ", ") or "keine"))
    end
end

local function SetGroupLanguage(argument)
    local value = string.lower(argument or "")
    if value == "on" or value == "off" then
        addon.SetSetting("groupLanguageMode", value)
    elseif value ~= "" then
        addon.Notify("Benutzung: /rc grouplanguage on|off")
        return
    end
    addon.Notify("Gruppensprache fuer SAY/YELL: " .. addon.GetGroupLanguageMode())
end

local function ShowEffectiveLanguage()
    local grouped = type(IsInGroup) == "function" and
        (IsInGroup() or (LE_PARTY_CATEGORY_INSTANCE and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)))
    local channel = addon.GetChatChannel()
    local id = channel and addon.GetChatLanguageID(channel) or nil
    addon.Notify("Gruppe: " .. (grouped and "ja" or "nein")
        .. " | Kanal: " .. tostring(channel)
        .. " | Sprach-ID: " .. tostring(id or "Clientstandard"))
    addon.Notify("Volkssprache: " .. addon.GetRacialLanguageMode()
        .. " | Gruppensprache: " .. addon.GetGroupLanguageMode())
end

local commandHandlers = {
    language = HandleLanguage,
    lang = HandleLanguage,
    langdebug = ShowLanguageDebug,
    chance = SetChance,
    cooldown = SetCooldown,
    channel = SetChannel,
    native = SetNativeEmotes,
    racelanguage = SetRacialLanguage,
    racelang = SetRacialLanguage,
    racelangdebug = ShowRacialLanguageDebug,
    grouplanguage = SetGroupLanguage,
    grouplang = SetGroupLanguage,
    languagestatus = ShowEffectiveLanguage,
}




function addon.HandleCommand(message)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return
    end
    local command, argument = string.match(
        message or "", "^%s*(%S+)%s*(.-)%s*$"
    )
    command = command and command:lower() or "help"
    argument = argument or ""
    if command == "help" and argument == "" then
        ShowHelp()
        return
    end
    if command == "list" then
        ShowDynamicList(argument:lower(), "rc")
        return
    end
    if command == "status" and argument == "" then
        addon.Notify(string.format("Chance: %g%% | Cooldown: %gs | Kanal: %s | Ausgabe: %s",
            addon.db.textChance, addon.db.cooldown, addon.db.chatChannel, addon.GetOutputLanguage()))
        local raceMode = addon.GetRacialLanguageMode()
        addon.Notify("Volkssprache (SAY/YELL): " .. raceMode .. " | " .. addon.GetRacialLanguageName(raceMode == "on"))
        addon.Notify("Gruppensprache (SAY/YELL): " .. addon.GetGroupLanguageMode())
        addon.Notify("Native WoW-Emotes: " .. (addon.db.nativeEmotes and "an" or "aus"))
        return
    end
    local handler = commandHandlers[command]
    if handler then
        handler(argument)
        return
    end
    if argument ~= "" then
        addon.Notify("Benutzung: /rc <emote>. /rc help zeigt die Befehle.")
        return
    end
    addon.DoEmote(command)
end
