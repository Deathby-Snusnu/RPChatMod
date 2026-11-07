-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Einheitliche Poolprioritaet und robuste zielabhaengige Textauswahl.
local _, addon = ...

local function ChooseArray(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then return nil end
    local usable = {}
    for _, text in ipairs(pool) do
        -- WoW already prints its own emote. RPChatMod sends spoken lines only.
        -- Historical *...* pools remain on disk for compatibility but cannot
        -- produce a second /me message through RPChatMod.
        if type(text) == "string" and text ~= ""
            and not (text:sub(1, 1) == "*" and text:sub(-1) == "*") then
            local needsTarget = text:find("%s", 1, true) ~= nil
            if not needsTarget or targetName then
                usable[#usable + 1] = text
            end
        end
    end
    if #usable == 0 then return nil end
    local text = usable[math.random(#usable)]
    if targetName then
        text = text:gsub("%%s", function() return targetName end)
    end
    return text
end

local function ChooseStructured(pool, targetName)
    if type(pool) ~= "table" then return nil end
    if #pool > 0 then return ChooseArray(pool, targetName) end

    -- Mit Ziel zuerst ziel, danach immer gruppe als robuster Fallback.
    if targetName then
        local text = ChooseArray(pool.ziel, targetName)
        if text then return text end
    end
    local text = ChooseArray(pool.gruppe, targetName)
    if text then return text end

    -- Ohne Ziel kann ein ziel-Pool trotzdem zielunabhaengige Eintraege enthalten.
    return ChooseArray(pool.ziel, targetName)
end

function addon.GetTextPool(emote)
    local race = addon.GetPlayerRaceToken()
    local _, class = UnitClass("player")
    local lang = addon.GetOutputLanguage()

    local function Find(language)
        -- Einheitliche Prioritaet fuer soziale RP-Texte:
        -- Rasse+Klasse -> Rasse -> Klasse -> Allgemein.
        return addon.GetLocalePoolExact(language, "raceClassTexts", race, class, emote)
            or addon.GetLocalePoolExact(language, "raceTexts", race, emote)
            or addon.GetLocalePoolExact(language, "classTexts", class, emote)
            or addon.GetLocalePoolExact(language, "generalTexts", emote)
    end

    return Find(lang) or Find("deDE")
end

function addon.BuildText(emote)
    local name = UnitExists("target") and UnitName("target") or nil
    local race = addon.GetPlayerRaceToken()
    local _, class = UnitClass("player")
    local lang = addon.GetOutputLanguage()
    -- Try specific speech pools first, but skip legacy pools containing only
    -- *emote* descriptions. Do not override or rewrite user-authored files.
    for _, language in ipairs(lang == "deDE" and {"deDE"} or {lang, "deDE"}) do
        local data = addon.localeData[language]
        if data then
            local function Try(pool)
                return ChooseStructured(pool, name)
            end
            local line = Try(addon.GetLocalePoolExact(language, "raceClassTexts", race, class, emote))
                or Try(addon.GetLocalePoolExact(language, "raceTexts", race, emote))
                or Try(addon.GetLocalePoolExact(language, "classTexts", class, emote))
                or Try(addon.GetLocalePoolExact(language, "generalTexts", emote))
            if line then return line end
        end
    end
    return nil
end

addon.ChooseStructuredText = ChooseStructured
addon.GetText = addon.BuildText
