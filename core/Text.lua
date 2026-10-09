-- Poolpriorität und zielabhängige Textauswahl.
local _, addon = ...

function addon.GetTextPool(emote)
    local _, race = UnitRace("player")
    if race == "Scourge" then
        race = "Undead"
    end
    local _, class = UnitClass("player")
    local raceClasses = addon.raceClassTexts[race]
    local raceClass = raceClasses and raceClasses[class]
    if raceClass and raceClass[emote] then
        return raceClass[emote]
    end
    local classTexts = addon.classTexts[class]
    if classTexts and classTexts[emote] then
        return classTexts[emote]
    end
    local raceTexts = addon.raceTexts[race]
    if raceTexts and raceTexts[emote] then
        return raceTexts[emote]
    end
    return addon.generalTexts[emote] or nil
end

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then
        return nil
    end
    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= ""
            and (targetName or not text:find("%s", 1, true)) then
            usable[#usable + 1] = text
        end
    end
    if #usable == 0 then
        return nil
    end
    local text = addon.GetRandom(usable)
    return (text:gsub("%%s", function() return targetName end))
end

function addon.GetText(emote)
    local pool = addon.GetTextPool(emote)
    if type(pool) ~= "table" then
        return nil
    end
    local targetName = UnitExists("target") and UnitName("target") or nil
    if targetName and type(pool.ziel) == "table" and #pool.ziel > 0 then
        return ChooseText(pool.ziel, targetName)
    end
    return ChooseText(pool.gruppe, targetName)
end
