local _, addon = ...

local channelAliases = {
    say = "SAY",
    group = "GROUP",
    instance = "INSTANCE_CHAT",
    auto = "AUTO",
    party = "PARTY",
    raid = "RAID",
    instance_chat = "INSTANCE_CHAT",
}

local function ShowHelp()
    print("|cffc79c6eRP Chat Mod|r")
    for _, emote in ipairs({
        "hello", "wave", "salute", "bow", "laugh",
        "dance", "sit", "sleep", "thank",
    }) do
        print("/rc " .. emote)
    end
    print("/rc chance 30")
    print("/rc cooldown 20")
    print("/rc help | list | status")
    print("/rc channel say|group|party|raid|instance|auto")
end

local function SetChance(argument)
    local value = tonumber(argument)
    if not argument:match("^%d+$") or not addon.ValidNumber(value, 100) then
        print("Benutzung: /rc chance 0-100")
        return
    end
    addon.SetSetting("textChance", value)
    print(string.format("|cffc79c6eRP Chat Mod:|r Textchance: %d%%", value))
end

local function SetCooldown(argument)
    local value = tonumber(argument)
    if not argument:match("^%d+$") or not addon.ValidNumber(value, 3600) then
        print("Benutzung: /rc cooldown <ganze Zahl 0-3600>")
        return
    end
    addon.SetSetting("cooldown", value)
    print(string.format("|cffc79c6eRP Chat Mod:|r Cooldown: %d Sekunden", value))
end

local function SetChannel(argument)
    if argument == "" then
        addon.Notify("Aktueller Chatkanal: " .. addon.db.chatChannel)
        return
    end
    local channel = channelAliases[string.lower(argument or "")]
    if not channel then
        print("Benutzung: /rc channel say|group|party|raid|instance|auto")
        return
    end
    addon.SetSetting("chatChannel", channel)
    print(string.format(
        "|cffc79c6eRP Chat Mod:|r Chatkanal: %s",
        string.lower(argument)
    ))
end

local commandHandlers = {
    chance = SetChance,
    cooldown = SetCooldown,
    channel = SetChannel,
}

function addon.HandleCommand(message)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return
    end
    local command, argument = string.match(
        message or "", "^%s*(%S+)%s*(.-)%s*$"
    )
    command = command and command:lower() or "help"
    argument = argument or ""
    if command == "help" and argument == "" then
        ShowHelp()
        return
    end
    if command == "list" and argument == "" then
        local keys = {}
        for key in pairs(addon.generalTexts) do keys[#keys + 1] = key end
        table.sort(keys)
        for _, key in ipairs(keys) do addon.Notify(key) end
        return
    end
    if command == "status" and argument == "" then
        addon.Notify(string.format("Chance: %g%% | Cooldown: %gs | Kanal: %s",
            addon.db.textChance, addon.db.cooldown, addon.db.chatChannel))
        return
    end
    local handler = commandHandlers[command]
    if handler then
        handler(argument)
        return
    end
    if argument ~= "" then
        addon.Notify("Benutzung: /rc <emote>. /rc help zeigt die Befehle.")
        return
    end
    addon.DoEmote(command)
end
