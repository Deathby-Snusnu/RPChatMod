-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Additive social voice text pools; all lines are original.
-- Opt-in automatic events are deliberately NOT used.
local _, addon = ...
local locale = addon.localeData.frFR

local function append(pool, lines)
    if type(pool) ~= "table" then return end
    for _, line in ipairs(lines) do
        local exists = false
        for _, old in ipairs(pool) do if old == line then exists = true; break end end
        if not exists then pool[#pool + 1] = line end
    end
end
local function extend(parent, key, ziel, gruppe)
    if type(parent) ~= "table" then return end
    parent[key] = parent[key] or { ziel = {}, gruppe = {} }
    append(parent[key].ziel, ziel)
    append(parent[key].gruppe, gruppe)
end

-- An existing race-specific THANK pool is reachable via /rc thank.
extend(locale.raceTexts.Dwarf, "THANK", { "Grand merci, %s ! La prochaine tournée est pour moi." }, { "Votre aide vaut une mine remplie de minerai." })
extend(locale.raceTexts.Gnome, "THANK", { "Splendide, %s ! Tous mes instruments sont d'accord." }, { "Merci ! Cette expérience a peut-être une chance de survivre." })
extend(locale.raceTexts.Human, "THANK", { "Mes sincères remerciements, %s." }, { "Une telle aide unit notre communauté." })
extend(locale.raceTexts.NightElf, "THANK", { "Que les étoiles récompensent votre bonté, %s." }, { "Ma gratitude vous suit dans le vent discret." })
extend(locale.raceTexts.Skyborne, "THANK", { "Que le ciel vous accorde un vent favorable, %s." }, { "Votre aide ouvre des horizons lointains." })
extend(locale.raceTexts.Draenei, "THANK", { "Que la Lumière guide vos pas, %s." }, { "Merci du fond du cœur pour votre bonté." })
extend(locale.raceTexts.Orc, "THANK", { "Votre geste mérite le respect, %s." }, { "Notre force grandit quand nous nous entraidons." })
extend(locale.raceTexts.Troll, "THANK", { "Que les loa veillent sur vous, %s !" }, { "Ha ! Voilà comment on aide un ami !" })
extend(locale.raceTexts.Tauren, "THANK", { "Que la Terre-Mère vous bénisse, %s." }, { "Votre aide est aussi solide que la terre." })
extend(locale.raceTexts.Undead, "THANK", { "Pas mal, %s. J'en suis presque ému." }, { "Merci. Mon cœur s'emballerait s'il en avait envie." })
extend(locale.raceTexts.BloodElf, "THANK", { "Une aide d'une rare élégance, %s." }, { "Votre magie mérite des éloges." })

-- Class FAREWELL pools add distinctive departures without a combat event.
extend(locale.classTexts.WARRIOR, "FAREWELL", {}, { "Je pars devant. Que le dernier ferme la porte.", "Mon bouclier vient avec moi. La fatigue reste ici." })
extend(locale.classTexts.PALADIN, "FAREWELL", {}, { "Que la Lumière vous accompagne. Le marteau m'accompagne.", "Je pars dans la Lumière, en espérant trouver une taverne." })
extend(locale.classTexts.HUNTER, "FAREWELL", {}, { "La piste continue. À notre prochain feu de camp.", "Je pars en éclaireur. Si je me perds, demandez à mon compagnon." })
extend(locale.classTexts.ROGUE, "FAREWELL", {}, { "Ravi de ne pas avoir été vu avec vous.", "Je disparais. Cette conversation n'a jamais eu lieu." })
extend(locale.classTexts.PRIEST, "FAREWELL", {}, { "Que la lumière et le calme guident vos pas.", "Je dois partir. Même le silence mérite un instant." })
extend(locale.classTexts.SHAMAN, "FAREWELL", {}, { "Les éléments m'appellent. Je devrais les écouter.", "Que le vent vous guide en sûreté." })
extend(locale.classTexts.MAGE, "FAREWELL", {}, { "Je pars. Mon chaudron brille encore d'une façon inquiétante.", "Si quelque chose explose, c'était un adieu contrôlé." })
extend(locale.classTexts.WARLOCK, "FAREWELL", {}, { "Je dois partir. Mon ombre s'impatiente.", "Portez-vous bien. Je n'ai pas d'âmes de rechange." })
extend(locale.classTexts.DRUID, "FAREWELL", {}, { "La forêt me rappelle. Adieu.", "Nous nous reverrons quand le vent tournera les feuilles." })

-- Known character combinations override generic race greetings.
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.MAGE = locale.raceClassTexts.Gnome.MAGE or {}
extend(locale.raceClassTexts.Gnome.MAGE, "HELLO", {}, { "Salutations ! Selon mes notes, ces crépitements sont sans danger.", "Bonjour ! Quelqu'un a vu ma prise de courant dimensionnelle ?" })
extend(locale.raceClassTexts.Gnome.MAGE, "THANK", { "Merci, %s ! Mes calculs approuvent votre décision." }, { "Merveilleux ! Nos chances de succès repassent au-dessus de zéro." })
extend(locale.raceClassTexts.Gnome.MAGE, "FAREWELL", {}, { "Je dois filer. Mon expérience fume en mon absence.", "Au revoir ! Ne touchez à rien portant mon écriture." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.HUNTER = locale.raceClassTexts.Dwarf.HUNTER or {}
extend(locale.raceClassTexts.Dwarf.HUNTER, "HELLO", {}, { "Bien le bonjour ! Une place au sec pour mes bottes et mon compagnon ?", "Par ma barbe ! Quel beau jour pour suivre des traces." })
extend(locale.raceClassTexts.Dwarf.HUNTER, "THANK", { "Merci, %s ! Mon compagnon et moi vous devons une fière chandelle." }, { "Un bon allié vaut plus que le meilleur tir. Merci !" })
extend(locale.raceClassTexts.Dwarf.HUNTER, "FAREWELL", {}, { "La piste m'appelle. Si vous entendez ronfler, c'est mon compagnon.", "Je reprends la route. La regarder ne la raccourcira pas." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.PALADIN = locale.raceClassTexts.Dwarf.PALADIN or {}
extend(locale.raceClassTexts.Dwarf.PALADIN, "HELLO", {}, { "Pierre, acier et Lumière ! Quelqu'un a vu le lever du soleil ?", "Bien le bonjour ! J'apporte bénédictions, marteau et grande soif." })
extend(locale.raceClassTexts.Dwarf.PALADIN, "THANK", { "Grand merci, %s ! Que la Lumière garde votre chope pleine." }, { "Une vraie bénédiction ! Et je parle en connaisseur." })
extend(locale.raceClassTexts.Dwarf.PALADIN, "FAREWELL", {}, { "La Lumière m'appelle. Ou la taverne. Je vérifierai les deux.", "Tenez bon ! Et gardez-moi une chope." })
