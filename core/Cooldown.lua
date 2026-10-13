-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Gemeinsame Abklingzeit fuer alle Rollenspieltexte dieser AddOn-Instanz.
local _, addon = ...
local lastTextTime

function addon.CooldownReady()
    return not lastTextTime or GetTime() - lastTextTime >= addon.db.cooldown
end

function addon.GetRemainingCooldown()
    if not lastTextTime then
        return 0
    end
    return math.max(0, addon.db.cooldown - (GetTime() - lastTextTime))
end

function addon.StartCooldown()
    lastTextTime = GetTime()
end

addon.UpdateCooldown = addon.StartCooldown

function RPChatMod_CooldownReady()
    return addon.CooldownReady()
end

function RPChatMod_GetRemainingCooldown()
    return addon.GetRemainingCooldown()
end

function RPChatMod_UpdateCooldown()
    return addon.UpdateCooldown()
end