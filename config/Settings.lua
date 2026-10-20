-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

addon.defaults = {
    outputLanguage = "deDE",

    -- Volkssprache fuer SAY/YELL: auto, on oder off.
    -- auto nutzt die Sprache nur, wenn der Client sie als bekannt meldet.
    -- on erzwingt die bekannte Sprach-ID der Rasse auch bei unvollstaendiger Client-Erkennung.
    -- off verwendet die normale Standardsprache.
    racialLanguageMode = "auto",
    -- In Gruppen fuer /say und /yell Gemeinsprache/Orkisch verwenden.
    groupLanguageMode = "on",
    -- Wahrscheinlichkeit, dass zusätzlich zum Emote
    -- ein Text ausgegeben wird.
    textChance = 30,

    -- Mindestabstand zwischen zwei Textnachrichten.
    cooldown = 20,

    -- Verzögerung zwischen Chatnachricht und Animation.
    emoteDelay = 0.3,

    -- SAY, YELL, GROUP, PARTY, RAID, INSTANCE_CHAT oder AUTO.
    chatChannel = "SAY",

    -- Native WoW-Emotes erzeugen zusaetzlich eigene Standardtexte.
    -- Standardmaessig aus, damit nur RPChatMod-Texte erscheinen.
    nativeEmotes = false,
}
