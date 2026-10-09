-- Animation und Ablauf eines RP-Emotes.
local _, addon = ...

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
    addon.PlayEmote(emote)
    if not IsTextAllowed() then
        return false
    end
    local text = addon.GetText(emote)
    if not text then
        print("|cffff0000RP Chat Mod:|r Kein Text für " .. emote .. " vorhanden.")
        return false
    end
    if not addon.SendText(text) then
        return false
    end
    addon.UpdateCooldown()
    return true
end

addon.TryText = addon.DoEmote

function RPChatMod_PlayEmote(emote)
    return addon.PlayEmote(emote)
end
