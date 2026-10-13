-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

RPChatMod = addon
addon.ready = false

SLASH_RPCHATMOD1 = "/rc"
SlashCmdList["RPCHATMOD"] = addon.HandleCommand

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function()
    addon.InitializeDatabase()
    addon.ready = true
    print("|cffc79c6eRP Chat Mod|r geladen. Befehl: |cffffd100/rc|r")
end)
