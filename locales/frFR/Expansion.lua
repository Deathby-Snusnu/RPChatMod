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
    HELLO = { ziel = {"Bien le bonjour, %s.", "*salue %s d un signe de tete attentif.*"}, gruppe = {"Bien le bonjour a tous.", "*promene un regard amical sur l assemblee.*"} },
    WAVE = { ziel = {"Un salut pour vous, %s.", "*adresse a %s un bref signe amical de la main.*"}, gruppe = {"Un salut a tous.", "*fait un bref signe de la main aux personnes presentes.*"} },
    SALUTE = { ziel = {"Vous avez mon respect, %s.", "*salue %s avec un respect sincere.*"}, gruppe = {"Tout mon respect a vous tous.", "*salue l assemblee d une posture assuree.*"} },
    BOW = { ziel = {"Mes respects, %s.", "*s incline respectueusement devant %s.*"}, gruppe = {"Mes respects.", "*s incline calmement devant les personnes presentes.*"} },
    LAUGH = { ziel = {"Ha ! Bien joue, %s.", "*rit franchement avec %s.*"}, gruppe = {"Ha ! Bien joue.", "*ne peut retenir un bref rire sincere.*"} },
    DANCE = { ziel = {"Une danse, %s ?", "*invite %s a danser d un geste accueillant.*"}, gruppe = {"Qui danse ?", "*esquisse quelques pas de danse avec entrain.*"} },
    SIT = { ziel = {"Asseyez-vous avec moi, %s.", "*indique a %s une place libre.*"}, gruppe = {"Une courte pause nous fera du bien.", "*s installe pour un bref moment de repos.*"} },
    SLEEP = { ziel = {"Reposez-vous bien, %s.", "*souhaite doucement une nuit paisible a %s.*"}, gruppe = {"Reposez-vous bien, tous.", "*se prepare lentement a prendre du repos.*"} },
    THANK = { ziel = {"Vous avez toute ma gratitude, %s.", "*incline la tete avec gratitude vers %s.*"}, gruppe = {"Merci a vous tous.", "*adresse a l assemblee un geste de gratitude sincere.*"} },
    FLIRT = { ziel = {"Vous rendez le regard difficile a detourner, %s.", "*accorde a %s un regard sensiblement plus long que necessaire.*"}, gruppe = {"Il y a un peu de charme dans l air ce soir.", "*laisse un petit sourire accompagner son regard sur l assemblee.*"} },
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
    addon.localeData.frFR.generalTexts,
    addon.localeData.frFR.raceTexts,
    addon.localeData.frFR.classTexts,
    addon.localeData.frFR.raceClassTexts,
}) do
    expandPoolSet(container, {})
end
