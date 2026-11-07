-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- ==========================================
-- ALLGEMEINE RP-TEXTE
-- ==========================================

local _, addon = ...

addon.localeData.deDE.generalTexts = {

    HELLO = {
        ziel = {
            "Hallo, %s!",
            "Seid willkommen, %s.",
            "Schön, Euch kennenzulernen, %s.",
            "Guten Tag, %s. Wie geht es Euch?",
            "Es freut mich, Euch zu treffen, %s.",
        },

        gruppe = {
            "Hallo zusammen!",
            "Seid willkommen, Gefährten.",
            "Schön, Euch kennenzulernen!",
            "Guten Tag allerseits.",
            "Es freut mich, Euch alle zu treffen.",
        },
    },

    WAVE = {
        ziel = {
            "Hallo, %s! Schön, Euch zu sehen.",
            "Seid gegrüßt, %s!",
            "Grüße, %s. Wie geht es Euch?",
            "Freut mich, Euch zu sehen, %s.",
            "Seid willkommen, %s.",
            "Ein freundlicher Gruß an Euch, %s.",
        },

        gruppe = {
            "Seid gegrüßt, Gefährten!",
            "Grüße an alle!",
            "Schön, Euch alle zu sehen.",
            "Seid willkommen, Gefährten.",
            "Einen guten Tag Euch allen.",
            "Grüße an die versammelten Gefährten!",
        },
    },

    SALUTE = {
        ziel = {
            "Seid gegrüßt, %s.",
            "Ehre und Respekt, %s.",
            "Mein Gruß gilt Euch, %s.",
            "Respekt, %s.",
            "Seid gegrüßt und willkommen, %s.",
            "Ehre sei Euch, %s.",
        },

        gruppe = {
            "Ehre und Respekt!",
            "Seid gegrüßt, Kameraden.",
            "Mein Gruß gilt Euch allen.",
            "Respekt an alle Anwesenden.",
            "Seid gegrüßt, Gefährten.",
            "Ehre sei Euch!",
        },
    },

    BOW = {
        ziel = {
            "Mein Respekt sei Euch gewiss, %s.",
            "Ehre und Respekt, %s.",
            "Ich erweise Euch die Ehre, %s.",
            "Mein Gruß und Respekt gelten Euch, %s.",
            "Es ist mir eine Ehre, %s.",
            "Respekt vor Euch, %s.",
        },

        gruppe = {
            "Ehre und Respekt!",
            "Mein Respekt gilt Euch allen.",
            "Eine Verbeugung vor meinen Gefährten.",
            "Ehre sei Euch!",
            "Respekt an alle Anwesenden.",
            "Seid meiner Achtung gewiss.",
        },
    },

    LAUGH = {
        ziel = {
            "Das ist köstlich, %s!",
            "Herrlich, %s!",
            "Das war gut, %s!",
            "Bei allen Mächten, %s!",
            "Ihr bringt mich noch zum Lachen, %s.",
            "Das war wirklich gut!",
        },

        gruppe = {
            "Das ist zum Lachen!",
            "Herrlich!",
            "Das war gut!",
            "Ich kann nicht mehr!",
            "Bei allen Mächten!",
            "Das wird noch lange erzählt werden.",
        },
    },

    DANCE = {
        ziel = {
            "Ein kleiner Tanz gefällig, %s?",
            "Das muss gefeiert werden, %s!",
            "Kommt, %s. Ein Tänzchen!",
            "Heute darf man auch einmal das Tanzbein schwingen.",
            "Musik! Jetzt fehlt nur noch Ihr, %s.",
            "Wer sagt, dass Helden nicht tanzen können?",
        },

        gruppe = {
            "Zeit für einen Tanz!",
            "Wer sagt, dass Helden nicht tanzen können?",
            "Musik her!",
            "Heute wird nicht nur gekämpft.",
            "Ein Tänzchen zur Abwechslung.",
            "Lasst die Feier beginnen!",
        },
    },

    SIT = {
        ziel = {
            "Eine kleine Rast, %s.",
            "Setzt Euch ruhig, %s.",
            "Wir können eine Pause gebrauchen.",
            "Für einen Moment darf die Welt warten.",
            "Zeit, die Beine auszuruhen.",
            "Setzt Euch. Ihr habt es verdient.",
        },

        gruppe = {
            "Zeit für eine Rast.",
            "Beine hoch, die Welt kann warten.",
            "Eine kurze Pause schadet niemandem.",
            "Lasst uns einen Moment verschnaufen.",
            "Zeit zum Ausruhen.",
            "Die nächste Schlacht läuft uns nicht davon.",
        },
    },

    SLEEP = {
        ziel = {
            "Möge die Nacht Euch Ruhe bringen, %s.",
            "Schlaft gut, %s.",
            "Erholt Euch gut, %s.",
            "Möge Euer Schlaf friedlich sein.",
            "Die Nacht sei Euch gnädig, %s.",
            "Ruht Euch aus, %s.",
        },

        gruppe = {
            "Zeit für etwas Ruhe.",
            "Morgen wird weitergemacht.",
            "Möge die Nacht uns Erholung bringen.",
            "Genug für heute.",
            "Zeit, die Waffen niederzulegen.",
            "Ruht Euch aus, Gefährten.",
        },
    },

    THANK = {
        ziel = {
            "Habt Dank für Eure Hilfe, %s.",
            "Ich danke Euch, %s.",
            "Ihr habt meinen Dank, %s.",
            "Das werde ich Euch nicht vergessen, %s.",
            "Vielen Dank, %s. Ihr habt mir sehr geholfen.",
        },

        gruppe = {
            "Habt Dank für Eure Hilfe!",
            "Mein Dank gilt Euch allen.",
            "Vielen Dank, Gefährten.",
            "Ich weiß Eure Unterstützung zu schätzen.",
            "Ihr habt meinen Dank.",
        },
    },
    FLIRT = {
        ziel = {
            "Ihr habt meine Aufmerksamkeit, %s.",
            "Eure Gesellschaft ist ausgesprochen angenehm, %s.",
            "Darf ich Euch ein Kompliment machen, %s?",
        },
        gruppe = {
            "Ein wenig Charme darf sein.",
            "Gute Gesellschaft macht jeden Weg angenehmer.",
            "Heute liegt etwas Besonderes in der Luft.",
        },
    },

    -- Zehn weitere universelle RP-Emotes mit /say und /me
    APPLAUD = { gruppe = { "Ein wohlverdienter Applaus!", "Manche Taten brauchen keinen langen Kommentar.", "*klatscht begeistert in die Hände.*", "*nickt anerkennend und applaudiert.*" }, ziel = { "%s, das habt Ihr Euch redlich verdient!" } },
    SORRY = { gruppe = { "Manchmal reicht ein Wort. Dieses hier ist überfällig: Verzeiht.", "Es tut mir leid. Ich werde es besser machen.", "*senkt den Blick und neigt entschuldigend den Kopf.*", "*legt eine Hand auf die Brust und bittet um Nachsicht.*" }, ziel = { "%s, ich bitte Euch um Verzeihung." } },
    CHEER = { gruppe = { "Darauf können wir stolz sein!", "Ein Hoch auf die, die nicht aufgegeben haben!", "*reißt jubelnd beide Arme in die Höhe.*", "*stößt einen begeisterten Freudenruf aus.*" }, ziel = { "Gut gemacht, %s! Weiter so!" } },
    WAIT = { gruppe = { "Einen Augenblick noch. Nicht jeder Weg muss im Laufschritt beginnen.", "Wer wartet, hört manchmal mehr als der Eilige.", "*hebt die offene Hand als Zeichen zum Innehalten.*", "*tritt beiseite und überprüft die Umgebung.*" }, ziel = { "Wartet bitte kurz, %s." } },
    SHRUG = { gruppe = { "Nun ja. Nicht jedes Rätsel muss heute gelöst werden.", "Manchmal ist ein Schulterzucken die klügste Antwort.", "*hebt fragend beide Schultern.*", "*zieht die Augenbrauen hoch und breitet die Hände aus.*" }, ziel = { "%s, was soll ich dazu sagen?" } },
    POINT = { gruppe = { "Da drüben! Seht Ihr es auch?", "Der Weg führt eindeutig in diese Richtung.", "*deutet entschlossen auf einen Punkt am Horizont.*", "*zeichnet mit dem Finger eine Richtung in die Luft.*" }, ziel = { "%s, dort entlang!" } },
    CHEERS = { gruppe = { "Auf die Heimkehr und auf die Geschichten dazwischen!", "Ein guter Trinkspruch braucht gute Gesellschaft.", "*hebt den Becher und grinst in die Runde.*", "*stößt mit den Gefährten an.*" }, ziel = { "Zum Wohl, %s! Auf Euch!" } },
    COMFORT = { gruppe = { "Es muss nicht gleich alles wieder gut sein.", "Ich kann die Last nicht wegreden, aber ein Stück mittragen.", "*setzt sich still neben einen erschöpften Gefährten.*", "*legt behutsam eine Hand auf die Schulter.*" }, ziel = { "%s, Ihr müsst das nicht allein tragen." } },
    HUG = { gruppe = { "Manchmal ist eine Umarmung die ganze Antwort.", "Kommt her. Für einen Moment ist die Welt klein genug.", "*öffnet einladend beide Arme.*", "*umarmt einen vertrauten Gefährten herzlich.*" }, ziel = { "%s, lasst Euch drücken." } },
    KNEEL = { gruppe = { "Respekt zeigt sich am deutlichsten ohne große Worte.", "Für diesen Augenblick knie ich aus freiem Willen.", "*geht auf ein Knie und neigt den Kopf.*", "*stützt sich kurz auf den Boden und verharrt in einer ruhigen Geste.*" }, ziel = { "Vor Euch, %s, neige ich mein Haupt." } },
}