local _, addon = ...


-- Normalisiert Custom-Rassen von WoW Forever.
-- Der lokalisierte Rassenname wird bewusst mitgeprueft, falls der Beta-Client
-- fuer eine neue Rasse intern noch einen Legacy-Token liefert.
function addon.GetPlayerRaceToken()
    local localizedRace, raceToken = UnitRace("player")

    local function IsSkyborne(value)
        if type(value) ~= "string" then
            return false
        end
        local lowered = value:lower()
        return lowered:find("skyborne", 1, true) ~= nil
            or lowered:find("himmelsgebor", 1, true) ~= nil
    end

    if IsSkyborne(localizedRace) or IsSkyborne(raceToken) then
        return "Skyborne"
    end
    if raceToken == "Scourge" then
        return "Undead"
    end
    return raceToken
end

function addon.Notify(message)
    print("|cffc79c6eRP Chat Mod:|r " .. message)
end

function addon.ValidNumber(value, maximum)
    return type(value) == "number" and value == value
        and value >= 0 and value <= maximum and value % 1 == 0
end

function addon.InitializeDatabase()
    if RPChatMod_CharacterDB ~= nil and type(RPChatMod_CharacterDB) ~= "table" then
        addon.Notify("Ungültige gespeicherte Einstellungen; Standardwerte werden geladen.")
        RPChatMod_CharacterDB = nil
    end
    RPChatMod_CharacterDB = RPChatMod_CharacterDB or {}
    addon.db = RPChatMod_CharacterDB
    local db = addon.db
    for _, key in ipairs({ "textChance", "cooldown" }) do
        local maximum = key == "textChance" and 100 or 3600
        if db[key] ~= nil and not addon.ValidNumber(db[key], maximum) then
            addon.Notify("Ungültiger Wert für " .. key .. "; Standardwert wird geladen.")
            db[key] = nil
        end
        if db[key] == nil then
            db[key] = addon.defaults[key]
        end
    end
    if db.chatChannel ~= nil and not addon.channels[db.chatChannel] then
        addon.Notify("Ungültiger Chatkanal; Standardkanal wird geladen.")
        db.chatChannel = nil
    end
    db.chatChannel = db.chatChannel or addon.defaults.chatChannel
end

function addon.SetSetting(key, value)
    addon.db[key] = value
end
