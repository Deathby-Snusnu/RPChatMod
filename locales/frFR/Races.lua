-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.raceTexts = {
    ["Dwarf"] = {
        HELLO = {ziel={"La pierre et l’acier vous saluent, %s."},gruppe={"La pierre et l’acier vous saluent tous."}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "Par ma barbe, %s, vous êtes plus distrayant qu'un tonneau vide.",
                "Continuez ainsi, %s, et je vais devoir vous offrir une chope.",
                "%s, vous venez de mériter un regard plutôt prolongé.",
            },
            gruppe = {
                "Par ma barbe, il fait soudain plus chaud ici.",
                "Une bonne soirée, de bonne compagnie... il ne manque qu'une chope.",
                "Certains trésors ne se trouvent pas sous terre.",
            },
        },
},
    ["Orc"] = {
        HELLO = {ziel={"Force et honneur, %s."},gruppe={"Force et honneur !"}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "Vous avez de la force, %s. Ça me plaît.",
                "%s, je marcherais volontiers à vos côtés dans la prochaine bataille.",
                "Pas besoin de longs discours, %s. Vous avez attiré mon regard.",
            },
            gruppe = {
                "La force reconnaît la force.",
                "Certains regards n'ont pas besoin de grands discours.",
                "Ce soir, je me bats peut-être pour autre chose que l'honneur.",
            },
        },
},
    ["Human"] = {
        HELLO = {ziel={"Bien rencontré, %s."},gruppe={"Bien rencontrés, mes amis."}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "Vous avez un sourire remarquable, %s.",
                "Puis-je dire, %s, que votre présence améliore considérablement cet endroit ?",
                "Approchez encore, %s, et je risque d'oublier mes bonnes manières.",
            },
            gruppe = {
                "Un peu de charme n'a jamais gâché une soirée.",
                "La bonne compagnie est parfois la meilleure récompense.",
                "Il y a quelque chose d'agréable dans l'air ce soir.",
            },
        },
},
    ["NightElf"] = {
        HELLO = {ziel={"Qu’Élune éclaire votre chemin, %s."},gruppe={"Qu’Élune veille sur nous."}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "Le clair de lune vous va bien, %s.",
                "Élune a dû être particulièrement attentive aujourd'hui, %s.",
                "Votre présence est plus douce qu'un bosquet silencieux au clair de lune, %s.",
            },
            gruppe = {
                "Sous les étoiles, certaines rencontres semblent plus importantes.",
                "La lune éclaire manifestement les bonnes choses ce soir.",
                "Même une longue route paraît plus légère en bonne compagnie.",
            },
        },
},
    ["BloodElf"] = {
        HELLO = {ziel={"Que le soleil vous guide, %s."},gruppe={"Que le soleil nous guide tous."}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "%s, vous êtes presque aussi fascinant que moi. Presque.",
                "Vous avez du goût, %s. Après tout, vous me parlez.",
                "Cette allure, %s... agréablement raffinée.",
            },
            gruppe = {
                "L'élégance reconnaît l'élégance.",
                "Un peu de beauté améliore toute compagnie.",
                "La bonne compagnie mérite toujours d'être remarquée.",
            },
        },
},
    ["Gnome"] = {
        HELLO = {ziel={"Timing excellent, %s !"},gruppe={"Timing excellent, tout le monde !"}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "Vos yeux ont une luminosité remarquablement élevée, %s. Observation purement scientifique, bien sûr.",
                "Si vous étiez une expérience, %s, je programmerais sans hésiter une seconde série de mesures.",
                "Je crois qu'il existe une certaine tension électrique entre nous, %s.",
            },
            gruppe = {
                "Intéressant. Mon pouls dépasse les paramètres attendus.",
                "La romance n'est probablement que de la chimie. Une chimie étonnamment divertissante.",
                "Je devrais étudier cela. Très soigneusement.",
            },
        },
},
    ["Undead"] = {
        HELLO = {ziel={"Vous respirez encore, %s. Quelle application."},gruppe={"Une assemblée remarquablement vivante."}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "%s, mon cœur battrait pour vous. S'il battait encore.",
                "Vous avez l'air remarquablement vivant, %s. C'est un compliment.",
                "%s, vous apportez un peu de chaleur à mon existence plutôt froide.",
            },
            gruppe = {
                "La romance n'est pas morte. Seulement parfois réprouvée.",
                "Qui a besoin d'un cœur qui s'emballe ?",
                "Même la mort a du goût, apparemment.",
            },
        },
},
    ["Troll"] = {
        HELLO = {ziel={"Que les bons esprits vous suivent, %s."},gruppe={"Que les bons esprits nous suivent tous."}},
        WAVE = {ziel={"Un salut chaleureux pour vous, %s."},gruppe={"Un salut chaleureux à tous."}},
        SALUTE = {ziel={"Vous avez mon respect, %s."},gruppe={"Tout mon respect à vous tous."}},
        BOW = {ziel={"Je m’incline devant vous, %s."},gruppe={"Je m’incline devant vous tous."}},
        LAUGH = {ziel={"Ha ! Bien joué, %s."},gruppe={"Ha ! Bien joué."}},
        DANCE = {ziel={"Dansez avec moi, %s."},gruppe={"Venez, dansons."}},
        SIT = {ziel={"Asseyez-vous avec moi, %s."},gruppe={"Reposons-nous un instant."}},
        SLEEP = {ziel={"Dormez bien, %s."},gruppe={"Reposez-vous bien, tous."}},
        THANK = {ziel={"Merci, %s."},gruppe={"Merci à tous."}},
    
        FLIRT = {
            ziel = {
                "Hé, %s, j'aime bien ce sourire.",
                "%s, vous avez un bon mojo. Un très bon mojo.",
                "Approchez, %s. Je ne mords que quand tout se passe bien.",
            },
            gruppe = {
                "Le mojo se sent particulièrement amical aujourd'hui.",
                "Héhé... il pourrait se passer quelque chose.",
                "Le bon mojo reconnaît le bon mojo.",
            },
        },
},
    ["Skyborne"] = {
        HELLO = {ziel={
            "Le vent vous a porté jusqu'à moi, %s. Bienvenue.",
            "Entre ciel et terre, il reste de la place pour de nouvelles rencontres, %s.",
        },gruppe={"Le vent a rassemblé de bonne compagnie."}},
        WAVE = {ziel={"Que le vent porte mon salut jusqu'à vous, %s."},gruppe={"Un salut venu du grand ciel !"}},
        SALUTE = {ziel={"Ciel libre au-dessus de vous, %s. Tout mon respect."},gruppe={"Ciel libre au-dessus de nous. Tout mon respect."}},
        BOW = {ziel={"Je m'incline devant votre chemin, %s. Que le vent vous porte."},gruppe={"Que le vent nous porte tous en sûreté."}},
        LAUGH = {ziel={"Par Zephras, elle était bonne, celle-là, %s !"},gruppe={"Par Zephras, elle était bonne !"}},
        DANCE = {ziel={"Le vent connaît déjà le rythme, %s."},gruppe={"Le vent connaît déjà le rythme."}},
        SIT = {ziel={"Asseyez-vous, %s. Même le vent se repose parfois."},gruppe={"Même le vent se repose parfois. Faisons une pause."}},
        SLEEP = {ziel={"Dormez bien, %s. Que le vent porte doucement vos rêves."},gruppe={"Que le vent porte doucement nos rêves."}},
        THANK = {ziel={"Merci, %s. Votre aide fut un courant ascendant bienvenu."},gruppe={"Merci. Vous avez été un courant ascendant bienvenu."}},
    
        FLIRT = {
            ziel = {
                "Le vent revient sans cesse vers vous, %s. Je le comprends.",
                "%s, vous rendez difficile de garder les yeux sur l'horizon.",
                "Si vous voulez, %s, je partagerai le prochain courant ascendant avec vous.",
            },
            gruppe = {
                "Certaines rencontres portent plus loin que n'importe quel vent.",
                "Le ciel est vaste, mais la bonne compagnie est rare.",
                "Aujourd'hui, le vent porte une pensée particulièrement agréable.",
            },
        },
},
    ["Tauren"] = {

        HELLO = {
            ziel = {
                "Que la Terre-Mère vous salue, %s.",
                "Bienvenue, %s. Que votre chemin soit paisible.",
                "Il est bon de vous voir, %s.",
            },
            gruppe = {
                "Que la Terre-Mère nous salue tous.",
                "Bienvenue. Que nos chemins soient sûrs.",
                "Il est bon d'avoir des compagnons près du feu.",
            },
        },
        WAVE = {
            ziel = {
                "Un salut paisible, %s.",
                "Que le vent vous accueille avec douceur, %s.",
                "Que la Terre-Mère vous accompagne, %s.",
            },
            gruppe = {
                "Un salut à tous les compagnons.",
                "Que le vent nous accueille avec douceur.",
                "Que la Terre-Mère guide nos pas.",
            },
        },
        SALUTE = {
            ziel = {
                "Vous avez mon respect, %s.",
                "Que les ancêtres veillent sur vous, %s.",
                "Honneur à votre chemin, %s.",
            },
            gruppe = {
                "Respect et honneur.",
                "Que les ancêtres veillent sur nous.",
                "Honneur aux chemins que nous partageons.",
            },
        },
        BOW = {
            ziel = {
                "J'incline la tête devant vous, %s.",
                "Avec respect, %s.",
                "Que la Terre-Mère nous enseigne l'humilité, %s.",
            },
            gruppe = {
                "J'incline la tête devant vous.",
                "Avec respect, compagnons.",
                "Que la Terre-Mère nous enseigne l'humilité.",
            },
        },
        LAUGH = {
            ziel = {
                "Ha ! Cela fait du bien, %s.",
                "Votre rire est contagieux, %s.",
                "Un esprit léger voyage loin, %s.",
            },
            gruppe = {
                "Ha ! Un bon rire réchauffe le cœur.",
                "Un esprit léger voyage loin.",
                "Même les chemins sérieux ont besoin de joie.",
            },
        },
        DANCE = {
            ziel = {
                "Venez, %s. Que la terre porte notre rythme.",
                "Dansez avec moi, %s.",
                "Un peu de joie honore la vie, %s.",
            },
            gruppe = {
                "Que la terre porte notre rythme.",
                "Dansez, compagnons.",
                "Un peu de joie honore la vie.",
            },
        },
        SIT = {
            ziel = {
                "Asseyez-vous avec moi, %s. La route peut attendre.",
                "Reposez vos jambes, %s.",
                "Un moment de calme fait du bien, %s.",
            },
            gruppe = {
                "Asseyez-vous. La route peut attendre.",
                "Reposez vos jambes, compagnons.",
                "Un moment de calme fait du bien.",
            },
        },
        SLEEP = {
            ziel = {
                "Reposez-vous bien, %s. Que la Terre-Mère veille sur votre sommeil.",
                "Dormez paisiblement, %s.",
                "Demain, la terre portera de nouveau vos pas, %s.",
            },
            gruppe = {
                "Reposez-vous bien. Que la Terre-Mère veille sur nous.",
                "Dormez paisiblement.",
                "Demain, la terre portera de nouveau nos pas.",
            },
        },
        THANK = {
            ziel = {
                "Vous avez ma gratitude, %s.",
                "Que la Terre-Mère récompense votre aide, %s.",
                "Je n'oublierai pas votre bonté, %s.",
            },
            gruppe = {
                "Vous avez ma gratitude.",
                "Que la Terre-Mère récompense votre aide.",
                "La bonté n'est pas oubliée.",
            },
        },
        FLIRT = {
            ziel = {
                "La Terre-Mère vous a donné un regard apaisant, %s.",
                "%s, après une longue journée, je partagerais volontiers une place près du feu avec vous.",
                "Votre présence affermit mon pas, %s.",
            },
            gruppe = {
                "La bonne compagnie réchauffe mieux que bien des feux.",
                "Certains chemins sont meilleurs à deux.",
                "La Terre-Mère nous offre parfois de très agréables rencontres.",
            },
        },
    },

    ["Draenei"] = {

        HELLO = {
            ziel = {
                "Que la Lumière vous salue, %s.",
                "Bienvenue, %s. Que les étoiles guident votre chemin.",
                "Je suis heureux de vous rencontrer, %s.",
            },
            gruppe = {
                "Que la Lumière vous salue tous.",
                "Bienvenue. Que les étoiles guident nos chemins.",
                "Une heureuse rencontre.",
            },
        },
        WAVE = {
            ziel = {
                "Salutations, %s.",
                "Que la Lumière soit avec vous, %s.",
                "Le salut d'un voyageur à un autre, %s.",
            },
            gruppe = {
                "Salutations.",
                "Que la Lumière soit avec nous.",
                "Un salut à tous les voyageurs.",
            },
        },
        SALUTE = {
            ziel = {
                "Honneur et Lumière, %s.",
                "Vous avez mon respect, %s.",
                "Que les naaru éclairent votre chemin, %s.",
            },
            gruppe = {
                "Honneur et Lumière.",
                "Vous avez mon respect.",
                "Que les naaru éclairent nos chemins.",
            },
        },
        BOW = {
            ziel = {
                "Je m'incline devant vous, %s.",
                "Avec respect, %s.",
                "Que l'humilité éclaire notre regard, %s.",
            },
            gruppe = {
                "Je m'incline devant vous.",
                "Avec respect, compagnons.",
                "Que l'humilité éclaire notre regard.",
            },
        },
        LAUGH = {
            ziel = {
                "C'était délicieux, %s.",
                "Vous rendez même une longue route plus lumineuse, %s.",
                "Un bon rire est bienvenu sur tout voyage, %s.",
            },
            gruppe = {
                "Un bon rire est bienvenu sur tout voyage.",
                "La joie allège même les longues routes.",
                "La Lumière connaît aussi le rire.",
            },
        },
        DANCE = {
            ziel = {
                "Dansez avec moi, %s. Même les voyageurs peuvent célébrer.",
                "Un pas pour la joie, %s.",
                "Donnons aux étoiles quelque chose à regarder, %s.",
            },
            gruppe = {
                "Même les voyageurs peuvent célébrer.",
                "Un pas pour la joie.",
                "Donnons aux étoiles quelque chose à regarder.",
            },
        },
        SIT = {
            ziel = {
                "Asseyez-vous, %s. Même les longs voyages ont besoin de pauses.",
                "Reposez-vous un instant, %s.",
                "Le prochain pas peut attendre, %s.",
            },
            gruppe = {
                "Asseyez-vous. Même les longs voyages ont besoin de pauses.",
                "Reposez-vous un instant.",
                "Le prochain pas peut attendre.",
            },
        },
        SLEEP = {
            ziel = {
                "Reposez-vous bien, %s. Que les étoiles veillent sur vous.",
                "Dormez paisiblement, %s.",
                "Que la Lumière accompagne vos rêves, %s.",
            },
            gruppe = {
                "Reposez-vous bien. Que les étoiles veillent sur nous.",
                "Dormez paisiblement.",
                "Que la Lumière accompagne nos rêves.",
            },
        },
        THANK = {
            ziel = {
                "Merci, %s. Que la Lumière récompense votre bonté.",
                "Votre aide vous honore, %s.",
                "Je n'oublierai pas votre aide au cours de mon voyage, %s.",
            },
            gruppe = {
                "Merci. Que la Lumière récompense votre bonté.",
                "Votre aide vous honore.",
                "Une telle aide n'est jamais oubliée au cours d'un long voyage.",
            },
        },
        FLIRT = {
            ziel = {
                "La lumière des étoiles vous va bien, %s.",
                "%s, votre présence raccourcit même les longs voyages.",
                "Si les naaru mesuraient la beauté, %s, ils auraient fort à faire aujourd'hui.",
            },
            gruppe = {
                "Même au cours des longs voyages, de belles rencontres surviennent.",
                "Les étoiles semblent particulièrement bienveillantes ce soir.",
                "Certaines rencontres sont de petits cadeaux du destin.",
            },
        },
    },


}
