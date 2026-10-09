-- Addon entry point.

-- ==========================================
-- RP CHAT MOD
-- HAUPTDATEI
-- ==========================================

local ADDON_NAME = "RPChatMod"

RPChatMod_CharacterDB = RPChatMod_CharacterDB or {}

if RPChatMod_CharacterDB.textChance == nil then
    RPChatMod_CharacterDB.textChance =
        RPChatMod_Settings.textChance
end

if RPChatMod_CharacterDB.cooldown == nil then
    RPChatMod_CharacterDB.cooldown =
        RPChatMod_Settings.cooldown
end

if RPChatMod_CharacterDB.chatChannel == nil then
    RPChatMod_CharacterDB.chatChannel =
        RPChatMod_Settings.chatChannel
end

RPChatMod_Settings.textChance =
    RPChatMod_CharacterDB.textChance

RPChatMod_Settings.cooldown =
    RPChatMod_CharacterDB.cooldown

RPChatMod_Settings.chatChannel =
    RPChatMod_CharacterDB.chatChannel


-- ==========================================
-- VOLKSSPRACHEN
-- ==========================================

local RPChatMod_RacialLanguages = {
    ["Human"]    = "Gemeinsprache",
    ["Dwarf"]    = "Zwergisch",
    ["Gnome"]    = "Gnomisch",
    ["NightElf"] = "Darnassisch",

    ["Orc"]      = "Orcisch",
    ["Troll"]    = "Trollisch",
    ["Tauren"]   = "Taurahe",
    ["Scourge"]  = "Gossensprache",
    ["BloodElf"] = "Thalassisch",
}


-- ==========================================
-- VOLKSSPRACHE ERMITTELN
-- ==========================================

local function RPChatMod_GetRacialLanguageID()

    local _, race = UnitRace("player")

    local languageName =
        RPChatMod_RacialLanguages[race]

    if not languageName then
        return nil
    end

    for i = 1, GetNumLanguages() do

        local language, languageID =
            GetLanguageByIndex(i)

        if language == languageName then
            return languageID
        end
    end

    return nil
end


-- ==========================================
-- TEXT SENDEN
-- ==========================================

function RPChatMod_SendText(text)

    local chatChannel =
        RPChatMod_GetChatChannel()

    -- Volkssprache nur bei SAY/YELL verwenden.
    local languageID = nil

    if chatChannel == "SAY"
        or chatChannel == "YELL" then

        languageID =
            RPChatMod_GetRacialLanguageID()
    end

    C_ChatInfo.SendChatMessage(
        text,
        chatChannel,
        languageID
    )
end


-- ==========================================
-- TEXTPOOL ERMITTELN
-- ==========================================

local function GetTextPool(emote)

    local _, race = UnitRace("player")
    local _, class = UnitClass("player")

    -- --------------------------------------
    -- 1. RASSE + KLASSE
    -- --------------------------------------

    if RPChatMod_RaceClassTexts[race]
        and RPChatMod_RaceClassTexts[race][class]
        and RPChatMod_RaceClassTexts[race][class][emote] then

        return RPChatMod_RaceClassTexts[race][class][emote]
    end


    -- --------------------------------------
    -- 2. KLASSE
    -- --------------------------------------

    if RPChatMod_ClassTexts[class]
        and RPChatMod_ClassTexts[class][emote] then

        return RPChatMod_ClassTexts[class][emote]
    end


    -- --------------------------------------
    -- 3. RASSE
    -- --------------------------------------

    if RPChatMod_RaceTexts[race]
        and RPChatMod_RaceTexts[race][emote] then

        return RPChatMod_RaceTexts[race][emote]
    end


    -- --------------------------------------
    -- 4. STANDARD
    -- --------------------------------------

    if RPChatMod_GeneralTexts[emote] then
        return RPChatMod_GeneralTexts[emote]
    end


    return nil
end


-- ==========================================
-- TEXT AUSWÄHLEN
-- ==========================================

local function GetText(emote)

    local pool = GetTextPool(emote)

    if not pool then
        return nil
    end

    local targetExists =
        UnitExists("target")

    local targetName =
        UnitName("target")


    -- --------------------------------------
    -- Zieltext
    -- --------------------------------------

    if targetExists
        and targetName
        and pool.ziel
        and #pool.ziel > 0 then

        local text =
            RPChatMod_GetRandom(pool.ziel)

        return string.format(
            text,
            targetName
        )
    end


    -- --------------------------------------
    -- Gruppentext
    -- --------------------------------------

    if pool.gruppe
        and #pool.gruppe > 0 then

        return RPChatMod_GetRandom(pool.gruppe)
    end


    return nil
