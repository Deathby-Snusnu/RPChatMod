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
    HELLO = { ziel = {"Seid gegruesst, %s.", "*begruesst %s mit einem aufmerksamen Nicken.*"}, gruppe = {"Seid gegruesst, miteinander.", "*laesst den Blick freundlich durch die Runde schweifen.*"} },
    WAVE = { ziel = {"Ein Gruss zu Euch, %s.", "*winkt %s mit einer kurzen, freundlichen Geste zu.*"}, gruppe = {"Ein Gruss in die Runde.", "*winkt den Anwesenden kurz zu.*"} },
    SALUTE = { ziel = {"Meinen Respekt, %s.", "*salutiert %s mit ernster Aufmerksamkeit.*"}, gruppe = {"Meinen Respekt an Euch alle.", "*salutiert der Runde mit fester Haltung.*"} },
    BOW = { ziel = {"Meine Hochachtung, %s.", "*verbeugt sich respektvoll vor %s.*"}, gruppe = {"Meine Hochachtung.", "*verbeugt sich ruhig vor den Anwesenden.*"} },
    LAUGH = { ziel = {"Ha! Das war gut, %s.", "*lacht %s offen und herzlich zu.*"}, gruppe = {"Ha! Das war gut.", "*kann sich ein kurzes, ehrliches Lachen nicht verkneifen.*"} },
    DANCE = { ziel = {"Eine Runde, %s?", "*bietet %s mit einer einladenden Geste einen Tanz an.*"}, gruppe = {"Wer tanzt mit?", "*setzt mit sichtbarer Freude zu ein paar Tanzschritten an.*"} },
    SIT = { ziel = {"Setzt Euch zu mir, %s.", "*deutet %s auf einen freien Platz.*"}, gruppe = {"Eine kleine Rast tut gut.", "*macht es sich fuer einen Augenblick bequem.*"} },
    SLEEP = { ziel = {"Ruht gut, %s.", "*wuenscht %s mit leiser Stimme eine ruhige Nacht.*"}, gruppe = {"Ruht gut, alle miteinander.", "*macht sich langsam fuer die Ruhe bereit.*"} },
    THANK = { ziel = {"Habt meinen Dank, %s.", "*neigt %s dankbar den Kopf.*"}, gruppe = {"Habt alle meinen Dank.", "*bedankt sich mit einer aufrichtigen Geste bei der Runde.*"} },
    FLIRT = { ziel = {"Ihr macht es schwer, wegzusehen, %s.", "*schenkt %s einen deutlich laengeren Blick als unbedingt noetig.*"}, gruppe = {"Heute liegt Charme in der Luft.", "*laesst den Blick mit einem kleinen Laecheln durch die Runde schweifen.*"} },
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
    addon.localeData.deDE.generalTexts,
    addon.localeData.deDE.raceTexts,
    addon.localeData.deDE.classTexts,
    addon.localeData.deDE.raceClassTexts,
}) do
    expandPoolSet(container, {})
end
