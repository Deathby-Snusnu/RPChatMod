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

-- Wave 2: original race greetings, class cheering and race/class character voices.
extend(locale.raceTexts.Dwarf, "HELLO", { "Par les ancêtres, %s ! Heureux de vous voir." }, { "Pierre, acier et salut digne de ce nom !" })
extend(locale.raceTexts.Gnome, "HELLO", { "Bienvenue, %s ! La lumière clignotante est normale." }, { "Ma machine à saluer fonctionne. Sans doute." })
extend(locale.raceTexts.Human, "HELLO", { "Bienvenue, %s. Que votre route soit sûre." }, { "La bonne compagnie raccourcit les longues routes." })
extend(locale.raceTexts.NightElf, "HELLO", { "Que les étoiles d'Élune vous guident, %s." }, { "La forêt écoute et vous accueille." })
extend(locale.raceTexts.Skyborne, "HELLO", { "Bon vent à vous, %s !" }, { "Le ciel a de la place pour de nouveaux amis." })
extend(locale.raceTexts.Draenei, "HELLO", { "Que la Lumière guide vos pas, %s." }, { "Chaque rencontre offre un nouveau départ." })
extend(locale.raceTexts.Orc, "HELLO", { "Que votre poignée soit ferme, %s !" }, { "Notre force grandit quand nous restons ensemble." })
extend(locale.raceTexts.Troll, "HELLO", { "Hé, %s ! Les loa semblent joyeux aujourd'hui. Enfin, j'espère." }, { "Salut ! Ne laissez pas gagner les moustiques." })
extend(locale.raceTexts.Tauren, "HELLO", { "Que la Terre-Mère vous porte, %s." }, { "Le vent du matin apporte de nouveaux chemins." })
extend(locale.raceTexts.Undead, "HELLO", { "Salutations, %s. Je suis tout à fait sérieux." }, { "Bienvenue. Ce craquement vient de mon genou." })
extend(locale.raceTexts.BloodElf, "HELLO", { "Une arrivée élégante, %s. Bienvenue." }, { "La bonne compagnie se reconnaît au style." })
extend(locale.classTexts.WARRIOR, "CHEER", {}, { "Tenez la ligne ! Le courage se répand plus vite que la peur !" })
extend(locale.classTexts.PALADIN, "CHEER", {}, { "La Lumière montre la voie. Nous la suivons ensemble !" })
extend(locale.classTexts.HUNTER, "CHEER", {}, { "Bonne piste et ciel clair ! Mon compagnon est prêt." })
extend(locale.classTexts.ROGUE, "CHEER", {}, { "Un plan bien mené mérite une joie discrète." })
extend(locale.classTexts.PRIEST, "CHEER", {}, { "Un peu d'espoir est parfois la plus belle victoire." })
extend(locale.classTexts.SHAMAN, "CHEER", {}, { "Même le tonnerre semble nous approuver aujourd'hui !" })
extend(locale.classTexts.MAGE, "CHEER", {}, { "Succès ! Personne n'a perdu ses sourcils !" })
extend(locale.classTexts.WARLOCK, "CHEER", {}, { "Une victoire sans dégâts collatéraux. Quelle surprise !" })
extend(locale.classTexts.DRUID, "CHEER", {}, { "Même la plus petite pousse trouve son chemin !" })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.PALADIN = locale.raceClassTexts.Dwarf.PALADIN or {}
extend(locale.raceClassTexts.Dwarf.PALADIN, "HELLO", { "Salutations, %s. Mon marteau brille, pas encore ma chope." }, {})
extend(locale.raceClassTexts.Dwarf.PALADIN, "FAREWELL", {}, { "La Lumière m'appelle. La taverne aussi." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.HUNTER = locale.raceClassTexts.Dwarf.HUNTER or {}
extend(locale.raceClassTexts.Dwarf.HUNTER, "HELLO", { "Salut, %s ! Mon compagnon inspecte vos bottes." }, {})
extend(locale.raceClassTexts.Dwarf.HUNTER, "FAREWELL", {}, { "La piste m'appelle. Si ça ronfle, c'est mon compagnon." })
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.MAGE = locale.raceClassTexts.Gnome.MAGE or {}
extend(locale.raceClassTexts.Gnome.MAGE, "HELLO", { "Bonjour, %s ! Ces crépitements font partie du plan." }, {})
extend(locale.raceClassTexts.Gnome.MAGE, "FAREWELL", {}, { "Je dois partir. Mon portail vient d'avaler mes notes." })
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.WARLOCK = locale.raceClassTexts.Gnome.WARLOCK or {}
extend(locale.raceClassTexts.Gnome.WARLOCK, "HELLO", { "Bonjour, %s ! Ne nourrissez pas le petit démon." }, {})
extend(locale.raceClassTexts.Gnome.WARLOCK, "FAREWELL", {}, { "Je pars. Mon diablotin note encore toutes mes erreurs." })
locale.raceClassTexts.NightElf = locale.raceClassTexts.NightElf or {}
locale.raceClassTexts.NightElf.DRUID = locale.raceClassTexts.NightElf.DRUID or {}
extend(locale.raceClassTexts.NightElf.DRUID, "HELLO", { "Le vent connaît votre nom, %s. Bienvenue." }, {})
extend(locale.raceClassTexts.NightElf.DRUID, "FAREWELL", {}, { "La forêt réclame mon attention. Adieu." })
locale.raceClassTexts.Human = locale.raceClassTexts.Human or {}
locale.raceClassTexts.Human.WARRIOR = locale.raceClassTexts.Human.WARRIOR or {}
extend(locale.raceClassTexts.Human.WARRIOR, "HELLO", { "Salutations, %s. La garde veille." }, {})
extend(locale.raceClassTexts.Human.WARRIOR, "FAREWELL", {}, { "Je prends le prochain tour de garde. Reposez-vous." })
locale.raceClassTexts.Troll = locale.raceClassTexts.Troll or {}
locale.raceClassTexts.Troll.SHAMAN = locale.raceClassTexts.Troll.SHAMAN or {}
extend(locale.raceClassTexts.Troll.SHAMAN, "HELLO", { "Les esprits vous ont remarqué, %s. Bon signe !" }, {})
extend(locale.raceClassTexts.Troll.SHAMAN, "FAREWELL", {}, { "Les loa m'appellent. Je ferais mieux de répondre vite." })
locale.raceClassTexts.Undead = locale.raceClassTexts.Undead or {}
locale.raceClassTexts.Undead.ROGUE = locale.raceClassTexts.Undead.ROGUE or {}
extend(locale.raceClassTexts.Undead.ROGUE, "HELLO", { "Salutations, %s. Vous ne m'avez pas entendu ? Parfait." }, {})
extend(locale.raceClassTexts.Undead.ROGUE, "FAREWELL", {}, { "Je file. Laissez la porte ouverte, je ne frappe jamais." })
locale.raceClassTexts.BloodElf = locale.raceClassTexts.BloodElf or {}
locale.raceClassTexts.BloodElf.PRIEST = locale.raceClassTexts.BloodElf.PRIEST or {}
extend(locale.raceClassTexts.BloodElf.PRIEST, "HELLO", { "Bienvenue, %s. Qu'une douce lumière vous trouve." }, {})
extend(locale.raceClassTexts.BloodElf.PRIEST, "FAREWELL", {}, { "La Lumière demeure. Je dois poursuivre ma route." })

-- Wave 3: rogue and shaman-specific manual social actions.
extend(locale.classTexts.ROGUE, "WAVE", { "%s, nous ne nous sommes pas vus. Compris ?" }, { "Un bref salut depuis les ombres suffira.", "Même saluer discrètement demande du talent." })
extend(locale.classTexts.ROGUE, "THANK", { "Merci, %s. Cette faveur reste entre nous." }, { "Un bon alibi ne s'oublie pas.", "Une faveur réussie ne laisse aucune trace." })
extend(locale.classTexts.ROGUE, "SIT", { "Asseyez-vous, %s. D'ici, on surveille les deux portes." }, { "La place contre le mur est encore libre.", "Une chaise vide en dit plus qu'une bourse pleine." })
extend(locale.classTexts.ROGUE, "LAUGH", { "%s, c'est presque aussi bon qu'un tour de passe-passe réussi." }, { "Je ris doucement. Les gardes n'ont pas besoin de tout entendre.", "Cette plaisanterie n'a pas besoin d'alibi." })
extend(locale.classTexts.ROGUE, "SALUTE", { "Respect, %s. Vous avez l'œil vif." }, { "Un salut silencieux est parfois le plus sincère.", "Qui protège ses amis mérite le respect." })
extend(locale.classTexts.SHAMAN, "WAVE", { "Que les quatre vents vous saluent, %s." }, { "Salutations du feu, de l'eau, de l'air et de la terre.", "Que le vent emporte notre amitié." })
extend(locale.classTexts.SHAMAN, "THANK", { "Que les éléments vous remercient, %s." }, { "Votre aide a renforcé l'équilibre.", "Je vous dois plus qu'un abri au sec." })
extend(locale.classTexts.SHAMAN, "SIT", { "Asseyez-vous, %s. La terre nous porte tous deux." }, { "Même la tempête a besoin d'un instant de calme.", "J'écoute le sol. Il a beaucoup à raconter." })
extend(locale.classTexts.SHAMAN, "LAUGH", { "Même le tonnerre rit avec vous, %s." }, { "Le vent porte votre rire au loin.", "Quand les pierres ricanent, la plaisanterie est bonne." })
extend(locale.classTexts.SHAMAN, "SALUTE", { "Les ancêtres honorent votre chemin, %s." }, { "Mon respect va aux vivants comme aux esprits.", "Que le feu et l'eau vous témoignent leur respect." })

-- Distinct race/class combinations, without replacing existing lines.
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.ROGUE = locale.raceClassTexts.Gnome.ROGUE or {}
extend(locale.raceClassTexts.Gnome.ROGUE, "HELLO", { "Bonjour, %s ! Mon crochet est optimisé par l'ingénierie." }, {})
extend(locale.raceClassTexts.Gnome.ROGUE, "THANK", {}, { "Si ça clique, c'est la serrure ou le prototype." })
locale.raceClassTexts.Human = locale.raceClassTexts.Human or {}
locale.raceClassTexts.Human.ROGUE = locale.raceClassTexts.Human.ROGUE or {}
extend(locale.raceClassTexts.Human.ROGUE, "HELLO", { "Bonsoir, %s. Les gardes ne me connaissent pas." }, {})
extend(locale.raceClassTexts.Human.ROGUE, "THANK", {}, { "Certains secrets valent plus que l'argent." })
locale.raceClassTexts.Undead = locale.raceClassTexts.Undead or {}
locale.raceClassTexts.Undead.ROGUE = locale.raceClassTexts.Undead.ROGUE or {}
extend(locale.raceClassTexts.Undead.ROGUE, "HELLO", { "Bonjour, %s. Mes os ne claquent que face au vent." }, {})
extend(locale.raceClassTexts.Undead.ROGUE, "THANK", {}, { "Je disparais sans bruit, si mes articulations coopèrent." })
locale.raceClassTexts.Orc = locale.raceClassTexts.Orc or {}
locale.raceClassTexts.Orc.SHAMAN = locale.raceClassTexts.Orc.SHAMAN or {}
extend(locale.raceClassTexts.Orc.SHAMAN, "HELLO", { "Les ancêtres vous saluent, %s. Entendez-vous les tambours ?" }, {})
extend(locale.raceClassTexts.Orc.SHAMAN, "THANK", {}, { "Le vent porte des voix. J'écoute." })
locale.raceClassTexts.Tauren = locale.raceClassTexts.Tauren or {}
locale.raceClassTexts.Tauren.SHAMAN = locale.raceClassTexts.Tauren.SHAMAN or {}
extend(locale.raceClassTexts.Tauren.SHAMAN, "HELLO", { "Que la Terre-Mère bénisse votre route, %s." }, {})
extend(locale.raceClassTexts.Tauren.SHAMAN, "THANK", {}, { "Même dans le silence, la terre parle." })
locale.raceClassTexts.Troll = locale.raceClassTexts.Troll or {}
locale.raceClassTexts.Troll.SHAMAN = locale.raceClassTexts.Troll.SHAMAN or {}
extend(locale.raceClassTexts.Troll.SHAMAN, "HELLO", { "Les loa vous saluent, %s. J'espère que c'est amical." }, {})
extend(locale.raceClassTexts.Troll.SHAMAN, "THANK", {}, { "Les loa ont parlé. Je préfère éviter les questions." })
