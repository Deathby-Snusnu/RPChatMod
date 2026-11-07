-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Animation und Ablauf eines RP-Emotes.
local _, addon = ...

local EMOTE_ALIASES = {
    APPLAUSE = "APPLAUD", BRAVO = "APPLAUD", CLAP = "APPLAUD",
    APOLOGIZE = "SORRY", MAD = "ANGRY", LOL = "LAUGH", ROFL = "LAUGH",
    BYE = "FAREWELL", GOODBYE = "FAREWELL",
    GREET = "HELLO", GREETINGS = "HELLO", HI = "HELLO",
    THANKS = "THANK", TY = "THANK", THANKYOU = "THANK",
    NOD = "YES", CONGRATULATE = "CONGRATS", CONGRATULATIONS = "CONGRATS",
    LAY = "SLEEP", LAYDOWN = "SLEEP", LIEDOWN = "SLEEP",

}
function addon.ResolveEmoteAlias(emote)
    return EMOTE_ALIASES[emote] or emote
end

function addon.PlayEmote(emote)
    if not emote then
        return
    end
    C_Timer.After(addon.defaults.emoteDelay, function()
        DoEmote(emote)
    end)
end

local function IsTextAllowed()
    if not addon.CooldownReady() then
        UIErrorsFrame:AddMessage(
            string.format(
                "RP-Text auf Abklingzeit. Noch %.1fs.",
                addon.GetRemainingCooldown()
            ),
            1.0, 0.1, 0.1, 1.0
        )
        return false
    end
    if math.random(1, 100) > addon.db.textChance then
        UIErrorsFrame:AddMessage(
            "RP-Text nicht ausgelöst.",
            1.0, 0.8, 0.0, 1.0
        )
        return false
    end
    return true
end

function addon.DoEmote(emote)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return false
    end
    if type(emote) ~= "string" or emote == "" then
        print("|cffffd100RP Chat Mod:|r Kein Emote angegeben.")
        return false
    end
    emote = emote:upper()
    local key = addon.ResolveEmoteAlias(emote)
    if addon.db.nativeEmotes then
        -- The client performs the real emote (animation + standard emote line).
        -- Addon speech is independent of the client's native message.
        addon.PlayEmote(emote)
    end
    if not IsTextAllowed() then
        return false
    end
    local text = addon.BuildText(key)
    if not text then
        print("|cffff0000RP Chat Mod:|r Kein Text für " .. emote .. " vorhanden.")
        return false
    end
    if not addon.SendText(text) then
        return false
    end
    addon.StartCooldown()
    return true
end

addon.TryText = addon.DoEmote

function RPChatMod_PlayEmote(emote)
    return addon.PlayEmote(emote)
end
