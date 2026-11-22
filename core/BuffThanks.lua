-- SPDX-License-Identifier: MPL-2.0
-- Optional, opt-in thank-you for helpful buffs received from another player.
-- The Classic/Forever combat-log API must be confirmed in game.
local _, addon = ...

local lastGlobal, lastByCaster = nil, {}
local GLOBAL_COOLDOWN = 90
local CASTER_COOLDOWN = 300
local thanks = {
    deDE = {
        "Habt Dank, %s! Das kommt zur rechten Zeit.",
        "Besten Dank, %s. Das merk ich mir!",
        "Euer Beistand ehrt Euch, %s.",
        "Auf Euch ist Verlass, %s. Danke!",
        "Das hilft! Möge Euer Krug niemals leer werden, %s.",
    },
    enUS = {
        "Many thanks, %s! Just what I needed.",
        "Much obliged, %s. I won't forget this.",
        "Your help is appreciated, %s.",
        "I can count on you, %s. Thank you!",
        "That helps! May your mug never run dry, %s.",
    },
    frFR = {
        "Grand merci, %s ! Cela tombe à point.",
        "Je vous suis redevable, %s.",
        "Votre aide m'honore, %s.",
        "Je peux compter sur vous, %s. Merci !",
        "Voilà qui aide ! Que votre chope ne soit jamais vide, %s.",
    },
}


-- Optional flavor pools. Generic text remains available for all races/classes.
-- Keep the text independent of the caster's class or the type of buff.
local raceThanks = {
    Dwarf = {
        deDE = { "Das geht auf meine Rechnung, %s!", "Bei meinem Barte, %s! Habt Dank!", "Euer Beistand ist mehr wert als ein Fass Starkbier, %s." },
        enUS = { "The next round is on me, %s!", "By my beard, %s! Many thanks!", "Your help is worth more than a barrel of stout, %s." },
        frFR = { "La prochaine tournée est pour moi, %s !", "Par ma barbe, %s ! Grand merci !", "Votre aide vaut plus qu'un tonneau de bière, %s." },
    },
    Gnome = {
        deDE = { "Hervorragend, %s! Mein Wohlbefindensmesser schlägt aus!", "Danke, %s! Die Erfolgswahrscheinlichkeit steigt beträchtlich.", "Faszinierend! Das notiere ich gleich, %s." },
        enUS = { "Excellent, %s! My wellbeing meter is off the charts!", "Thanks, %s! The odds of success just improved.", "Fascinating! I'll write that down, %s." },
        frFR = { "Excellent, %s ! Mon indicateur de bien-être s'affole !", "Merci, %s ! Nos chances viennent de grimper.", "Fascinant ! Je vais noter ça, %s." },
    },
    NightElf = {
        deDE = { "Mögen die Sterne Euren Weg erhellen, %s.", "Eure Gabe ehrt mich, %s. Ich danke Euch.", "Der Wind trage meinen Dank zu Euch, %s." },
        enUS = { "May the stars light your path, %s.", "Your gift honors me, %s. Thank you.", "May the wind carry my thanks to you, %s." },
        frFR = { "Que les étoiles éclairent votre route, %s.", "Votre don m'honore, %s. Merci.", "Que le vent vous porte mes remerciements, %s." },
    },
    Skyborne = {
        deDE = { "Der Himmel möge Euch geleiten, %s. Habt Dank.", "Eure Hilfe ist ein Geschenk des Windes, %s." },
        enUS = { "May the sky guide you, %s. Thank you.", "Your aid is a gift of the wind, %s." },
        frFR = { "Que le ciel vous guide, %s. Merci.", "Votre aide est un présent du vent, %s." },
    },
}
local classThanks = {
    PALADIN = {
        deDE = { "Euer Beistand ist ein Licht in dunkler Stunde, %s.", "Möge das Licht Eure Güte vergelten, %s." },
        enUS = { "Your aid is a light in a dark hour, %s.", "May the Light repay your kindness, %s." },
        frFR = { "Votre aide éclaire cette heure sombre, %s.", "Que la Lumière récompense votre bonté, %s." },
    },
    HUNTER = {
        deDE = { "Guter Blick, %s! Selbst mein Begleiter ist beeindruckt.", "Ein Jäger vergisst einen guten Gefährten nicht, %s." },
        enUS = { "Sharp eyes, %s! Even my companion is impressed.", "A hunter never forgets a good ally, %s." },
        frFR = { "Quel œil, %s ! Même mon compagnon est impressionné.", "Un chasseur n'oublie jamais un bon allié, %s." },
    },
    MAGE = {
        deDE = { "Bemerkenswert, %s! Die Messwerte sehen gleich freundlicher aus.", "Danke, %s! Das eröffnet ganz neue Versuchsreihen." },
        enUS = { "Remarkable, %s! The readings already look better.", "Thank you, %s! That opens up new experiments." },
        frFR = { "Remarquable, %s ! Les mesures sont déjà meilleures.", "Merci, %s ! Voilà de nouvelles expériences en vue." },
    },
    WARLOCK = {
        deDE = { "Wie aufmerksam, %s. Ich schulde Euch einen ungefährlichen Gefallen.", "Habt Dank, %s. Meine Dämonen benehmen sich beinahe." },
        enUS = { "How thoughtful, %s. I owe you a mostly harmless favor.", "Thank you, %s. Even my demons are nearly behaving." },
        frFR = { "Quelle attention, %s. Je vous dois un service presque sans danger.", "Merci, %s. Même mes démons sont presque sages." },
    },
    DRUID = {
        deDE = { "Die Wurzeln mögen Euch Halt geben, %s. Habt Dank.", "Eure Hilfe blüht zur rechten Zeit, %s." },
        enUS = { "May the roots keep you steady, %s. Thank you.", "Your aid blossoms at just the right moment, %s." },
        frFR = { "Que les racines vous soutiennent, %s. Merci.", "Votre aide fleurit au bon moment, %s." },
    },
    PRIEST = {
        deDE = { "Für Eure Güte danke ich Euch, %s.", "Euer Beistand stärkt nicht nur den Körper, %s." },
        enUS = { "I thank you for your kindness, %s.", "Your aid strengthens more than the body, %s." },
        frFR = { "Je vous remercie pour votre bonté, %s.", "Votre aide fortifie bien plus que le corps, %s." },
    },
    WARRIOR = {
        deDE = { "Gut zu wissen, dass Ihr an meiner Seite steht, %s.", "Dank Euch steht der Schild noch fester, %s." },
        enUS = { "Good to know you're at my side, %s.", "Thanks to you my shield stands firmer, %s." },
        frFR = { "Heureux de vous savoir à mes côtés, %s.", "Grâce à vous, mon bouclier tient mieux, %s." },
    },
}
local function ChooseThanksPool(language)
    local race = type(addon.GetPlayerRaceToken) == "function" and addon.GetPlayerRaceToken() or nil
    local racePool = raceThanks[race] and raceThanks[race][language]
    local class = type(UnitClass) == "function" and select(2, UnitClass("player")) or nil
    local classPool = classThanks[class] and classThanks[class][language]
    -- Rotate across race, class, and generic texts instead of locking one style.
    local roll = math.random(100)
    if roll <= 45 and racePool then return racePool end
    if roll <= 80 and classPool then return classPool end
    if racePool and roll <= 80 then return racePool end
    return thanks[language] or thanks.deDE
