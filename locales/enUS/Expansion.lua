-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local function appendUnique(list, text)
    if type(list) ~= "table" then return end
    for _, value in ipairs(list) do if value == text then return end end
    list[#list + 1] = text
end

local extras = {
    HELLO = { ziel = {"Well met, %s.", "*greets %s with an attentive nod.*"}, gruppe = {"Well met, everyone.", "*lets a friendly glance travel around the gathering.*"} },
    WAVE = { ziel = {"A greeting to you, %s.", "*gives %s a short, friendly wave.*"}, gruppe = {"A greeting to everyone.", "*waves briefly to those present.*"} },
    SALUTE = { ziel = {"You have my respect, %s.", "*salutes %s with focused respect.*"}, gruppe = {"My respect to you all.", "*salutes the gathering with steady posture.*"} },
    BOW = { ziel = {"My respects, %s.", "*bows respectfully to %s.*"}, gruppe = {"My respects.", "*bows calmly to those present.*"} },
    LAUGH = { ziel = {"Ha! That was good, %s.", "*laughs openly with %s.*"}, gruppe = {"Ha! That was good.", "*cannot quite suppress a brief, genuine laugh.*"} },
    DANCE = { ziel = {"A dance, %s?", "*offers %s a dance with an inviting gesture.*"}, gruppe = {"Who is dancing?", "*breaks into a few cheerful dance steps.*"} },
    SIT = { ziel = {"Sit with me, %s.", "*gestures toward an open place for %s.*"}, gruppe = {"A short rest will do us good.", "*settles down for a brief rest.*"} },
    SLEEP = { ziel = {"Rest well, %s.", "*quietly wishes %s a peaceful night.*"}, gruppe = {"Rest well, everyone.", "*slowly settles in for some rest.*"} },
    THANK = { ziel = {"You have my thanks, %s.", "*inclines the head gratefully toward %s.*"}, gruppe = {"You all have my thanks.", "*offers the gathering a sincere gesture of gratitude.*"} },
    FLIRT = { ziel = {"You make it difficult to look away, %s.", "*gives %s a noticeably longer look than strictly necessary.*"}, gruppe = {"There is a little charm in the air tonight.", "*lets a small smile accompany a glance around the gathering.*"} },
}

local function expandPoolSet(container, seen)
    if type(container) ~= "table" or seen[container] then return end
    seen[container] = true
    for key, pool in pairs(container) do
        if type(pool) == "table" and extras[key] then
            if type(pool.ziel) == "table" then
                for _, text in ipairs(extras[key].ziel) do appendUnique(pool.ziel, text) end
            end
            if type(pool.gruppe) == "table" then
                for _, text in ipairs(extras[key].gruppe) do appendUnique(pool.gruppe, text) end
            end
        end
        if type(pool) == "table" then expandPoolSet(pool, seen) end
    end
end

for _, container in ipairs({
    addon.localeData.enUS.generalTexts,
    addon.localeData.enUS.raceTexts,
    addon.localeData.enUS.classTexts,
    addon.localeData.enUS.raceClassTexts,
}) do
    expandPoolSet(container, {})
end
