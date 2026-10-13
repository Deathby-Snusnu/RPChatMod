-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Poolpriorität und zielabhängige Textauswahl.
local _, addon = ...

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then
        return nil
    end

    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= ""
            and (targetName or not text:find("%s", 1, true)) then
            usable[#usable + 1] = text
        end
    end

    if #usable == 0 then
        return nil
    end

    local text = usable[math.random(#usable)]
    return (text:gsub("%%s", function() return targetName end))
end

function addon.GetTextPool(emote)
    local race = addon.GetPlayerRaceToken()
    local _, class = UnitClass("player")
    local lang = addon.GetOutputLanguage()
    local function Find(language)
        return addon.GetLocalePoolExact(language, "raceClassTexts", race, class, emote)
            or addon.GetLocalePoolExact(language, "classTexts", class, emote)
            or addon.GetLocalePoolExact(language, "raceTexts", race, emote)
            or addon.GetLocalePoolExact(language, "generalTexts", emote)
    end
    return Find(lang) or Find("deDE")
end

function addon.BuildText(emote)
    local pool = addon.GetTextPool(emote)
    if type(pool) ~= "table" then
        return nil
    end
    local targetName = UnitExists("target") and UnitName("target") or nil
    if targetName and type(pool.ziel) == "table" and #pool.ziel > 0 then
        return ChooseText(pool.ziel, targetName)
    end
    return ChooseText(pool.gruppe, targetName)
end

addon.GetText = addon.BuildText