end

local function IsPlayerSource(sourceGUID, sourceFlags)
    if type(sourceGUID) ~= "string" or not sourceGUID:match("^Player%-") then
        return false
    end
    local band = bit and bit.band or bit32 and bit32.band
    if band and type(sourceFlags) == "number" and COMBATLOG_OBJECT_TYPE_PLAYER then
        return band(sourceFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0
    end
    -- On beta clients without flag constants, a Player-* GUID remains necessary.
    return true
end

function addon.ProcessBuffThanks(subevent, sourceGUID, sourceName, sourceFlags,
                                 destGUID, spellName, auraType)
    if not addon.ready or not addon.db or not addon.db.buffThanksEnabled then return false end
    if subevent ~= "SPELL_AURA_APPLIED" or auraType ~= "BUFF" then return false end
    if type(UnitGUID) ~= "function" or destGUID ~= UnitGUID("player") then return false end
    if not IsPlayerSource(sourceGUID, sourceFlags) or sourceGUID == destGUID then return false end
    if type(sourceName) ~= "string" or sourceName == "" then return false end
    if type(InCombatLockdown) == "function" and InCombatLockdown() then return false end
    local now = type(GetTime) == "function" and GetTime() or nil
    if not now then return false end
    if lastGlobal and now - lastGlobal < GLOBAL_COOLDOWN then return false end
    if lastByCaster[sourceGUID] and now - lastByCaster[sourceGUID] < CASTER_COOLDOWN then return false end
    if type(addon.CooldownReady) == "function" and not addon.CooldownReady() then return false end
    local chance = addon.db.buffThanksChance or 0
    if math.random(100) > chance then return false end
    -- Realm-qualified combat-log names are shortened, never used as chat markup.
    local name = sourceName:match("^([^%-]+)") or sourceName
    if not name:match("^[%a\128-\255][%a\128-\255']*$") then return false end
    local language = type(addon.GetOutputLanguage) == "function" and addon.GetOutputLanguage() or "deDE"
    local pool = ChooseThanksPool(language)
    local message = string.format(pool[math.random(#pool)], name)
    if not addon.SendText(message) then return false end
    lastGlobal, lastByCaster[sourceGUID] = now, now
    if type(addon.StartCooldown) == "function" then addon.StartCooldown() end
    return true
end

function addon.StartBuffThanksListener()
    if addon.buffThanksFrame or type(CreateFrame) ~= "function" then return end
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    frame:SetScript("OnEvent", function()
        if not addon.db or not addon.db.buffThanksEnabled then return end
        if type(CombatLogGetCurrentEventInfo) ~= "function" then return end
        local _, subevent, _, sourceGUID, sourceName, sourceFlags, _,
              destGUID, _, _, _, _, spellName, _, auraType = CombatLogGetCurrentEventInfo()
        addon.ProcessBuffThanks(subevent, sourceGUID, sourceName, sourceFlags,
                                destGUID, spellName, auraType)
    end)
    addon.buffThanksFrame = frame
end
