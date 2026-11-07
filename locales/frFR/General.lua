-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.generalTexts = {HELLO={ziel={"Salutations, %s.","Heureux de vous voir, %s."},gruppe={"Salutations à tous."}},WAVE={ziel={"Un salut amical pour vous, %s."},gruppe={"Un salut amical à tous."}},SALUTE={ziel={"Tout mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},BOW={ziel={"Je m'incline avec respect, %s."},gruppe={"Je m'incline avec respect devant vous tous."}},LAUGH={ziel={"Ha ! Bien dit, %s."},gruppe={"Ha ! Bien dit."}},DANCE={ziel={"Une danse, %s ?"},gruppe={"Venez, dansons !"}},SIT={ziel={"Asseyez-vous, %s."},gruppe={"Prenons un peu de repos."}},SLEEP={ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},THANK={ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    FLIRT = {
        ziel = {
            "Vous avez mon attention, %s.",
            "Votre compagnie est particulièrement agréable, %s.",
            "Puis-je vous faire un compliment, %s ?",
        },
        gruppe = {
            "Un peu de charme ne fait jamais de mal.",
            "La bonne compagnie rend chaque route plus agréable.",
            "Il y a quelque chose de spécial dans l'air ce soir.",
        },
    },
    -- Zehn weitere universelle RP-Emotes mit /say und /me
    APPLAUD = { gruppe = { "Des applaudissements bien mérités !", "Certains gestes valent mieux qu'un long discours.", "*applaudit avec un enthousiasme sincère.*", "*hoche la tête avec admiration et applaudit.*" }, ziel = { "Tu as bien mérité ces éloges, %s !" } },
    SORRY = { gruppe = { "Parfois un seul mot suffit. Celui-ci arrive tard : pardon.", "Je suis désolé. Je ferai mieux.", "*baisse les yeux et incline la tête en signe d'excuse.*", "*pose la main sur son cœur et demande pardon.*" }, ziel = { "%s, accepte mes excuses." } },
    CHEER = { gruppe = { "Voilà de quoi être fier !", "À tous ceux qui n'ont pas renoncé !", "*lève les deux bras en signe de joie.*", "*pousse une acclamation enthousiaste.*" }, ziel = { "Bravo, %s ! Continue !" } },
    WAIT = { gruppe = { "Un instant. Chaque chemin ne doit pas commencer en courant.", "Qui attend entend parfois ce que les autres manquent.", "*lève une main ouverte pour demander une pause.*", "*se décale et vérifie les environs.*" }, ziel = { "Attends un instant, %s." } },
    SHRUG = { gruppe = { "Eh bien. Tous les mystères n'exigent pas une réponse aujourd'hui.", "Parfois hausser les épaules est la meilleure réponse.", "*hausse les deux épaules d'un air interrogateur.*", "*relève les sourcils et ouvre les mains.*" }, ziel = { "%s, que veux-tu que je dise ?" } },
    POINT = { gruppe = { "Là-bas ! Tu le vois aussi ?", "Le chemin mène clairement dans cette direction.", "*pointe du doigt un lieu à l'horizon.*", "*dessine une direction dans l'air.*" }, ziel = { "Par ici, %s !" } },
    CHEERS = { gruppe = { "Au retour, et à toutes les histoires du voyage !", "Un bon toast demande une bonne compagnie.", "*lève sa chope et sourit à l'assemblée.*", "*trinque avec ses compagnons.*" }, ziel = { "Santé, %s ! À toi !" } },
    COMFORT = { gruppe = { "Tout n'a pas besoin d'aller bien immédiatement.", "Je ne peux effacer ce fardeau, mais en porter une partie.", "*s'assied tranquillement près d'un compagnon fatigué.*", "*pose doucement une main sur une épaule.*" }, ziel = { "%s, tu n'as pas à porter cela seul." } },
    HUG = { gruppe = { "Parfois une étreinte répond à tout.", "Approche. Un instant, le monde peut être assez petit.", "*ouvre les deux bras pour accueillir quelqu'un.*", "*serre chaleureusement un ami dans ses bras.*" }, ziel = { "%s, viens que je te serre dans mes bras." } },
    KNEEL = { gruppe = { "Le respect s'exprime sans grand discours.", "En cet instant, je m'agenouille de mon plein gré.", "*met un genou à terre et incline la tête.*", "*pose la main sur le sol et garde une attitude calme.*" }, ziel = { "Devant toi, %s, j'incline la tête." } },
}