end


-- ==========================================
-- HAUPTFUNKTION
-- ==========================================

local function RPChatMod_DoEmote(emote)

    emote = string.upper(emote or "")

    if emote == "" then
        print(
            "|cffffd100RP Chat Mod:|r " ..
            "Kein Emote angegeben."
        )

        return
    end


    -- --------------------------------------
    -- Animation IMMER
    -- --------------------------------------

    RPChatMod_PlayEmote(emote)


    -- --------------------------------------
    -- Cooldown prüfen
    -- --------------------------------------

    if not RPChatMod_CooldownReady() then

        local verbleibend =
            RPChatMod_GetRemainingCooldown()

        UIErrorsFrame:AddMessage(
            string.format(
                "RP-Text auf Abklingzeit. Noch %.1fs.",
                verbleibend
            ),
            1.0,
            0.1,
            0.1,
            1.0
        )

        return
    end


    -- --------------------------------------
    -- Zufallschance
    -- --------------------------------------

    if math.random(1, 100)
        > RPChatMod_Settings.textChance then

        UIErrorsFrame:AddMessage(
            "RP-Text nicht ausgelöst.",
            1.0,
            0.8,
            0.0,
            1.0
        )

        return
    end


    -- --------------------------------------
    -- Text holen
    -- --------------------------------------

    local text =
        GetText(emote)

    if not text then

        print(
            "|cffff0000RP Chat Mod:|r " ..
            "Kein Text für " ..
            emote ..
            " vorhanden."
        )

        return
    end


    -- --------------------------------------
    -- Chat senden
    -- --------------------------------------

    RPChatMod_SendText(text)

    RPChatMod_UpdateCooldown()
end


-- ==========================================
-- SLASH COMMAND
-- ==========================================

SLASH_RPCHATMOD1 = "/rc"

SlashCmdList["RPCHATMOD"] = function(message)

    local command, argument =
        string.match(
            message or "",
            "^%s*(%S+)%s*(.-)%s*$"
        )

    if not command then

        print("|cffc79c6eRP Chat Mod|r")
        print("/rc hello")
        print("/rc wave")
        print("/rc salute")
        print("/rc bow")
        print("/rc laugh")
        print("/rc dance")
        print("/rc sit")
        print("/rc sleep")
        print("/rc thank")
        print("/rc chance 30")
        print("/rc cooldown 20")
        print("/rc channel say|group|instance|auto")

        return
    end

    command = string.lower(command)

    if command == "chance" then

        if not string.match(argument, "^%d+$") then
            print("Benutzung: /rc chance 0-100")
            return
        end

        local value = tonumber(argument)
        value = math.max(0, math.min(100, value))

        RPChatMod_CharacterDB.textChance = value
        RPChatMod_Settings.textChance = value

        print(
            string.format(
                "|cffc79c6eRP Chat Mod:|r Textchance: %d%%",
                value
            )
        )

        return
    end

    if command == "cooldown" then

        if not string.match(argument, "^%d+$") then
            print("Benutzung: /rc cooldown <Sekunden>")
            return
        end

        local value = tonumber(argument)

        RPChatMod_CharacterDB.cooldown = value
        RPChatMod_Settings.cooldown = value

        print(
            string.format(
                "|cffc79c6eRP Chat Mod:|r Cooldown: %d Sekunden",
                value
            )
        )

        return
    end

    if command == "channel" then
        local channels = {
            say = "SAY",
            group = "GROUP",
            instance = "INSTANCE_CHAT",
            auto = "AUTO",
        }
        local channel = channels[string.lower(argument or "")]

        if not channel then
            print("Benutzung: /rc channel say|group|instance|auto")
            return
        end

        RPChatMod_CharacterDB.chatChannel = channel
        RPChatMod_Settings.chatChannel = channel

        print(
            string.format(
                "|cffc79c6eRP Chat Mod:|r Chatkanal: %s",
                string.lower(argument)
            )
        )

        return
    end

    RPChatMod_DoEmote(command)
end


-- ==========================================
-- INITIALISIERUNG
-- ==========================================

print(
    "|cffc79c6eRP Chat Mod|r geladen. " ..
    "Befehl: |cffffd100/rc|r"
)