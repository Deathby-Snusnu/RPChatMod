-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

addon.defaults = {
    outputLanguage = "deDE",
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
