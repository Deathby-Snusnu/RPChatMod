-- ==========================================
-- RP CHAT MOD
-- RASSE + KLASSE
-- BESONDERE KOMBINATIONEN
-- ==========================================

RPChatMod_RaceClassTexts = {

    -- ======================================
    -- ZWERG + PALADIN
    -- ======================================

    ["Dwarf"] = {

        ["PALADIN"] = {

            WAVE = {
                ziel = {
                    "Bei meiner Axt, %s! Das Licht sei mit Euch.",
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

            WAVE = {
                ziel = {
                    "Das Licht sei... mit Euch, %s.",
                    "Ein Paladin unter den Untoten. Interessant.",
                    "Seid gegrüßt, %s. Das Licht hat Humor.",
                    "Die Schatten und das Licht grüßen Euch.",
                    "Möge das Licht Euch nicht blenden.",
                    "Ein ungewöhnlicher Diener des Lichts.",
                },

                gruppe = {
                    "Das Licht... ist überraschend hartnäckig.",
                    "Untote und Paladine. Warum eigentlich nicht?",
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
                    "Das Licht hat Humor.",
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

            WAVE = {
                ziel = {
                    "Das Licht sei mit Euch, %s! Wissenschaftlich bestätigt.",
                    "Seid gesegnet! Ich habe das natürlich dokumentiert.",
                    "Hallo %s! Möge Euer Geist stabil bleiben.",
                    "Ein heiliger Gruß mit technisch einwandfreier Präzision.",
                    "Das Licht grüßt Euch!",
                    "Willkommen! Keine Sorge, der Segen ist getestet.",
                },

                gruppe = {
                    "Das Licht sei mit uns! Alles wissenschaftlich überprüft.",
                    "Seid gesegnet, Freunde!",
                    "Glaube und Wissenschaft können koexistieren.",
                    "Die geistige Stabilität ist ausgezeichnet.",
                    "Ein gesegneter Gruß!",
                    "Keine Panik. Das Licht funktioniert.",
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
                    "Mein Respekt, Jäger.",
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
}