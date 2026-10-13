-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- ==========================================
-- RP CHAT MOD
-- RASSE + KLASSE
-- BESONDERE KOMBINATIONEN
-- ==========================================

local _, addon = ...

addon.localeData.deDE.raceClassTexts = {

    -- ======================================
    -- ZWERG + PALADIN
    -- ======================================

    ["Dwarf"] = {

        ["PALADIN"] = {

            HELLO = {
                ziel = {
                    "Bei meiner Axt, gut Euch zu sehen, %s! Das Licht führt Euch sicher hierher.",
                    "Seid willkommen, Streiter des Lichts. Ein Krug wartet, %s.",
                    "Ein Freund der Zwerge und des Lichts! Gut, Euch zu sehen, %s.",
                },

                gruppe = {
                    "Bei meiner Axt! Das Licht führt gute Gefährten zusammen.",
                    "Seid willkommen, Streiter des Lichts. Ein Krug wartet.",
                    "Freunde der Zwerge und des Lichts, tretet näher!",
                },
            },

            WAVE = {
                ziel = {
                    "Bei meiner Axt, gut Euch zu sehen, %s! Das Licht sei mit Euch.",
                    "Möge das Licht Euren Hammer führen, %s.",
                    "Ein Zwergengruß und der Segen des Lichts!",
                    "Seid gegrüßt, %s. Stein, Stahl und Licht!",
                    "Das Licht sei mit Euch, Kamerad.",
                    "Bei meiner Axt! Ein Freund des Lichts!",
                },

                gruppe = {
                    "Bei meiner Axt! Das Licht sei mit uns.",
                    "Ehre, Axt und Licht!",
                    "Stein, Stahl und das Licht!",
                    "Für Khaz Modan und das Licht!",
                    "Möge unser Hammer fest und unser Glaube stark sein.",
                    "Ehre den Zwergen und dem Licht!",
                },
            },

            SALUTE = {
                ziel = {
                    "Ehre und Licht, %s.",
                    "Ein Fassbart entbietet Euch seinen Gruß.",
                    "Möge das Licht Euren Weg erhellen.",
                    "Bei meiner Axt: Respekt und Ehre.",
                    "Das Licht sei mit Euch, Kamerad.",
                    "Ehre Eurem Hammer und Eurem Glauben.",
                },

                gruppe = {
                    "Für Khaz Modan und das Licht!",
                    "Ehre, Hammer und Licht!",
                    "Bei meiner Axt!",
                    "Stein und Stahl, Licht und Ehre!",
                    "Das Licht wache über die Söhne Khaz Modans.",
                    "Ehre den Zwergen und dem Licht!",
                },
            },

            SIT = {
                ziel = {
                    "Bier her, %s. Das Licht kann warten.",
                    "Zeit für eine zwergische Andacht... am Fass.",
                    "Der Hammer ruht. Das Bier bleibt.",
                    "Eine kleine Rast im Namen des Lichts.",
                    "Setzt Euch. Ein Zwerg muss schließlich trinken.",
                    "Das Licht wacht. Ich trinke.",
                },

                gruppe = {
                    "Bier her, Beine hoch!",
                    "Das Licht wacht. Das Fass ruft.",
                    "Der Hammer ruht!",
                    "Eine zwergische Andacht am Fass.",
                    "Ehre, Axt und gutes Bier!",
                    "Paladine brauchen auch eine Pause.",
                },
            },
        },


    -- ======================================
    -- ZWERG + SHAMAN
    -- ======================================

        ["SHAMAN"] = {

            HELLO = {
                ziel = {
                    "Bei Stein und Stahl, %s! Die Elemente heißen Euch willkommen.",
                    "Möge die Erde Euch tragen und der Wind Euch grüßen, %s.",
                    "Ein Freund der Berge und der Geister! Seid willkommen, %s.",
                },

                gruppe = {
                    "Stein, Stahl und Elementargeister heißen Euch willkommen!",
                    "Möge die Erde uns tragen und der Wind uns grüßen.",
                    "Freunde der Berge und der Geister, tretet näher!",
                },
            },

            WAVE = {
                ziel = {
                    "Bei Stein und Stahl, %s! Die Elemente grüßen Euch.",
                    "Die Berge sprechen Euren Namen, %s.",
                    "Möge die Erde Euch tragen, Kamerad.",
                    "Bei meiner Axt! Ein Diener der Elemente.",
                    "Möge der Wind durch Euren Bart wehen.",
                    "Stein, Stahl und Elementargeister!",
                },

                gruppe = {
                    "Stein, Stahl und Elementargeister!",
                    "Die Berge sprechen zu uns!",
                    "Möge die Erde uns tragen.",
                    "Bei meiner Axt! Die Elemente sind mit uns.",
                    "Ehre den Bergen und den Geistern.",
                    "Möge der Wind unsere Bärte bewegen!",
                },
            },

            SALUTE = {
                ziel = {
                    "Ehre den Bergen und Euch, %s.",
                    "Die Elemente seien mit Euch.",
                    "Möge die Erde Euren Weg tragen.",
                    "Bei meiner Axt: Respekt!",
                    "Stein und Stahl, Erde und Wind.",
                    "Die Geister der Berge grüßen Euch.",
                },

                gruppe = {
                    "Ehre den Bergen!",
                    "Stein und Stahl!",
                    "Die Elemente seien mit uns.",
                    "Erde, Wind, Feuer und Wasser!",
                    "Möge die Erde unsere Schritte tragen.",
                    "Bei meiner Axt!",
                },
            },
        },
    },


    -- ======================================
    -- ORC + MAGE
    -- ======================================

    ["Orc"] = {

        ["MAGE"] = {

            HELLO = {
                ziel = {
                    "Lok'tar, %s. Möge Eure arkane Macht der Horde dienen.",
                    "Seid willkommen, Zauberwirker. Die Elemente beobachten Euch, %s.",
                    "Stärke und Arkana, %s! Gut, Euch zu treffen.",
                },

                gruppe = {
                    "Lok'tar! Möge die arkane Macht der Horde dienen.",
                    "Seid willkommen, Zauberwirker. Die Elemente beobachten uns.",
                    "Stärke und Arkana! Gut, Euch zu treffen.",
                },
            },

            WAVE = {
                ziel = {
                    "Lok'tar, %s! Die Magie sei mit Euch.",
                    "Ein Ork und ein Magier. Interessante Kombination.",
                    "Seid gegrüßt, %s. Möge Eure Magie stark sein.",
                    "Die Elemente hören auf Eure Worte.",
                    "Stärke und Arkana, %s!",
                    "Lok'tar ogar, Zauberwirker!",
                },

                gruppe = {
                    "Stärke und Arkana!",
                    "Lok'tar ogar, Zauberwirker!",
                    "Die Magie sei mit der Horde.",
                    "Macht und Wissen!",
                    "Die Elemente sollen uns gewogen sein.",
                    "Für die Horde und die arkanen Künste!",
                },
            },

            SALUTE = {
                ziel = {
                    "Stärke und Ehre, %s.",
                    "Lok'tar, Zauberwirker.",
                    "Möge Eure Magie niemals versagen.",
                    "Ehre Eurer Stärke und Eurem Wissen.",
                    "Respekt vor Euren arkanen Künsten.",
                    "Die Horde grüßt Euch.",
                },

                gruppe = {
                    "Stärke und Ehre!",
                    "Für die Horde und die Magie!",
                    "Macht und Wissen!",
                    "Lok'tar ogar!",
                    "Ehre den Zauberwirkern der Horde.",
                    "Die Magie dient der Stärke.",
                },
            },
        },
    },


    -- ======================================
    -- UNTOTER + PALADIN
    -- ======================================

    ["Undead"] = {

        ["PALADIN"] = {

            HELLO = {
                ziel = {
                    "Seid willkommen, %s. Das Licht findet wahrlich seltsame Wege.",
                    "Ein Diener des Lichts unter den Verlassenen. Seid gegrüßt, %s.",
                    "Das Licht sei mit Euch, auch wenn die Schatten zusehen, %s.",
                },

                gruppe = {
                    "Seid willkommen. Das Licht findet wahrlich seltsame Wege.",
                    "Ein Diener des Lichts unter den Verlassenen. Seid gegrüßt.",
                    "Das Licht sei mit Euch, auch wenn die Schatten zusehen.",
                },
            },

            WAVE = {
                ziel = {
                    "Das Licht sei... mit Euch, %s.",
                    "Ein Paladin unter den Untoten. Interessant.",
                    "Seid gegrüßt, %s. Das Licht besitzt offenbar einen eigenwilligen Sinn für Ironie.",
                    "Die Schatten und das Licht grüßen Euch.",
                    "Möge das Licht Euch nicht blenden.",
                    "Ein ungewöhnlicher Diener des Lichts.",
                },

                gruppe = {
                    "Das Licht... ist überraschend hartnäckig.",
                    "Untote und Paladine. Das Licht geht seltsame Wege.",
                    "Die Schatten treffen auf das Licht.",
                    "Das Licht möge uns vergeben.",
                    "Heute sind die Gegensätze besonders zahlreich.",
                    "Ein gesegneter Gruß aus dem Jenseits.",
                },
            },

            SALUTE = {
                ziel = {
                    "Ehre und... Licht, %s.",
                    "Das Licht hat Euch offenbar noch nicht vergessen.",
                    "Respekt, Diener des Lichts.",
                    "Eine ungewöhnliche Verbindung von Tod und Licht.",
                    "Möge das Licht Euch erhalten.",
                    "Ich respektiere Euren Glauben.",
                },

                gruppe = {
                    "Ehre und Licht!",
                    "Tod und Licht. Eine interessante Allianz.",
                    "Das Licht besitzt offenbar einen eigenwilligen Sinn für Ironie.",
                    "Möge das Licht uns vergeben.",
                    "Respekt vor den Dienern des Lichts.",
                    "Die Schatten beobachten Euch.",
                },
            },
        },
    },


    -- ======================================
    -- GNOM + PRIEST
    -- ======================================

    ["Gnome"] = {

        ["PRIEST"] = {

            HELLO = {
                ziel = {
                    "Seid willkommen, %s. Glaube und Wissenschaft grüßen Euch.",
                    "Das Licht sei mit Euch. Ich habe Eure Ankunft beinahe berechnet, %s.",
                    "Hallo, %s! Euer geistiger Zustand scheint ausgezeichnet.",
                },

                gruppe = {
                    "Seid willkommen. Glaube und Wissenschaft grüßen Euch.",
                    "Das Licht sei mit Euch. Eure Ankunft war beinahe berechenbar.",
                    "Hallo zusammen! Euer geistiger Zustand scheint ausgezeichnet.",
                },
            },

            WAVE = {
                ziel = {
                    "Das Licht sei mit Euch, %s! Wissenschaftlich bestätigt.",
                    "Seid gesegnet! Ich habe das natürlich dokumentiert.",
                    "Hallo, %s! Möge Euer Geist stabil bleiben.",
                    "Ein heiliger Gruß mit technisch einwandfreier Präzision.",
                    "Das Licht grüßt Euch!",
                    "Willkommen! Keine Sorge, der Segen ist getestet.",
                },

                gruppe = {
                    "Das Licht sei mit uns! Alles wissenschaftlich überprüft.",
                    "Seid gesegnet, Freunde!",
                    "Glaube und Erkenntnis schließen einander nicht aus.",
                    "Die geistige Stabilität liegt im erwarteten Bereich.",
                    "Ein gesegneter Gruß!",
                    "Keine Sorge. Der Segen wurde gewissenhaft geprüft.",
                },
            },

            SALUTE = {
                ziel = {
                    "Das Licht segne Euch, %s.",
                    "Ehre und Erkenntnis!",
                    "Möge Euer Geist scharf bleiben.",
                    "Ein wissenschaftlich geprüfter Segen.",
                    "Seid meiner Achtung gewiss.",
                    "Möge das Licht Euren Weg erhellen.",
                },

                gruppe = {
                    "Ehre, Erkenntnis und Licht!",
                    "Das Licht sei mit uns!",
                    "Möge unser Geist scharf bleiben.",
                    "Wissenschaft und Glaube!",
                    "Ein gesegneter Gruß!",
                    "Das Licht wache über uns.",
                },
            },
        },
    },


    -- ======================================
    -- TROLL + WARLOCK
    -- ======================================

    ["Troll"] = {

        ["WARLOCK"] = {

            HELLO = {
                ziel = {
                    "Da Mojo heißt Euch willkommen, %s. Die Geister sind neugierig.",
                    "Seid gegrüßt, %s. Da Schatten haben Euren Besuch bemerkt.",
                    "Willkommen, Hexenmeister. Möge da Mojo mit Euch sein, %s.",
                },

                gruppe = {
                    "Da Mojo heißt Euch willkommen. Die Geister sind neugierig.",
                    "Seid gegrüßt. Da Schatten haben Euren Besuch bemerkt.",
                    "Willkommen, Hexenmeister. Möge da Mojo mit uns sein.",
                },
            },

            WAVE = {
                ziel = {
                    "Da dunkle Mojo grüßt Euch, %s.",
                    "Möge Euer Mojo stark sein.",
                    "Seid gegrüßt, %s. Die Geister beobachten Euch.",
                    "Ein Troll mit dunkler Magie. Respekt.",
                    "Da Schatten sind heute gut gelaunt.",
                    "Willkommen, Hexenmeister.",
                },

                gruppe = {
                    "Da dunkle Mojo ist bereit!",
                    "Möge unser Mojo stark sein!",
                    "Die Geister beobachten uns.",
                    "Da Schatten sind erwacht.",
                    "Für die Horde und da Mojo!",
                    "Zeit für dunkle Magie!",
                },
            },

            SALUTE = {
                ziel = {
                    "Respekt, %s. Da Mojo ist stark.",
                    "Die Geister erkennen Eure Macht.",
                    "Ehre und dunkles Mojo.",
                    "Möge Euer Wille stark sein.",
                    "Ein Trollgruß an einen Meister der Schatten.",
                    "Da Horde respektiert Macht.",
                },

                gruppe = {
                    "Respekt und dunkles Mojo!",
                    "Möge unser Wille stark sein.",
                    "Da Geister sind mit uns.",
                    "Ehre dem dunklen Mojo!",
                    "Für da Horde!",
                    "Macht und Mojo!",
                },
            },
        },
    },


    -- ======================================
    -- MENSCH + HUNTER
    -- ======================================

    ["Human"] = {

        ["HUNTER"] = {

            HELLO = {
                ziel = {
                    "Seid willkommen, %s. Die Wildnis hat Euch sicher hergeführt.",
                    "Waidmannsheil! Sturmwind grüßt Euch, %s.",
                    "Ein Jäger erkennt den Schritt eines anderen. Seid gegrüßt, %s.",
                },

                gruppe = {
                    "Seid willkommen. Die Wildnis hat Euch sicher hergeführt.",
                    "Waidmannsheil! Sturmwind grüßt Euch.",
                    "Ein Jäger erkennt den Schritt eines anderen. Seid gegrüßt!",
                },
            },

            WAVE = {
                ziel = {
                    "Seid gegrüßt, %s! Die Wildnis grüßt Euch.",
                    "Für die Allianz und die Jagd!",
                    "Waidmannsheil, %s.",
                    "Sturmwind grüßt Euch.",
                    "Möge Eure Jagd erfolgreich sein.",
                    "Ein Jägergruß aus der Allianz.",
                },

                gruppe = {
                    "Für die Allianz und die Jagd!",
                    "Waidmannsheil, Gefährten!",
                    "Die Wildnis ruft!",
                    "Sturmwind steht bereit.",
                    "Möge unsere Jagd erfolgreich sein.",
                    "Für König und Allianz!",
                },
            },

            SALUTE = {
                ziel = {
                    "Waidmannsheil, %s.",
                    "Ehre und Jagd!",
                    "Mein Waidmannsheil. Mein Respekt gilt Euch.",
                    "Für König und Allianz.",
                    "Möge Euer Auge scharf bleiben.",
                    "Die Allianz grüßt Euch.",
                },

                gruppe = {
                    "Waidmannsheil!",
                    "Ehre und Jagd!",
                    "Für König und Allianz!",
                    "Die Allianz steht zusammen.",
                    "Möge unser Auge scharf bleiben.",
                    "Gute Jagd, Gefährten!",
                },
            },
        },
    },

    -- ======================================
    -- HIMMELSGEBORENE + DRUID
    -- ======================================

    ["Skyborne"] = {
        ["DRUID"] = {
            HELLO = {
                ziel = {
                    "Wind und Wildnis haben Euch hergefuehrt, %s. Seid willkommen.",
                    "Seid gegruesst, %s. Wurzeln geben Halt, der Himmel gibt Weite.",
                    "Zwischen Wolken und Blaetterdach ist immer Platz fuer gute Gesellschaft, %s.",
                    "Der Atem von Zephras und die Ruhe der Wildnis seien mit Euch, %s.",
                },
                gruppe = {
                    "Wind und Wildnis haben uns zusammengefuehrt. Seid willkommen.",
                    "Wurzeln geben Halt, der Himmel gibt Weite.",
                    "Zwischen Wolken und Blaetterdach ist Platz fuer gute Gesellschaft.",
                    "Der Atem von Zephras und die Ruhe der Wildnis seien mit uns.",
                },
            },
            WAVE = {
                ziel = {
                    "Der Wind trage den Gruss der Wildnis zu Euch, %s.",
                    "Seid gegruesst, %s. Moege Euer Pfad zwischen Himmel und Erde sicher sein.",
                    "Ein Gruss aus Wind, Blatt und weitem Himmel, %s.",
                    "Zephras und die Wildnis seien Euch freundlich gesinnt, %s.",
                },
                gruppe = {
                    "Der Wind trage den Gruss der Wildnis zu Euch.",
                    "Moege unser Pfad zwischen Himmel und Erde sicher sein.",
                    "Ein Gruss aus Wind, Blatt und weitem Himmel.",
                    "Zephras und die Wildnis seien uns freundlich gesinnt.",
                },
            },
            SALUTE = {
                ziel = {
                    "Weitsicht, Gleichgewicht und mein Respekt, %s.",
                    "Moege Euer Blick so klar bleiben wie der Himmel nach dem Sturm, %s.",
                    "Ehre Eurem Weg zwischen Wurzeln und Wolken, %s.",
                    "Wind und Wildnis erkennen einen standhaften Weg, %s.",
                },
                gruppe = {
                    "Weitsicht, Gleichgewicht und mein Respekt.",
                    "Moege unser Blick klar bleiben wie der Himmel nach dem Sturm.",
                    "Ehre allen Wegen zwischen Wurzeln und Wolken.",
                    "Wind und Wildnis erkennen standhafte Wege.",
                },
            },
            BOW = {
                ziel = {
                    "Ich neige den Kopf vor Eurem Weg, %s. Kein Baum waechst ohne Himmel.",
                    "Mein Respekt, %s. Zwischen Wurzel und Wind liegt das Gleichgewicht.",
                    "Die Wildnis lehrt Demut, die Hoehe Weitsicht. Beides gebuehrt Euch, %s.",
                    "Ehre Eurem Platz im grossen Kreislauf, %s.",
                },
                gruppe = {
                    "Kein Baum waechst ohne Himmel. Mein Respekt gilt Euch.",
                    "Zwischen Wurzel und Wind liegt das Gleichgewicht.",
                    "Die Wildnis lehrt Demut, die Hoehe Weitsicht.",
                    "Ehre unserem Platz im grossen Kreislauf.",
                },
            },
            LAUGH = {
                ziel = {
                    "Ha! Selbst die Blaetter zittern vor Lachen, %s.",
                    "Bei Zephras, %s, den hat der Wind genau richtig getragen!",
                    "Selbst ein Druide braucht gelegentlich guten Aufwind fuer die Laune, %s.",
                    "Der war gut, %s. Den erzaehlt der Wind weiter.",
                },
                gruppe = {
                    "Ha! Selbst die Blaetter zittern vor Lachen.",
                    "Bei Zephras, den hat der Wind genau richtig getragen!",
                    "Auch Druiden brauchen gelegentlich guten Aufwind fuer die Laune.",
                    "Der war gut. Den erzaehlt der Wind weiter.",
                },
            },
            DANCE = {
                ziel = {
                    "Tanzt mit, %s. Der Wind bewegt die Blaetter, wir den Rest.",
                    "Ein Schritt wie ein Blatt im Aufwind, %s?",
                    "Die Wildnis kennt viele Rhythmen. Der Himmel liefert heute einen davon, %s.",
                    "Kommt, %s. Gleichgewicht darf sich auch bewegen.",
                },
                gruppe = {
                    "Der Wind bewegt die Blaetter, wir den Rest.",
                    "Ein Schritt wie ein Blatt im Aufwind.",
                    "Die Wildnis kennt viele Rhythmen. Der Himmel liefert heute einen davon.",
                    "Gleichgewicht darf sich auch bewegen.",
                },
            },
            SIT = {
                ziel = {
                    "Setzt Euch, %s. Wurzeln wachsen nicht im Flug.",
                    "Ein Augenblick Ruhe zwischen Himmel und Erde, %s.",
                    "Lauscht mit mir dem Wind, %s. Er spricht leiser, wenn man still wird.",
                    "Ruht Euch aus, %s. Auch ein weiter Blick braucht einen festen Stand.",
                },
                gruppe = {
                    "Wurzeln wachsen nicht im Flug. Zeit fuer eine Rast.",
                    "Ein Augenblick Ruhe zwischen Himmel und Erde.",
                    "Lauschen wir dem Wind. Er spricht leiser, wenn man still wird.",
                    "Auch ein weiter Blick braucht einen festen Stand.",
                },
            },
            SLEEP = {
                ziel = {
                    "Schlaft gut, %s. Moege der Wind in den Zweigen ueber Euch wachen.",
                    "Ruht, %s. Wurzel, Wind und Stern halten die Nacht im Gleichgewicht.",
                    "Moege Euch der Himmel weite Traeume und die Erde sicheren Schlaf schenken, %s.",
                    "Zephras trage Eure Traeume sanft durch die Nacht, %s.",
                },
                gruppe = {
                    "Moege der Wind in den Zweigen ueber uns wachen.",
                    "Wurzel, Wind und Stern halten die Nacht im Gleichgewicht.",
                    "Der Himmel schenke weite Traeume, die Erde sicheren Schlaf.",
                    "Zephras trage unsere Traeume sanft durch die Nacht.",
                },
            },
            THANK = {
                ziel = {
                    "Habt Dank, %s. Wind und Wildnis sollen Eure Hilfe erwidern.",
                    "Ihr wart der Aufwind, den dieser Weg gebraucht hat, %s.",
                    "Mein Dank, %s. Moege Euer Weg leicht und Euer Stand fest sein.",
                    "Die Wildnis vergisst Hilfe nicht, und ich ebenso wenig, %s.",
                },
                gruppe = {
                    "Habt Dank. Wind und Wildnis sollen Eure Hilfe erwidern.",
                    "Ihr wart der Aufwind, den dieser Weg gebraucht hat.",
                    "Moege Euer Weg leicht und Euer Stand fest sein.",
                    "Die Wildnis vergisst Hilfe nicht, und ich ebenso wenig.",
                },
            },
        },
    },

}
