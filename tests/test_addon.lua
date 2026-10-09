-- Source-only-Regressionstests: lua tests/test_addon.lua [Addon-Verzeichnis]
-- WoW stellt diese Testdatei nicht über die TOC bereit.
local scriptPath = (arg and arg[0] or ""):gsub("\\", "/")
local root = arg and arg[1] or scriptPath:match("^(.*)/tests/[^/]+$") or "."
if root == "" then
    root = "."
end

local function Equal(actual, expected, description)
    assert(actual == expected, (description or "Wert") ..
        ": erwartet " .. tostring(expected) .. ", erhalten " .. tostring(actual))
end

local function LoadAddon(savedValues, beforeLogin)
    local state = {
        time = 100,
        race = "Human",
        class = "UNKNOWN",
        languages = { { "Gemeinsprache", 7 }, { "Gossensprache", 33 } },
        messages = {},
        errors = {},
        sent = {},
        timers = {},
        animations = {},
        randomCalls = 0,
        roll = 1,
    }
    local environment = setmetatable({}, { __index = _G })
    environment._G = environment
    environment.RPChatMod_CharacterDB = savedValues
    environment.SlashCmdList = {}
    environment.LE_PARTY_CATEGORY_INSTANCE = 2
    environment.math = {}
    for key, value in pairs(math) do
        environment.math[key] = value
    end
    environment.math.random = function(minimum, maximum)
        state.randomCalls = state.randomCalls + 1
        if maximum == 100 then
            return state.roll
        end
        return minimum
    end
    environment.print = function(message)
        state.messages[#state.messages + 1] = message
    end
    environment.GetTime = function()
        return state.time
    end
    environment.UnitRace = function()
        return "Volk", state.race
    end
    environment.UnitClass = function()
        return "Klasse", state.class
    end
    environment.UnitExists = function()
        return state.targetExists
    end
    environment.UnitName = function()
        return state.targetName
    end
    environment.IsInGroup = function(category)
        if category == 2 then
            return state.instance
        end
        return state.party
    end
    environment.IsInRaid = function()
        return state.raid
    end
    environment.GetNumLanguages = function()
        return #state.languages
    end
    environment.GetLanguageByIndex = function(index)
        local language = state.languages[index]
        return language[1], language[2]
    end
    environment.UIErrorsFrame = {
        AddMessage = function(_, ...)
            state.errors[#state.errors + 1] = { ... }
        end,
    }
    environment.C_Timer = {
        After = function(delay, callback)
            state.timers[#state.timers + 1] = { delay, callback }
        end,
    }
    environment.DoEmote = function(emote)
        state.animations[#state.animations + 1] = emote
    end
    environment.C_ChatInfo = {
        SendChatMessage = function(text, channel, languageID)
            if state.sendError then
                error("Mock-Sendefehler")
            end
            state.sent[#state.sent + 1] = { text, channel, languageID }
            -- Wie die WoW-Funktion kein bestätigendes boolesches Ergebnis.
            return nil
        end,
    }
    state.frames = {}
    environment.CreateFrame = function()
        local frame = { events = {}, scripts = {} }
        function frame:RegisterEvent(event) self.events[event] = true end
        function frame:SetScript(event, callback) self.scripts[event] = callback end
        state.frames[#state.frames + 1] = frame
        return frame
    end
    function state.login()
        for _, frame in ipairs(state.frames) do
            if frame.events.PLAYER_LOGIN then
                frame.scripts.OnEvent(frame, "PLAYER_LOGIN")
            end
        end
    end

    local addon = {}
    local toc = assert(io.open(root .. "/RPChatMod.toc", "r"))
    for line in toc:lines() do
        local file = line:match("^%s*(.-)%s*$")
        if file:match("%.lua$") then
            local chunk, loadError
            if _VERSION == "Lua 5.1" then
                chunk, loadError = loadfile(root .. "/" .. file)
                if chunk then
                    setfenv(chunk, environment)
                end
            else
                chunk, loadError = loadfile(root .. "/" .. file, "t", environment)
            end
            assert(chunk, loadError)
            chunk("RPChatMod", addon)
        end
    end
    toc:close()
    if not beforeLogin then state.login() end
    return addon, environment, state
end

local tests = {}
local function Test(name, callback)
    tests[#tests + 1] = { name, callback }
end

Test("TOC, Defaults, isolierter Namespace und öffentliche API", function()
    local addon, env, state = LoadAddon()
    Equal(addon.defaults.textChance, 30)
    Equal(addon.defaults.cooldown, 20)
    Equal(addon.defaults.emoteDelay, 0.3)
    Equal(addon.defaults.chatChannel, "SAY")
    Equal(rawget(env, "RPChatMod_Settings"), nil)
    Equal(rawget(env, "RPChatMod_GeneralTexts"), nil)
    Equal(rawget(env, "RPChatMod_RaceTexts"), nil)
    Equal(rawget(env, "RPChatMod_ClassTexts"), nil)
    Equal(rawget(env, "RPChatMod_RaceClassTexts"), nil)
    Equal(env.RPChatMod, addon)
    Equal(type(env.RPChatMod.TryText), "function")
    Equal(env.SLASH_RPCHATMOD1, "/rc")
    Equal(env.SlashCmdList.RPCHATMOD, addon.HandleCommand)
    Equal(#state.messages, 1)
    Equal(state.messages[1],
        "|cffc79c6eRP Chat Mod|r geladen. Befehl: |cffffd100/rc|r")
end)

Test("DB-Identität, gültige Werte und unbekannte Felder bleiben erhalten", function()
    local marker = {}
    local saved = { textChance = 81, cooldown = 42, chatChannel = "GROUP", custom = marker }
    local addon, env = LoadAddon(saved)
    Equal(addon.db, saved)
    Equal(env.RPChatMod_CharacterDB, saved)
    Equal(addon.db.textChance, 81)
    Equal(addon.db.cooldown, 42)
    Equal(addon.db.chatChannel, "GROUP")
    Equal(saved.custom, marker)
    addon.HandleCommand("chance 10")
    Equal(saved.textChance, 10)
    Equal(addon.defaults.textChance, 30)
end)

Test("Ungültige gespeicherte Werte werden gemeldet und repariert", function()
    local addon = LoadAddon({ textChance = false, chatChannel = "BROKEN" })
    Equal(addon.db.textChance, 30)
    Equal(addon.db.cooldown, 20)
    Equal(addon.db.chatChannel, "SAY")
    Equal(addon.GetChatChannel(), "SAY")
end)

Test("Sofortiger erster Text und globale Cooldown-Wrapper", function()
    local addon, env, state = LoadAddon()
    state.time = 0
    Equal(env.RPChatMod_CooldownReady(), true)
    Equal(env.RPChatMod_GetRemainingCooldown(), 0)
    state.time = 20
    Equal(env.RPChatMod_CooldownReady(), true)
    Equal(env.RPChatMod_UpdateCooldown(), nil)
    Equal(addon.GetRemainingCooldown(), 20)
    state.time = 40
    Equal(addon.GetRemainingCooldown(), 0)
end)

Test("Animation immer, Cooldown vor Chance, Animation verzögert", function()
    local addon, _, state = LoadAddon({ textChance = 100, cooldown = 20 })
    state.time = 0
    Equal(addon.TryText("WAVE"), true)
    state.timers, state.sent, state.randomCalls = {}, {}, 0
    addon.HandleCommand("wave")
    Equal(#state.timers, 1)
    Equal(state.timers[1][1], 0.3)
    Equal(#state.animations, 0)
    Equal(state.randomCalls, 0)
    Equal(#state.sent, 0)
    Equal(state.errors[1][1], "RP-Text auf Abklingzeit. Noch 20.0s.")
    state.timers[1][2]()
    Equal(state.animations[1], "WAVE")
end)

Test("Chancegrenze und Cooldown nach normal zurückkehrendem Versand", function()
    local addon, _, state = LoadAddon({ textChance = 30, cooldown = 20 })
    state.roll = 31
    addon.HandleCommand("wave")
    Equal(#state.sent, 0)
    Equal(state.errors[1][1], "RP-Text nicht ausgelöst.")
    Equal(addon.CooldownReady(), true)
    state.roll = 30
    addon.HandleCommand("wave")
    Equal(#state.sent, 1)
    Equal(addon.CooldownReady(), false)
    Equal(#state.timers, 2)
end)

Test("Chance 0/100 und fehlender Pool unterdrücken niemals die Animation", function()
    local addon, _, state = LoadAddon({ textChance = 0, cooldown = 0 })
    addon.HandleCommand("wave")
    Equal(#state.sent, 0)
    Equal(#state.timers, 1)
    addon.HandleCommand("chance 100")
    state.roll = 100
    addon.HandleCommand("unbekannt")
    Equal(#state.sent, 0)
    Equal(#state.timers, 2)
    Equal(addon.CooldownReady(), true)
    Equal(state.messages[#state.messages],
        "|cffff0000RP Chat Mod:|r Kein Text für UNBEKANNT vorhanden.")
    addon.HandleCommand("wave")
    Equal(#state.sent, 1)
end)

Test("Sendefehler aktualisiert Cooldown nicht", function()
    local addon, _, state = LoadAddon({ textChance = 100, cooldown = 20 })
    state.sendError = true
    Equal(pcall(addon.HandleCommand, "wave"), false)
    Equal(addon.CooldownReady(), true)
    Equal(#state.timers, 1)
end)

Test("Explizite Kanäle ohne SAY-Fallback in allen Gruppenkombinationen", function()
    local addon, env, state = LoadAddon()
    for mask = 0, 7 do
        state.instance = mask % 2 == 1
        state.raid = math.floor(mask / 2) % 2 == 1
        state.party = math.floor(mask / 4) % 2 == 1
        local grouped = state.instance and "INSTANCE_CHAT" or
            state.raid and "RAID" or state.party and "PARTY" or "SAY"
        local expected = {
            SAY = "SAY",
            INSTANCE_CHAT = state.instance and "INSTANCE_CHAT" or false,
            GROUP = grouped ~= "SAY" and grouped or false,
            PARTY = state.party and "PARTY" or false,
            RAID = state.raid and "RAID" or false,
            AUTO = grouped,
        }
        for setting, channel in pairs(expected) do
            addon.db.chatChannel = setting
            Equal(env.RPChatMod_GetChatChannel(), channel or nil, setting .. "/" .. mask)
        end
    end
end)

Test("Zentraler Versand, Sprach-IDs und Wrapper-Rückgaben", function()
    local addon, env, state = LoadAddon()
    Equal(env.RPChatMod_SendText("Hallo"), true)
    Equal(state.sent[1][1], "Hallo")
    Equal(state.sent[1][2], "SAY")
    Equal(state.sent[1][3], 7)
    state.race = "Scourge"
    addon.SendText("Hallo")
    Equal(state.sent[2][3], 33)
    state.languages = { { "Gutterspeak", 33 } }
    addon.SendText("Hallo")
    Equal(state.sent[3][3], 33)
    state.party = true
    addon.db.chatChannel = "GROUP"
    addon.SendText("Hallo")
    Equal(state.sent[4][2], "PARTY")
    Equal(state.sent[4][3], nil)
    Equal(env.RPChatMod_PlayEmote(nil), nil)
    Equal(env.RPChatMod_GetRandom({}), nil)
    Equal(env.RPChatMod_GetRandom({ "einzig" }), "einzig")
end)

Test("Poolpriorität RaceClass/Class/Race/General ohne Klassenbeschränkung", function()
    local addon, _, state = LoadAddon()
    state.race, state.class = "Dwarf", "PALADIN"
    Equal(addon.GetTextPool("WAVE"), addon.raceClassTexts.Dwarf.PALADIN.WAVE)
    Equal(addon.GetTextPool("BOW"), addon.classTexts.PALADIN.BOW)
    state.class = "UNKNOWN"
    Equal(addon.GetTextPool("BOW"), addon.raceTexts.Dwarf.BOW)
    state.race = "UNKNOWN"
    Equal(addon.GetTextPool("BOW"), addon.generalTexts.BOW)
    state.class = "WARRIOR"
    Equal(addon.GetTextPool("WAVE"), addon.classTexts.WARRIOR.WAVE)
    Equal(addon.GetTextPool("UNBEKANNT"), nil)
end)

Test("Scourge verwendet die vorhandenen Undead-Textdaten", function()
    local addon, _, state = LoadAddon()
    state.race, state.class = "Scourge", "UNKNOWN"
    Equal(addon.GetTextPool("WAVE"), addon.raceTexts.Undead.WAVE)
    state.race = "Undead"
    Equal(addon.GetTextPool("WAVE"), addon.raceTexts.Undead.WAVE)
    state.class = "PALADIN"
    Equal(addon.GetTextPool("WAVE"), addon.raceClassTexts.Undead.PALADIN.WAVE)
end)

Test("Zieltexte, Gruppentexte und kein Fallback aus einem leeren Pool", function()
    local addon, _, state = LoadAddon()
    state.race = "UNKNOWN"
    state.targetExists, state.targetName = true, "A%name"
    Equal(addon.GetText("HELLO"), "Hallo, A%name!")
    state.targetExists = false
    Equal(addon.GetText("HELLO"), "Hallo zusammen!")
    addon.raceTexts.UNKNOWN = { HELLO = {} }
    Equal(addon.GetText("HELLO"), nil)
end)

Test("Literale Platzhalterersetzung und Textgrenzen", function()
    local addon, _, state = LoadAddon()
    state.race = "UNKNOWN"
    state.targetExists, state.targetName = true, "Name"
    addon.generalTexts.PROBE = { ziel = { "100% für %s" } }
    Equal(addon.GetText("PROBE"), "100% für Name")
    addon.generalTexts.PROBE.ziel[1] = "%d"
    Equal(addon.GetText("PROBE"), "%d")
    for _, text in ipairs({ string.rep("x", 256), "a\nb", "a\rb", "|Htest|h" }) do
        Equal(addon.SendText(text), false)
    end
    Equal(#state.sent, 0)
    Equal(addon.SendText(string.rep("x", 255)), true)
    Equal(#state.sent[1][1], 255)
    state.targetName = "Ziel%1"
    addon.generalTexts.PROBE.ziel[1] = "Hallo %s."
    Equal(addon.GetText("PROBE"), "Hallo Ziel%1.")
end)

Test("Strikte Slash-Grammatik, Hilfebefehle und Kanalabfrage", function()
    local addon, _, state = LoadAddon()
    addon.HandleCommand("")
    Equal(#state.messages, 15)
    Equal(state.messages[2], "|cffc79c6eRP Chat Mod|r")
    Equal(state.messages[3], "/rc hello")
    Equal(state.messages[15], "/rc channel say|group|party|raid|instance|auto")
    addon.HandleCommand("chance 100")
    addon.HandleCommand("  CHANCE 999  ")
    Equal(addon.db.textChance, 100)
    for _, argument in ipairs({ "-1", "1.5", "50 extra", "" }) do
        addon.HandleCommand("chance " .. argument)
        Equal(addon.db.textChance, 100)
        Equal(state.messages[#state.messages], "Benutzung: /rc chance 0-100")
    end
    addon.HandleCommand("cooldown 3601")
    Equal(addon.db.cooldown, 20)
    addon.HandleCommand("channel GROUP")
    Equal(addon.db.chatChannel, "GROUP")
    addon.HandleCommand("channel")
    Equal(state.messages[#state.messages], "|cffc79c6eRP Chat Mod:|r Aktueller Chatkanal: GROUP")
    addon.HandleCommand("wave extra")
    Equal(#state.timers, 0)
    addon.HandleCommand("help")
    addon.HandleCommand("list")
    addon.HandleCommand("status")
end)

Test("Vor Login sicher und beschädigte Datenbank repariert", function()
    local addon, env, state = LoadAddon("invalid", true)
    Equal(addon.TryText("WAVE"), false)
    addon.HandleCommand("chance 100")
    Equal(env.RPChatMod_CharacterDB, "invalid")
    Equal(#state.timers, 0)
    state.login()
    Equal(type(addon.db), "table")
    Equal(addon.db.textChance, 30)
    local repaired = LoadAddon({ textChance = 1.5, cooldown = 1.5 })
    Equal(repaired.db.textChance, 30)
    Equal(repaired.db.cooldown, 20)
end)

Test("Fehlende Chat-API startet keinen Cooldown und verhindert keine Animation", function()
    local addon, env, state = LoadAddon({ textChance = 100, cooldown = 20 })
    state.time = 0
    env.C_ChatInfo = nil
    Equal(addon.TryText("WAVE"), false)
    Equal(addon.CooldownReady(), true)
    Equal(addon.GetRemainingCooldown(), 0)
    Equal(#state.timers, 1)
    Equal(addon.TryText({}), false)
end)

local failures = 0
for _, test in ipairs(tests) do
    local success, testError = pcall(test[2])
    if success then
        print("OK: " .. test[1])
    else
        failures = failures + 1
        print("FEHLER: " .. test[1] .. "\n" .. tostring(testError))
    end
end
print(string.format("%d Tests, %d Fehler (%s)", #tests, failures, _VERSION))
if failures > 0 then
    os.exit(1)
end
