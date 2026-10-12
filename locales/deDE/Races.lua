-- Race data.
-- ==========================================
-- RASSENSPEZIFISCHE RP-TEXTE
-- ==========================================

local _, addon = ...

addon.localeData.deDE.raceTexts = {

    ["Dwarf"] = {

        HELLO = {
            ziel = {
                "Hallo, %s! Kommt herein und wärmt Euch am Feuer.",
                "Grüße aus Khaz Modan, %s!",
                "Seid willkommen, %s. Ein Krug steht schon bereit.",
            },

            gruppe = {
                "Willkommen, Gefährten! Das Feuer ist warm und das Bier kühl.",
                "Grüße aus Khaz Modan!",
                "Kommt herein! Für alle ist noch ein Krug da.",
            },
        },

        WAVE = {
            ziel = {
                "Bei meiner Axt, gut Euch zu sehen, %s!",
                "Seid gegrüßt, %s.",
                "Gut Euch zu sehen, %s.",
                "Mögen Eure Stiefel festen Boden finden, %s.",
                "Ein kräftiger Gruß aus den Bergen, %s.",
                "Habt einen guten Tag, %s. Und denkt ans Bier!",
            },

            gruppe = {
                "Bei meiner Axt! Seid gegrüßt!",
                "Ein Gruß unter Zwergen!",
                "Auf die Zwerge!",
                "Mögen Eure Stiefel festen Boden finden, Gefährten.",
                "Ein kräftiger Gruß aus den Bergen!",
                "Auf gute Gesellschaft und volle Krüge!",
            },
        },

        SALUTE = {
            ziel = {
                "Ehre und Respekt, %s.",
                "Ein Zwerg entbietet Euch seinen Gruß.",
                "Bei meinen Ahnen, ich erweise Euch die Ehre, %s.",
                "Möge Eure Axt stets scharf sein, %s.",
            },

            gruppe = {
                "Ehre, Axt und gutes Bier!",
                "Haltet die Axt scharf!",
                "Auf die Ahnen und auf unsere Gefährten!",
                "Mögen unsere Hallen sicher und unsere Krüge voll sein!",
            },
        },

        BOW = {
            ziel = {
                "Eine Verbeugung vor Euch, %s. Bei meiner Axt!",
                "Ihr habt Euch meinen Respekt verdient, %s.",
                "Mögen die Ahnen Euch gewogen sein, %s.",
                "Mein Haupt neige sich vor Euch, %s.",
            },

            gruppe = {
                "Eine Verbeugung vor Euch, Gefährten!",
                "Ihr habt Euch den Respekt eines Zwerges verdient.",
                "Mögen die Ahnen über Euch wachen.",
                "Mein Gruß und Respekt gelten Euch allen.",
            },
        },

        LAUGH = {
            ziel = {
                "Ha! Das war gut, %s!",
                "Bei meinem Bart, %s, der war gut!",
                "Damit bringt Ihr selbst einen Zwerg zum Lachen, %s!",
                "Ein guter Witz ist fast so schön wie gutes Bier, %s.",
            },

            gruppe = {
                "Ha! Das bringt selbst einen Zwerg zum Lachen!",
                "Bei meinem Bart, der war gut!",
                "Ein guter Witz ist fast so schön wie gutes Bier.",
                "Lacht nur, Gefährten. Das Leben ist kurz!",
            },
        },

        DANCE = {
            ziel = {
                "Kommt, %s, schwingt mit mir das Tanzbein!",
                "Ein Zwergentanz gefällig, %s?",
                "Für Euch stampfe ich sogar den Rhythmus, %s!",
                "Musik her, %s! Der Boden hält das schon aus.",
            },

            gruppe = {
                "Kommt, Gefährten, schwingt mit mir das Tanzbein!",
                "Ein Zwergentanz! Wer hält mit?",
                "Musik her! Der Boden hält das schon aus.",
                "Für gutes Bier stampfe ich sogar im Takt!",
            },
        },

        SIT = {
            ziel = {
                "Bier her, %s. Beine hoch.",
                "Zeit für eine ordentliche Rast.",
                "Setzt Euch zu mir, %s. Das Fass ist frisch geöffnet.",
                "Die Beine ruhen, der Durst nicht, %s.",
            },

            gruppe = {
                "Bier her, Beine hoch.",
                "Ein Zwerg rastet besser mit einem Krug in Reichweite.",
                "Das Fass ruft. Wer bin ich, ihm zu widersprechen?",
                "Setzt Euch, Gefährten. Das Fass ist frisch geöffnet.",
                "Die Beine ruhen, der Durst nicht!",
            },
        },

        SLEEP = {
            ziel = {
                "Möge Euer Schlaf so tief sein wie unsere Hallen, %s.",
                "Ruht Euch aus, %s. Morgen wartet wieder Arbeit.",
                "Schlaft gut und träumt von vollen Fässern, %s.",
                "Die Ahnen mögen über Euren Schlaf wachen, %s.",
            },

            gruppe = {
                "Möge unser Schlaf so tief sein wie die Hallen der Zwerge.",
                "Ruht Euch aus. Morgen wartet wieder Arbeit.",
                "Träumt von vollen Fässern und ruhigen Minen!",
                "Die Ahnen mögen über uns wachen.",
            },
        },

        THANK = {
            ziel = {
                "Bei meiner Axt, habt Dank für Eure Hilfe, %s!",
                "Ein Zwerg vergisst Eure Unterstützung nicht, %s.",
                "Möge das nächste Fass auf mich gehen, %s.",
                "Ihr habt Euch einen Platz an meinem Feuer verdient, %s.",
                "Meine Axt und mein Dank stehen Euch zu Diensten, %s.",
                "Auf Eure Hilfe trinke ich, %s!",
            },

            gruppe = {
                "Bei meiner Axt, habt Dank!",
                "Ein Zwerg vergisst die Hilfe seiner Gefährten nicht.",
                "Das nächste Fass geht auf mich!",
                "Ihr habt Euch alle einen Platz an meinem Feuer verdient.",
                "Meine Axt und mein Dank stehen Euch zu Diensten.",
                "Auf Eure Hilfe trinke ich!",
            },
        },
    
        FLIRT = {
            ziel = {
                "Bei meinem Bart, %s, Ihr seid gefährlicher für meine Konzentration als ein leeres Fass.",
                "Wenn Ihr so weitermacht, %s, muss ich Euch wohl auf einen Krug einladen.",
                "%s, Ihr habt Euch gerade einen ziemlich langen Blick verdient.",
            },
            gruppe = {
                "Bei meinem Bart, hier wird es plötzlich wärmer.",
                "Ein guter Abend, gute Gesellschaft... da fehlt eigentlich nur noch ein Krug.",
                "Manche Schätze findet man eben nicht unter der Erde.",
            },
        },
},

    ["Orc"] = {

        HELLO = {
            ziel = {
                "Lok'tar, %s. Möge Stärke Euch begleiten.",
                "Seid willkommen, %s. Die Horde grüßt Euch.",
                "Gut, Euch zu sehen, %s. Ihr wirkt kampfbereit.",
            },

            gruppe = {
                "Lok'tar, Gefährten! Die Horde grüßt Euch.",
                "Seid willkommen. Möge Stärke uns begleiten.",
                "Gut, Euch zu sehen. Ihr wirkt kampfbereit!",
            },
        },

        WAVE = {
            ziel = {
                "Lok'tar, %s!",
                "Seid gegrüßt, %s.",
                "Der Horde zur Ehre, %s!",
                "Möge Euer Weg von Stärke zeugen, %s.",
                "Gut, Euch an meiner Seite zu wissen, %s.",
            },

            gruppe = {
                "Lok'tar ogar!",
                "Blut und Ehre, Gefährten!",
                "Der Horde zur Ehre!",
                "Möge unser Weg von Stärke zeugen.",
                "Gut, Euch an meiner Seite zu wissen, Gefährten.",
            },
        },

        SALUTE = {
            ziel = {
                "Blut und Ehre, %s!",
                "Ich erweise Euch Respekt, %s.",
                "Möge Euer Mut niemals schwinden, %s.",
                "Lok'tar! Ihr habt Euch meine Achtung verdient, %s.",
            },

            gruppe = {
                "Blut und Ehre!",
                "Ich erweise Euch allen Respekt.",
                "Möge unser Mut niemals schwinden.",
                "Lok'tar! Ihr habt Euch meine Achtung verdient.",
            },
        },

        BOW = {
            ziel = {
                "Ein Krieger verneigt sich vor Euch, %s.",
                "Euer Mut verdient Anerkennung, %s.",
                "Ich neige mein Haupt vor Eurer Stärke, %s.",
                "Ehre sei Euch, %s.",
            },

            gruppe = {
                "Ein Krieger verneigt sich vor seinen Gefährten.",
                "Euer Mut verdient Anerkennung.",
                "Ich neige mein Haupt vor Eurer Stärke.",
                "Ehre sei Euch allen.",
            },
        },

        LAUGH = {
            ziel = {
                "Ha! Selbst ein Krieger muss lachen, %s!",
                "Das war stark, %s. Fast so stark wie ein guter Hieb!",
                "Bei den Ahnen, %s, Ihr habt Witz!",
                "Euer Scherz hat mehr Kraft als erwartet, %s!",
            },

            gruppe = {
                "Ha! Selbst ein Krieger muss lachen!",
                "Das war stark, fast so stark wie ein guter Hieb!",
                "Bei den Ahnen, Ihr habt Witz!",
                "Euer Scherz hat mehr Kraft als erwartet!",
            },
        },

        DANCE = {
            ziel = {
                "Zeigt mir Euren Kriegstanz, %s!",
                "Ein Tanz nach dem Kampf? Nur zu, %s!",
                "Schwingt mit mir das Tanzbein, %s!",
                "Lasst uns feiern, solange der Sieg unser ist, %s!",
            },

            gruppe = {
                "Zeigt mir Euren Kriegstanz!",
                "Ein Tanz nach dem Kampf? Nur zu!",
                "Schwingt mit mir das Tanzbein, Gefährten!",
                "Lasst uns feiern, solange der Sieg unser ist!",
            },
        },

        SIT = {
            ziel = {
                "Setzt Euch, %s. Auch Krieger brauchen Ruhe.",
                "Legt die Waffen für einen Augenblick ab, %s.",
                "Die Schlacht kann warten. Rastet, %s.",
                "Ein ruhiger Moment macht den nächsten Schlag stärker, %s.",
            },

            gruppe = {
                "Auch Krieger brauchen Ruhe. Setzt Euch.",
                "Legt die Waffen für einen Augenblick ab.",
                "Die Schlacht kann warten. Rastet, Gefährten.",
                "Ein ruhiger Moment macht den nächsten Schlag stärker.",
            },
        },

        SLEEP = {
            ziel = {
                "Möge Eure Ruhe Euch neue Kraft geben, %s.",
                "Schlaft gut, %s. Morgen wartet ein neuer Kampf.",
                "Die Ahnen mögen Eure Träume behüten, %s.",
                "Rastet. Ein starker Krieger braucht Schlaf, %s.",
            },

            gruppe = {
                "Möge die Ruhe uns neue Kraft geben.",
                "Schlaft gut. Morgen wartet ein neuer Kampf.",
                "Die Ahnen mögen unsere Träume behüten.",
                "Rastet. Auch starke Krieger brauchen Schlaf.",
            },
        },

        THANK = {
            ziel = {
                "Eure Hilfe wird nicht vergessen, %s.",
                "Ich stehe in Eurer Schuld, %s.",
                "Ihr habt meinen Dank, %s.",
                "Eure Stärke hat uns geholfen, %s. Habt Dank.",
                "Die Horde vergisst einen treuen Gefährten nicht, %s.",
                "Ich werde mich für Eure Hilfe erkenntlich zeigen, %s.",
            },

            gruppe = {
                "Eure Hilfe wird nicht vergessen.",
                "Ich stehe in eurer Schuld, Gefährten.",
                "Blut und Ehre! Habt Dank.",
                "Eure Stärke hat uns geholfen. Habt Dank.",
                "Die Horde vergisst treue Gefährten nicht.",
                "Ich werde mich für Eure Hilfe erkenntlich zeigen.",
            },
        },
    
        FLIRT = {
            ziel = {
                "Ihr habt Stärke, %s. Das gefällt mir.",
                "%s, an Eurer Seite würde ich sogar freiwillig in die nächste Schlacht ziehen.",
                "Keine langen Worte, %s. Ihr seid mir aufgefallen.",
            },
            gruppe = {
                "Stärke erkennt Stärke.",
                "Manche Blicke brauchen keine großen Reden.",
                "Heute kämpfe ich vielleicht nicht nur für die Ehre.",
            },
        },
},

    ["Human"] = {

        HELLO = {
            ziel = {
                "Seid willkommen in Sturmwind, %s.",
                "Guten Tag, %s. Was führt Euch hierher?",
                "Es ist mir eine Freude, Euch kennenzulernen, %s.",
            },

            gruppe = {
                "Seid willkommen in Sturmwind, Freunde.",
                "Guten Tag allerseits. Was führt Euch hierher?",
                "Es ist mir eine Freude, Euch alle kennenzulernen.",
            },
        },

        WAVE = {
            ziel = {
                "Für das Licht und die Allianz, %s!",
                "Seid gegrüßt, %s.",
                "Möge das Licht Euren Weg erhellen, %s.",
                "Willkommen in Sturmwind, %s.",
                "Ein guter Tag für die Allianz, nicht wahr, %s?",
            },

            gruppe = {
                "Für König und Allianz!",
                "Seid gegrüßt, Freunde.",
                "Möge das Licht unsere Wege erhellen.",
                "Willkommen, Gefährten. Sturmwind steht Euch offen.",
                "Ein guter Tag für die Allianz!",
            },
        },

        SALUTE = {
            ziel = {
                "Für König und Allianz, %s!",
                "Das Licht sei mit Euch, %s.",
                "Ich erweise Euch meinen Respekt, %s.",
                "Euer Einsatz verdient Anerkennung, %s.",
            },

            gruppe = {
                "Für König und Allianz!",
                "Das Licht sei mit Euch allen.",
                "Ich erweise Euch meinen Respekt.",
                "Euer Einsatz verdient Anerkennung.",
            },
        },

        BOW = {
            ziel = {
                "Mit allem gebührenden Respekt, %s.",
                "Ich verneige mich vor Euch, %s.",
                "Möge das Licht Eure Taten ehren, %s.",
                "Eure Dienste für die Allianz verdienen Achtung, %s.",
            },

            gruppe = {
                "Mit allem gebührenden Respekt.",
                "Ich verneige mich vor Euch, Gefährten.",
                "Möge das Licht Eure Taten ehren.",
                "Eure Dienste für die Allianz verdienen Achtung.",
            },
        },

        LAUGH = {
            ziel = {
                "Ha! Das war wirklich gut, %s!",
                "Ihr habt einen feinen Sinn für Humor, %s.",
                "Bei der Krone, %s, damit habt Ihr mich!",
                "Ein wenig Heiterkeit tut gut, %s!",
            },

            gruppe = {
                "Ha! Das war wirklich gut!",
                "Ihr habt einen feinen Sinn für Humor.",
                "Bei der Krone, damit habt Ihr mich!",
                "Ein wenig Heiterkeit tut allen gut!",
            },
        },

        DANCE = {
            ziel = {
                "Ein Tanz zur Feier des Tages, %s?",
                "Kommt, %s, lasst uns den Sieg feiern!",
                "Sogar in Sturmwind wird heute getanzt, %s!",
                "Gebt der Musik eine Chance, %s!",
            },

            gruppe = {
                "Ein Tanz zur Feier des Tages!",
                "Kommt, Gefährten, lasst uns den Sieg feiern!",
                "Sogar in Sturmwind wird heute getanzt!",
                "Gebt der Musik eine Chance!",
            },
        },

        SIT = {
            ziel = {
                "Setzt Euch, %s. Ihr habt Euch eine Pause verdient.",
                "Eine kurze Rast, bevor es weitergeht, %s.",
                "Möge dieser Augenblick Euch Frieden schenken, %s.",
                "Ruhen wir uns aus. Die Pflicht läuft nicht davon, %s.",
            },

            gruppe = {
                "Ihr habt Euch alle eine Pause verdient.",
                "Eine kurze Rast, bevor es weitergeht.",
                "Möge dieser Augenblick uns Frieden schenken.",
                "Ruhen wir uns aus. Die Pflicht läuft nicht davon.",
            },
        },

        SLEEP = {
            ziel = {
                "Möge das Licht über Euren Schlaf wachen, %s.",
                "Schlaft wohl, %s. Morgen wartet ein neuer Tag.",
                "Erholt Euch gut und träumt in Frieden, %s.",
                "Lasst die Sorgen ruhen. Gute Nacht, %s.",
            },

            gruppe = {
                "Möge das Licht über unseren Schlaf wachen.",
                "Schlaft wohl. Morgen wartet ein neuer Tag.",
                "Erholt Euch gut und träumt in Frieden.",
                "Lasst die Sorgen ruhen. Gute Nacht, Gefährten.",
            },
        },

        THANK = {
            ziel = {
                "Habt Dank für Eure Hilfe, %s.",
                "Die Allianz weiß Eure Unterstützung zu schätzen, %s.",
                "Ich stehe in Eurer Schuld, %s.",
                "Euer Einsatz für die Allianz wird nicht vergessen, %s.",
                "Das Licht vergelte Euch Eure Hilfe, %s.",
                "Ihr habt Euch meinen aufrichtigen Dank verdient, %s.",
            },

            gruppe = {
                "Vielen Dank für Eure Unterstützung.",
                "Die Allianz weiß Eure Hilfe zu schätzen.",
                "Ich stehe in Eurer Schuld, Freunde.",
                "Euer Einsatz für die Allianz wird nicht vergessen.",
                "Das Licht vergelte Euch Eure Hilfe.",
                "Ihr habt Euch meinen aufrichtigen Dank verdient.",
            },
        },
    
        FLIRT = {
            ziel = {
                "Ihr habt ein bemerkenswertes Lächeln, %s.",
                "Darf ich sagen, %s, dass Eure Gesellschaft diesen Ort deutlich verbessert?",
                "Wenn Ihr noch etwas näher kommt, %s, könnte ich meine guten Manieren vergessen.",
            },
            gruppe = {
                "Ein wenig Charme hat noch keinem Abend geschadet.",
                "Gute Gesellschaft ist manchmal die beste Belohnung.",
                "Heute liegt etwas Angenehmes in der Luft.",
            },
        },
},

    ["NightElf"] = {

        HELLO = {
            ziel = {
                "Ishnu-alah, %s. Möge Elune Euren Weg behüten.",
                "Seid willkommen in unseren Wäldern, %s.",
                "Es ist schön, Euch zu begegnen, %s.",
            },

            gruppe = {
                "Ishnu-alah. Möge Elune Euren Weg behüten.",
                "Seid willkommen in unseren Wäldern.",
                "Es ist schön, Euch allen zu begegnen.",
            },
        },

        WAVE = {
            ziel = {
                "Elune beschütze Euch, %s.",
                "Ishnu-alah, %s.",
                "Möge der Mond Euren Pfad erhellen, %s.",
                "Die Wälder heißen Euch willkommen, %s.",
                "Elunes Segen begleite Euch, %s.",
            },

            gruppe = {
                "Möge Elune uns führen.",
                "Möge die Natur uns leiten.",
                "Möge der Mond unseren Pfad erhellen.",
                "Die Wälder heißen Euch willkommen.",
                "Elunes Segen begleite Euch.",
            },
        },

        SALUTE = {
            ziel = {
                "Elune sei mit Euch, %s.",
                "Möge die Natur Euren Mut ehren, %s.",
                "Ich grüße Euch im Namen des Mondes, %s.",
                "Eure Gegenwart ehrt diesen Hain, %s.",
            },

            gruppe = {
                "Elune sei mit Euch.",
                "Möge die Natur Euren Mut ehren.",
                "Ich grüße Euch im Namen des Mondes.",
                "Eure Gegenwart ehrt diesen Hain.",
            },
        },

        BOW = {
            ziel = {
                "Ich neige mein Haupt vor Euch, %s.",
                "Möge Elune Eure Weisheit mehren, %s.",
                "Die Natur bezeugt meinen Respekt, %s.",
                "In Ehrfurcht vor Eurem Weg, %s.",
            },

            gruppe = {
                "Ich neige mein Haupt vor Euch.",
                "Möge Elune Eure Weisheit mehren.",
                "Die Natur bezeugt meinen Respekt.",
                "In Ehrfurcht vor Eurem Weg.",
            },
        },

        LAUGH = {
            ziel = {
                "Ein fröhlicher Klang wie Vogelgesang, %s!",
                "Selbst im tiefsten Wald gibt es Grund zum Lachen, %s.",
                "Elune möge mir verzeihen, %s, aber das war köstlich!",
                "Ihr habt mein Herz erheitert, %s.",
            },

            gruppe = {
                "Ein fröhlicher Klang wie Vogelgesang!",
                "Selbst im tiefsten Wald gibt es Grund zum Lachen.",
                "Elune möge mir verzeihen, aber das war köstlich!",
                "Ihr habt mein Herz erheitert.",
            },
        },

        DANCE = {
            ziel = {
                "Tanzt mit mir im Licht des Mondes, %s!",
                "Lasst uns feiern, wie die Blätter im Wind, %s.",
                "Ein Tanz unter den Sternen gefällig, %s?",
                "Folgt dem Rhythmus des Waldes, %s!",
            },

            gruppe = {
                "Tanzt mit mir im Licht des Mondes!",
                "Lasst uns feiern wie die Blätter im Wind.",
                "Ein Tanz unter den Sternen!",
                "Folgt dem Rhythmus des Waldes!",
            },
        },

        SIT = {
            ziel = {
                "Rastet mit mir unter den Bäumen, %s.",
                "Lauscht dem Wind. Für einen Moment darf alles ruhen, %s.",
                "Möge Euch die Stille des Waldes Frieden schenken, %s.",
                "Setzt Euch. Die Wurzeln tragen uns, %s.",
            },

            gruppe = {
                "Rasten wir gemeinsam unter den Bäumen.",
                "Lauscht dem Wind. Für einen Moment darf alles ruhen.",
                "Möge die Stille des Waldes uns Frieden schenken.",
                "Setzt Euch. Die Wurzeln tragen uns.",
            },
        },

        SLEEP = {
            ziel = {
                "Möge Elune über Eure Träume wachen, %s.",
                "Schlaft im Frieden des Waldes, %s.",
                "Die Sterne mögen Euch sanft in den Schlaf geleiten, %s.",
                "Ruht Euch aus. Der Morgen bringt neues Licht, %s.",
            },

            gruppe = {
                "Möge Elune über unsere Träume wachen.",
                "Schlafen wir im Frieden des Waldes.",
                "Die Sterne mögen uns sanft in den Schlaf geleiten.",
                "Ruht Euch aus. Der Morgen bringt neues Licht.",
            },
        },

        THANK = {
            ziel = {
                "Elune sei Euch dankbar für Eure Hilfe, %s.",
                "Möge die Natur Eure Güte erwidern, %s.",
                "Ich danke Euch von Herzen, %s.",
                "Eure Güte wird in diesem Wald nicht vergessen, %s.",
                "Möge Elune Euch für Eure Freundlichkeit segnen, %s.",
                "Ihr habt Licht in diesen Tag gebracht, %s. Habt Dank.",
            },

            gruppe = {
                "Möge Elune Euch für Eure Hilfe segnen.",
                "Die Natur wird Eure Güte nicht vergessen.",
                "Ich danke Euch allen von Herzen.",
                "Eure Güte wird in diesem Wald nicht vergessen.",
                "Möge Elune Euch für Eure Freundlichkeit segnen.",
                "Ihr habt Licht in diesen Tag gebracht. Habt Dank.",
            },
        },
    
        FLIRT = {
            ziel = {
                "Das Mondlicht steht Euch gut, %s.",
                "Elune muss heute besonders aufmerksam gewesen sein, %s.",
                "Eure Gegenwart ist angenehmer als ein stiller Hain im Mondlicht, %s.",
            },
            gruppe = {
                "Unter den Sternen wirken manche Begegnungen bedeutungsvoller.",
                "Der Mond beleuchtet heute offenbar die richtigen Dinge.",
                "Selbst ein langer Weg wird mit guter Gesellschaft leichter.",
            },
        },
},

    ["BloodElf"] = {

        HELLO = {
            ziel = {
                "Anu belore dela'na, %s. Seid willkommen.",
                "Die Ewige Sonne leuchte über Euch, %s.",
                "Es freut mich, Euch in Quel'Thalas zu begrüßen, %s.",
            },

            gruppe = {
                "Anu belore dela'na. Seid willkommen!",
                "Die Ewige Sonne leuchte über Euch.",
                "Es freut mich, Euch in Quel'Thalas zu begrüßen.",
            },
        },

        WAVE = {
            ziel = {
                "Anu belore dela'na, %s.",
                "Grüße, %s.",
                "Möge die Ewige Sonne Euch leuchten, %s.",
                "Willkommen in Quel'Thalas, %s.",
                "Die Magie sei Euch gewogen, %s.",
            },

            gruppe = {
                "Für die Ewige Sonne!",
                "Seid gegrüßt, Freunde.",
                "Möge die Ewige Sonne Euch leuchten.",
                "Willkommen in Quel'Thalas, Gefährten.",
                "Die Magie sei uns gewogen.",
            },
        },

        SALUTE = {
            ziel = {
                "Für die Ewige Sonne, %s!",
                "Ihr habt Euch den Respekt Quel'Thalas' verdient, %s.",
                "Möge die Sonne Eure Taten bezeugen, %s.",
                "Ich erweise Euch die gebührende Ehre, %s.",
            },

            gruppe = {
                "Für die Ewige Sonne!",
                "Ihr habt Euch den Respekt Quel'Thalas' verdient.",
                "Möge die Sonne Eure Taten bezeugen.",
                "Ich erweise Euch die gebührende Ehre.",
            },
        },

        BOW = {
            ziel = {
                "In Ehrfurcht vor Euch, %s.",
                "Möge die Ewige Sonne Euren Weg erhellen, %s.",
                "Eure Anmut verdient eine Verbeugung, %s.",
                "Ich verneige mich vor Eurer Stärke, %s.",
            },

            gruppe = {
                "In Ehrfurcht vor Euch.",
                "Möge die Ewige Sonne Euren Weg erhellen.",
                "Eure Anmut verdient eine Verbeugung.",
                "Ich verneige mich vor Eurer Stärke.",
            },
        },

        LAUGH = {
            ziel = {
                "Ha! Das war amüsant, %s.",
                "Ihr habt mehr Charme als erwartet, %s!",
                "Bei der Sonne, %s, Ihr seid unterhaltsam.",
                "Ein wenig Heiterkeit steht Euch gut, %s.",
            },

            gruppe = {
                "Ha! Das war amüsant.",
                "Ihr habt mehr Charme als erwartet!",
                "Bei der Sonne, Ihr seid unterhaltsam.",
                "Ein wenig Heiterkeit steht uns allen gut.",
            },
        },

        DANCE = {
            ziel = {
                "Ein Tanz, so elegant wie die Höfe von Quel'Thalas, %s?",
                "Kommt, %s. Lasst uns die Ewige Sonne feiern!",
                "Selbst die Magie tanzt heute, %s!",
                "Zeigt mir Eure besten Schritte, %s.",
            },

            gruppe = {
                "Ein Tanz, so elegant wie die Höfe von Quel'Thalas!",
                "Lasst uns die Ewige Sonne feiern!",
                "Selbst die Magie tanzt heute!",
                "Zeigt mir Eure besten Schritte.",
            },
        },

        SIT = {
            ziel = {
                "Rastet einen Moment, %s. Auch Magie verlangt ihren Tribut.",
                "Setzt Euch. Die Gärten von Quel'Thalas laden zur Ruhe ein, %s.",
                "Lasst die arkanen Energien sich sammeln, %s.",
                "Eine kurze Rast wird Euch guttun, %s.",
            },

            gruppe = {
                "Auch Magie verlangt ihren Tribut. Rastet einen Moment.",
                "Die Gärten von Quel'Thalas laden zur Ruhe ein.",
                "Lasst die arkanen Energien sich sammeln.",
                "Eine kurze Rast wird uns allen guttun.",
            },
        },

        SLEEP = {
            ziel = {
                "Möge die Ewige Sonne Eure Träume behüten, %s.",
                "Schlaft wohl, %s. Die Sterne wachen über Quel'Thalas.",
                "Lasst die arkanen Sorgen ruhen, %s.",
                "Möge Euch eine friedvolle Nacht erwarten, %s.",
            },

            gruppe = {
                "Möge die Ewige Sonne unsere Träume behüten.",
                "Die Sterne wachen über Quel'Thalas.",
                "Lasst die arkanen Sorgen ruhen.",
                "Möge uns eine friedvolle Nacht erwarten.",
            },
        },

        THANK = {
            ziel = {
                "Anu belore dela'na, habt Dank für Eure Hilfe, %s.",
                "Eure Unterstützung ehrt Euch, %s.",
                "Ich danke Euch, %s. Die Ewige Sonne möge Euch leuchten.",
                "Quel'Thalas wird Eure Hilfe nicht vergessen, %s.",
                "Möge die Ewige Sonne Eure Großzügigkeit erwidern, %s.",
                "Ihr habt Euch meinen aufrichtigen Dank verdient, %s.",
            },

            gruppe = {
                "Habt Dank. Für die Ewige Sonne!",
                "Eure Unterstützung ehrt Euch alle.",
                "Möge die Ewige Sonne Euch für Eure Hilfe leuchten.",
                "Quel'Thalas wird Eure Hilfe nicht vergessen.",
                "Möge die Ewige Sonne Eure Großzügigkeit erwidern.",
                "Ihr habt Euch meinen aufrichtigen Dank verdient.",
            },
        },
    
        FLIRT = {
            ziel = {
                "%s, Ihr seid beinahe so faszinierend wie ich. Beinahe.",
                "Ihr habt Geschmack, %s. Immerhin sprecht Ihr mit mir.",
                "Diese Haltung, %s... erfreulich kultiviert.",
            },
            gruppe = {
                "Eleganz erkennt Eleganz.",
                "Ein wenig Schönheit verbessert jede Gesellschaft.",
                "Man sollte gute Gesellschaft nie unkommentiert lassen.",
            },
        },
},
    -- ======================================
    -- GNOME
    -- ======================================

    ["Gnome"] = {

        HELLO = {
            ziel = {
                "Seid gegrüßt, %s! Ihr seht erfreulich funktionsfähig aus.",
                "Willkommen, %s. Keine Sorge, hier ist fast alles ausreichend getestet.",
                "Ah, %s! Eure Ankunft lag durchaus im Bereich meiner Berechnungen.",
                "Grüße aus Gnomeregan, %s. Verzeiht das Werkzeug, ich war gerade beschäftigt.",
            },

            gruppe = {
                "Seid gegrüßt! Alle wichtigen Systeme scheinen betriebsbereit.",
                "Willkommen! Bitte nichts anfassen, was summt, blinkt oder raucht.",
                "Grüße aus Gnomeregan! Eure Ankunft kommt höchst gelegen.",
                "Ausgezeichnet, Verstärkung! Damit steigen unsere Erfolgsaussichten beträchtlich.",
            },
        },

        WAVE = {
            ziel = {
                "Seid gegrüßt, %s!",
                "Hallo, %s! Präzise getimter Gruß, wenn ich das sagen darf.",
                "Gnomeregan grüßt Euch, %s!",
                "Gut, Euch zu sehen, %s. Ihr wirkt erstaunlich zuverlässig.",
                "Ein kurzer Gruß, %s. Die nächste großartige Idee wartet bereits.",
                "Keine Sorge, %s. Das ist nur ein freundliches Winken, kein Testlauf.",
            },

            gruppe = {
                "Seid gegrüßt, allerseits!",
                "Gnomeregan grüßt Euch!",
                "Ein freundliches Winken. Vollkommen ungefährlich.",
                "Gut, Euch zu sehen! Die Erfolgsaussichten verbessern sich bereits.",
                "Grüße! Bitte den laufenden Versuchsaufbau nicht erschrecken.",
                "Ausgezeichnet, alle noch vollständig versammelt!",
            },
        },

        SALUTE = {
            ziel = {
                "Meine Hochachtung, %s. Saubere Arbeit erkennt man sofort.",
                "Respekt, %s. Eure Leistung verdient eine ordentliche Dokumentation.",
                "Ich grüße Euch mit höchster Präzision, %s.",
                "Euer Einfallsreichtum verdient Anerkennung, %s.",
                "Vorzügliche Arbeit, %s. Kaum Verbesserungspotenzial erkennbar.",
            },

            gruppe = {
                "Meine Hochachtung! Ausgezeichnete Arbeit.",
                "Respekt an alle Beteiligten. Das Ergebnis kann sich sehen lassen.",
                "Ein präziser Gruß an eine bemerkenswert fähige Gesellschaft!",
                "Einfallsreichtum, Mut und eine vernünftige Sicherheitsmarge!",
                "Vorzügliche Leistung. Kaum Verbesserungspotenzial erkennbar.",
            },
        },

        BOW = {
            ziel = {
                "Ich verneige mich vor Euch, %s. Vorsichtig, mein Werkzeug steckt noch im Gürtel.",
                "Meine Anerkennung, %s. Ihr habt sie Euch verdient.",
                "Vor solcher Leistung ziehe selbst ich den Hut, %s.",
                "Respekt, %s. Das war bemerkenswert effizient.",
                "Eine Verbeugung, %s. Ganz ohne bewegliche Teile.",
            },

            gruppe = {
                "Meine Anerkennung gilt Euch allen.",
                "Vor solcher Leistung ziehe selbst ich den Hut.",
                "Respekt! Das war bemerkenswert effizient.",
                "Eine Verbeugung vor Euch. Ganz ohne bewegliche Teile.",
                "Ausgezeichnete Arbeit, Gefährten.",
            },
        },

        LAUGH = {
            ziel = {
                "Ha! Der war gut, %s. Unerwartet, aber gut.",
                "Ausgezeichnet, %s! Den muss ich mir notieren.",
                "Ha! Eure Pointe funktioniert besser als manche meiner Erfindungen, %s.",
                "Sehr gut, %s. Humor mit sauberer Ausführung.",
                "Das war erstaunlich effizient, %s. Kaum Aufbau, hervorragende Wirkung!",
            },

            gruppe = {
                "Ha! Der war ausgezeichnet.",
                "Den muss ich mir notieren.",
                "Diese Pointe funktioniert besser als manche Erfindung.",
                "Sehr gut! Humor mit sauberer Ausführung.",
                "Kaum Aufbau, hervorragende Wirkung!",
            },
        },

        DANCE = {
            ziel = {
                "Kommt, %s! Keine Sorge, die Schrittfolge ist weitgehend erprobt.",
                "Ein Tänzchen, %s? Ich habe den Bewegungsablauf optimiert.",
                "Musik her, %s! Wissenschaft braucht gelegentlich Rhythmus.",
                "Seht genau hin, %s. Das ist kontrollierte Unordnung.",
                "Tanzt mit, %s! Im schlimmsten Fall gewinnen wir neue Messwerte.",
            },

            gruppe = {
                "Keine Sorge, die Schrittfolge ist weitgehend erprobt!",
                "Musik her! Wissenschaft braucht gelegentlich Rhythmus.",
                "Zeit für etwas kontrollierte Unordnung!",
                "Tanzt mit! Im schlimmsten Fall gewinnen wir neue Messwerte.",
                "Achtung, spontaner Feldversuch mit Musik!",
            },
        },

        SIT = {
            ziel = {
                "Setzt Euch, %s. Selbst ausgezeichnete Konstruktionen benötigen Wartung.",
                "Eine kurze Pause, %s. Das erhöht langfristig die Effizienz.",
                "Rastet einen Moment, %s. Denken funktioniert auch im Sitzen.",
                "Zeit für eine Wartungspause, %s. Rein vorbeugend natürlich.",
                "Setzt Euch, %s. Die nächste Idee läuft uns nicht davon. Vermutlich.",
            },

            gruppe = {
                "Eine kurze Wartungspause. Rein vorbeugend natürlich.",
                "Setzt Euch. Selbst ausgezeichnete Konstruktionen benötigen Ruhe.",
                "Denken funktioniert auch im Sitzen.",
                "Eine Pause erhöht langfristig die Effizienz.",
                "Die nächste Idee läuft uns nicht davon. Vermutlich.",
            },
        },

        SLEEP = {
            ziel = {
                "Schlaft gut, %s. Morgen warten neue Probleme auf brillante Lösungen.",
                "Ruht Euch aus, %s. Ein übermüdeter Geist übersieht wichtige Schrauben.",
                "Möge Euer Schlaf ruhig und Eure nächste Idee großartig sein, %s.",
                "Gute Nacht, %s. Die Werkbank steht morgen auch noch da.",
                "Erholt Euch, %s. Selbst Genialität braucht gelegentlich eine Pause.",
            },

            gruppe = {
                "Schlaft gut. Morgen warten neue Probleme auf brillante Lösungen.",
                "Ruht Euch aus. Ein übermüdeter Geist übersieht wichtige Schrauben.",
                "Mögen unsere Träume voller großartiger Ideen sein.",
                "Die Werkbank steht morgen auch noch da.",
                "Selbst Genialität braucht gelegentlich eine Pause.",
            },
        },

        THANK = {
            ziel = {
                "Habt Dank, %s. Eure Hilfe erhöhte die Erfolgsaussichten beträchtlich.",
                "Ausgezeichnete Unterstützung, %s. Das werde ich nicht vergessen.",
                "Ich danke Euch, %s. Ihr habt mir mindestens drei neue Arbeitsschritte erspart.",
                "Hervorragend, %s! Eure Hilfe war präzise, wirksam und überraschend ungefährlich.",
                "Mein Dank, %s. Sollte ich Euch je etwas bauen können, sagt Bescheid.",
                "Gnomeregan könnte mehr Leute wie Euch gebrauchen, %s. Habt Dank.",
            },

            gruppe = {
                "Habt Dank! Die Erfolgsaussichten sind beträchtlich gestiegen.",
                "Ausgezeichnete Unterstützung. Das werde ich nicht vergessen.",
                "Mein Dank gilt Euch allen. Ihr habt mir eine Menge Arbeit erspart.",
                "Hervorragend! Präzise, wirksam und überraschend ungefährlich.",
                "Sollte ich Euch je etwas bauen können, sagt Bescheid.",
                "Gnomeregan könnte mehr Leute wie Euch gebrauchen. Habt Dank!",
            },
        },
    
        FLIRT = {
            ziel = {
                "Eure Augen haben eine bemerkenswert hohe Leuchtkraft, %s. Rein wissenschaftlich betrachtet natürlich.",
                "Wenn Ihr ein Experiment wärt, %s, würde ich definitiv eine zweite Messreihe ansetzen.",
                "Ich glaube, zwischen uns besteht eine gewisse elektrische Spannung, %s.",
            },
            gruppe = {
                "Interessant. Mein Puls liegt außerhalb der erwarteten Parameter.",
                "Romantik ist vermutlich nur Chemie. Erstaunlich unterhaltsame Chemie.",
                "Ich sollte das untersuchen. Sehr gründlich.",
            },
        },
},

    -- ======================================
    -- UNDEAD
    -- ======================================

    ["Undead"] = {

        HELLO = {
            ziel = {
                "Seid gegrüßt, %s. Ihr wirkt erfreulich lebendig.",
                "Willkommen, %s. Lasst Euch von der Atmosphäre nicht abschrecken.",
                "Ah, Besuch. Seid gegrüßt, %s.",
                "Die Verlassenen heißen Euch willkommen, %s. Auf ihre Art.",
            },

            gruppe = {
                "Seid gegrüßt. Ihr wirkt alle erfreulich lebendig.",
                "Willkommen. Lasst Euch von der Atmosphäre nicht abschrecken.",
                "Ah, Besuch. Wie ungewöhnlich angenehm.",
                "Die Verlassenen heißen Euch willkommen. Auf ihre Art.",
            },
        },

        WAVE = {
            ziel = {
                "Seid gegrüßt, %s. Ja, die Hand gehört noch zu mir.",
                "Ein Gruß aus Unterstadt, %s.",
                "Gut, Euch zu sehen, %s. Soweit ich das beurteilen kann.",
                "Die Schatten grüßen Euch, %s.",
                "Noch unter den Lebenden, %s? Ausgezeichnet.",
                "Ein freundlicher Gruß, %s. Gewöhnt Euch nicht daran.",
            },

            gruppe = {
                "Seid gegrüßt. Ja, die Hand gehört noch zu mir.",
                "Ein Gruß aus Unterstadt.",
                "Die Schatten grüßen Euch.",
                "Noch alle unter den Lebenden? Ausgezeichnet.",
                "Ein freundlicher Gruß. Gewöhnt Euch nicht daran.",
                "Angenehm, Euch zu sehen. Soweit man das so nennen kann.",
            },
        },

        SALUTE = {
            ziel = {
                "Meine Achtung, %s. Ihr seid zäher, als Ihr ausseht.",
                "Respekt, %s. Die Verlassenen vergessen Stärke nicht.",
                "Ich erweise Euch die Ehre, %s. Genießt den seltenen Augenblick.",
                "Euer Wille verdient Anerkennung, %s.",
                "Die Schatten mögen Euch gewogen sein, %s.",
            },

            gruppe = {
                "Meine Achtung. Ihr seid zäher, als Ihr ausseht.",
                "Die Verlassenen vergessen Stärke nicht.",
                "Ich erweise Euch allen die Ehre. Genießt den seltenen Augenblick.",
                "Euer Wille verdient Anerkennung.",
                "Die Schatten mögen Euch gewogen sein.",
            },
        },

        BOW = {
            ziel = {
                "Ich neige mein Haupt vor Euch, %s. Es sitzt ohnehin nicht mehr ganz fest.",
                "Meine Anerkennung, %s.",
                "Respekt, %s. Selbst der Tod mindert ihn nicht.",
                "Ihr habt Euch diese Verbeugung verdient, %s.",
                "Eine seltene Geste der Achtung, %s.",
            },

            gruppe = {
                "Ich neige mein Haupt vor Euch. Es sitzt ohnehin nicht mehr ganz fest.",
                "Meine Anerkennung gilt Euch allen.",
                "Respekt. Selbst der Tod mindert ihn nicht.",
                "Ihr habt Euch diese Verbeugung verdient.",
                "Eine seltene Geste der Achtung.",
            },
        },

        LAUGH = {
            ziel = {
                "Heh. Gut, %s. Sehr gut.",
                "Ihr bringt ja beinahe Leben in die Runde, %s.",
                "Der war ausgezeichnet, %s. Fast hätte ich wieder Luft geholt.",
                "Makaber. Geschmacklos. Gefällt mir, %s.",
                "Ha! Damit habe selbst ich nicht gerechnet, %s.",
            },

            gruppe = {
                "Heh. Gut. Sehr gut.",
                "Ihr bringt ja beinahe Leben in die Runde.",
                "Ausgezeichnet. Fast hätte ich wieder Luft geholt.",
                "Makaber. Geschmacklos. Gefällt mir.",
                "Damit habe selbst ich nicht gerechnet.",
            },
        },

        DANCE = {
            ziel = {
                "Ein Tanz, %s? Solange nichts abfällt.",
                "Kommt, %s. Meine Gelenke sind heute erstaunlich kooperativ.",
                "Tanzt mit, %s. Der Tod ist kein Grund für schlechte Haltung.",
                "Musik, %s. Wir wollen die Toten nicht gelangweilt wirken lassen.",
                "Seht genau hin, %s. Eleganz überlebt offenbar einiges.",
            },

            gruppe = {
                "Ein Tanz! Solange nichts abfällt.",
                "Meine Gelenke sind heute erstaunlich kooperativ.",
                "Der Tod ist kein Grund für schlechte Haltung.",
                "Musik! Wir wollen die Toten nicht gelangweilt wirken lassen.",
                "Eleganz überlebt offenbar einiges.",
            },
        },

        SIT = {
            ziel = {
                "Setzt Euch, %s. Wir haben schließlich alle Zeit der Welt. Manche von uns mehr als andere.",
                "Eine kurze Rast, %s. Nicht aus Erschöpfung, eher aus Gewohnheit.",
                "Rastet, %s. Die Dunkelheit läuft uns nicht davon.",
                "Setzt Euch, %s. Stehen ist überschätzt.",
                "Ein stiller Moment, %s. Davon verstehen wir etwas.",
            },

            gruppe = {
                "Setzt Euch. Wir haben schließlich alle Zeit der Welt.",
                "Eine kurze Rast. Nicht aus Erschöpfung, eher aus Gewohnheit.",
                "Die Dunkelheit läuft uns nicht davon.",
                "Stehen ist überschätzt.",
                "Ein stiller Moment. Davon verstehen wir etwas.",
            },
        },

        SLEEP = {
            ziel = {
                "Schlaft gut, %s. Ich beneide Euch ein wenig darum.",
                "Ruht Euch aus, %s. Die Toten haben es damit nicht eilig.",
                "Eine friedliche Nacht, %s. So friedlich wie möglich.",
                "Möge Euch kein Grabgeräusch wecken, %s.",
                "Träumt angenehm, %s. Manche Luxusgüter weiß man erst später zu schätzen.",
            },

            gruppe = {
                "Schlaft gut. Ich beneide Euch ein wenig darum.",
                "Ruht Euch aus. Die Toten haben es damit nicht eilig.",
                "Eine friedliche Nacht. So friedlich wie möglich.",
                "Möge uns kein Grabgeräusch stören.",
                "Träume sind ein unterschätzter Luxus.",
            },
        },

        THANK = {
            ziel = {
                "Habt Dank, %s. Die Verlassenen vergessen eine Schuld nicht.",
                "Meine Anerkennung, %s. Eure Hilfe war... unerwartet willkommen.",
                "Ich stehe in Eurer Schuld, %s. Ein unangenehmes Gefühl.",
                "Ihr habt meinen Dank, %s. Genießt die Seltenheit dieses Augenblicks.",
                "Die Schatten mögen Euch Eure Hilfe vergelten, %s.",
                "Gut gemacht, %s. Ich werde mich erkenntlich zeigen.",
            },

            gruppe = {
                "Habt Dank. Die Verlassenen vergessen eine Schuld nicht.",
                "Meine Anerkennung. Eure Hilfe war unerwartet willkommen.",
                "Ich stehe in Eurer Schuld. Ein unangenehmes Gefühl.",
                "Ihr habt meinen Dank. Genießt die Seltenheit dieses Augenblicks.",
                "Die Schatten mögen Euch Eure Hilfe vergelten.",
                "Gut gemacht. Ich werde mich erkenntlich zeigen.",
            },
        },
    
        FLIRT = {
            ziel = {
                "%s, mein Herz würde für Euch schlagen. Wenn es das noch täte.",
                "Ihr seht erstaunlich lebendig aus, %s. Das meine ich als Kompliment.",
                "%s, Ihr bringt etwas Wärme in meine ansonsten recht kühle Existenz.",
            },
            gruppe = {
                "Romantik ist nicht tot. Nur gelegentlich untot.",
                "Wer braucht schon Herzklopfen?",
                "Selbst der Tod hat offenbar Geschmack.",
            },
        },
},

    -- ======================================
    -- TROLL
    -- ======================================

    ["Troll"] = {

        HELLO = {
            ziel = {
                "Seid gegrüßt, %s. Da Loa haben Euch wohl hergeführt.",
                "Willkommen, %s. Möge Euer Mojo stark sein.",
                "Ah, %s! Gute Gesellschaft ist immer willkommen.",
                "Kommt näher, %s. Da Geister scheinen nichts dagegen zu haben.",
            },

            gruppe = {
                "Seid gegrüßt. Da Loa haben uns wohl zusammengeführt.",
                "Willkommen! Möge unser Mojo stark sein.",
                "Gute Gesellschaft ist immer willkommen.",
                "Kommt näher. Da Geister scheinen nichts dagegen zu haben.",
            },
        },

        WAVE = {
            ziel = {
                "Hey, %s! Da Loa grüßen Euch.",
                "Seid gegrüßt, %s. Möge Euer Mojo stark bleiben.",
                "Gut, Euch zu sehen, %s.",
                "Da Geister kennen Euren Namen, %s.",
                "Ein Gruß aus da alten Heimat, %s.",
                "Bleibt locker, %s. Da Tag ist noch jung.",
            },

            gruppe = {
                "Hey! Da Loa grüßen Euch.",
                "Möge unser Mojo stark bleiben.",
                "Gut, Euch zu sehen, Gefährten.",
                "Da Geister kennen unsere Namen.",
                "Ein Gruß aus da alten Heimat.",
                "Bleibt locker. Da Tag ist noch jung.",
            },
        },

        SALUTE = {
            ziel = {
                "Respekt, %s. Da Loa mögen Stärke.",
                "Euer Mojo ist stark, %s. Das verdient Anerkennung.",
                "Ich grüße Euch mit Respekt, %s.",
                "Da Geister sehen Euren Mut, %s.",
                "Ehre Eurer Stärke, %s.",
            },

            gruppe = {
                "Respekt! Da Loa mögen Stärke.",
                "Starkes Mojo verdient Anerkennung.",
                "Ich grüße Euch mit Respekt.",
                "Da Geister sehen unseren Mut.",
                "Ehre unserer Stärke.",
            },
        },

        BOW = {
            ziel = {
                "Ich neige mein Haupt vor Euch, %s. Da Loa sehen Respekt gern.",
                "Respekt, %s. Ihr habt ihn Euch verdient.",
                "Da Geister kennen Euren Wert, %s.",
                "Eine Verbeugung für starkes Mojo, %s.",
                "Ehre sei Euch, %s.",
            },

            gruppe = {
                "Ich neige mein Haupt. Da Loa sehen Respekt gern.",
                "Respekt. Ihr habt ihn Euch verdient.",
                "Da Geister kennen Euren Wert.",
                "Eine Verbeugung für starkes Mojo.",
                "Ehre sei Euch allen.",
            },
        },

        LAUGH = {
            ziel = {
                "Ha! Der war gut, %s!",
                "Hehe, %s. Da hat sogar mein Mojo gezuckt.",
                "Ihr habt Humor, %s. Da gefällt mir.",
                "Bei da Loa, %s, den merk ich mir!",
                "Ha! Da war besser als erwartet, %s.",
            },

            gruppe = {
                "Ha! Der war gut!",
                "Hehe, da hat sogar mein Mojo gezuckt.",
                "Ihr habt Humor. Da gefällt mir.",
                "Bei da Loa, den merk ich mir!",
                "Ha! Da war besser als erwartet.",
            },
        },

        DANCE = {
            ziel = {
                "Kommt, %s! Zeigt mir Euren Tanz.",
                "Da Trommeln fehlen, aber wir kriegen das hin, %s.",
                "Tanzt mit, %s. Da Loa mögen gute Stimmung.",
                "Ein bisschen Rhythmus schadet keinem Mojo, %s.",
                "Los, %s! Da Füße wissen schon, was zu tun ist.",
            },

            gruppe = {
                "Kommt! Zeigt mir Euren Tanz.",
                "Da Trommeln fehlen, aber wir kriegen das hin.",
                "Da Loa mögen gute Stimmung.",
                "Ein bisschen Rhythmus schadet keinem Mojo.",
                "Los! Da Füße wissen schon, was zu tun ist.",
            },
        },

        SIT = {
            ziel = {
                "Setzt Euch, %s. Da Loa laufen uns nicht davon.",
                "Rastet ein wenig, %s. Starkes Mojo braucht einen ruhigen Kopf.",
                "Kommt, %s. Ein bisschen Ruhe tut gut.",
                "Setzt Euch, %s. Da nächste Kampf kommt früh genug.",
                "Zeit für eine Pause, %s. Auch Trolle müssen mal die Beine lang machen.",
            },

            gruppe = {
                "Setzt Euch. Da Loa laufen uns nicht davon.",
                "Starkes Mojo braucht einen ruhigen Kopf.",
                "Ein bisschen Ruhe tut gut.",
                "Da nächste Kampf kommt früh genug.",
                "Zeit für eine Pause. Macht da Beine lang.",
            },
        },

        SLEEP = {
            ziel = {
                "Schlaft gut, %s. Da Loa mögen über Euch wachen.",
                "Ruht Euch aus, %s. Morgen braucht Ihr wieder Euer Mojo.",
                "Da Geister sollen Eure Träume in Ruhe lassen, %s.",
                "Gute Nacht, %s. Lasst Euch nicht von da Voodoo wecken.",
                "Möge da Nacht Euch neue Kraft geben, %s.",
            },

            gruppe = {
                "Schlaft gut. Da Loa mögen über uns wachen.",
                "Ruht Euch aus. Morgen brauchen wir wieder unser Mojo.",
                "Da Geister sollen unsere Träume in Ruhe lassen.",
                "Gute Nacht. Lasst Euch nicht von da Voodoo wecken.",
                "Möge da Nacht uns neue Kraft geben.",
            },
        },

        THANK = {
            ziel = {
                "Habt Dank, %s. Da Loa mögen Euch dafür Glück schicken.",
                "Gute Hilfe, %s. Da vergess ich nicht.",
                "Mein Dank, %s. Euer Mojo ist stark.",
                "Ihr habt uns gut geholfen, %s. Respekt.",
                "Da Geister sollen Euch freundlich gesinnt sein, %s.",
                "Ich schulde Euch was, %s. Und Trolle vergessen so etwas nicht.",
            },

            gruppe = {
                "Habt Dank. Da Loa mögen Euch dafür Glück schicken.",
                "Gute Hilfe. Da vergess ich nicht.",
                "Mein Dank. Euer Mojo ist stark.",
                "Ihr habt uns gut geholfen. Respekt.",
                "Da Geister sollen Euch freundlich gesinnt sein.",
                "Ich schulde Euch was. Und Trolle vergessen so etwas nicht.",
            },
        },
    
        FLIRT = {
            ziel = {
                "He, %s, dat Lächeln gefällt mir.",
                "%s, Ihr habt gutes Mojo. Sehr gutes Mojo.",
                "Kommt näher, %s. Ich beiß nur, wenn's gut läuft.",
            },
            gruppe = {
                "Da Mojo fühlt sich heute besonders freundlich an.",
                "Hehe... da könnte was gehen.",
                "Gutes Mojo erkennt gutes Mojo.",
            },
        },
},


    -- ======================================
    -- HIMMELSGEBORENE / SKYBORNE
    -- ======================================

    ["Skyborne"] = {
        HELLO = {
            ziel = {
                "Der Wind hat Euch zu mir getragen, %s. Seid willkommen.",
                "Seid gegruesst, %s. Moege der Himmel Euren Weg weit halten.",
                "Ein freier Himmel und gute Gesellschaft. Willkommen, %s.",
                "Zephras gruesst Euch durch jeden Luftzug, %s.",
                "Zwischen Himmel und Erde ist Platz fuer neue Begegnungen, %s.",
            },
            gruppe = {
                "Der Wind hat gute Gesellschaft zusammengetragen.",
                "Seid gegruesst. Moege der Himmel unsere Wege weit halten.",
                "Ein freier Himmel und gute Gesellschaft. Willkommen.",
                "Zephras gruesst uns durch jeden Luftzug.",
                "Zwischen Himmel und Erde ist Platz fuer neue Begegnungen.",
            },
        },
        WAVE = {
            ziel = {
                "Ein Gruss aus luftiger Hoehe, %s!",
                "Der Wind trage meinen Gruss zu Euch, %s.",
                "Seid gegruesst, %s. Die Stroemung ist heute freundlich.",
                "Ein leichter Wind und ein ehrlicher Gruss fuer Euch, %s.",
                "Moege Euch stets ein guter Aufwind begleiten, %s.",
            },
            gruppe = {
                "Ein Gruss aus luftiger Hoehe!",
                "Der Wind trage meinen Gruss zu Euch allen.",
                "Seid gegruesst. Die Stroemung ist heute freundlich.",
                "Ein leichter Wind und ein ehrlicher Gruss fuer alle.",
                "Moege uns stets ein guter Aufwind begleiten.",
            },
        },
        SALUTE = {
            ziel = {
                "Freier Himmel ueber Euch, %s. Mein Respekt.",
                "Moege Euer Blick weit und Euer Schritt sicher bleiben, %s.",
                "Wind und Weite, %s. Ihr habt meinen Respekt.",
                "Ein klarer Himmel fuer einen wuerdigen Weg, %s.",
                "Zephras sei Euch gewogen, %s.",
            },
            gruppe = {
                "Freier Himmel ueber uns. Mein Respekt gilt Euch.",
                "Moege unser Blick weit und unser Schritt sicher bleiben.",
                "Wind und Weite. Ihr habt meinen Respekt.",
                "Ein klarer Himmel fuer wuerdige Wege.",
                "Zephras sei uns gewogen.",
            },
        },
        BOW = {
            ziel = {
                "Vor einem guten Weg verneigt man sich ebenso wie vor der Hoehe. Mein Respekt, %s.",
                "Ich neige den Kopf vor Euch, %s. Moege der Wind Euch tragen.",
                "Mein Respekt gilt Euch und Eurem Weg, %s.",
                "Zwischen Wolken und Erde begegnen wir uns auf Augenhoehe, %s.",
                "Ehre Eurem Weg unter offenem Himmel, %s.",
            },
            gruppe = {
                "Mein Respekt gilt Euch und Euren Wegen.",
                "Moege der Wind uns alle sicher tragen.",
                "Zwischen Wolken und Erde begegnen wir uns auf Augenhoehe.",
                "Ehre allen Wegen unter offenem Himmel.",
                "Ein weiter Blick verdient einen offenen Gruss.",
            },
        },
        LAUGH = {
            ziel = {
                "Ha! Das war leichter als Rueckenwind, %s!",
                "Ihr bringt selbst den Wind zum Kichern, %s.",
                "Gut getroffen, %s. Den merke ich mir.",
                "Bei Zephras, der war gut, %s!",
                "So klingt ein Tag mit gutem Aufwind, %s.",
            },
            gruppe = {
                "Ha! Das war leichter als Rueckenwind!",
                "Ihr bringt selbst den Wind zum Kichern.",
                "Gut getroffen. Den merke ich mir.",
                "Bei Zephras, der war gut!",
                "So klingt ein Tag mit gutem Aufwind.",
            },
        },
        DANCE = {
            ziel = {
                "Kommt, %s. Der Wind gibt schon den Takt vor.",
                "Ein Schritt mit der Stroemung, einer gegen sie. Tanzt Ihr mit, %s?",
                "Wer fliegen kann, sollte auch tanzen koennen, %s.",
                "Lasst uns sehen, ob Eure Schritte mit dem Wind mithalten, %s.",
                "Zephras schickt den Rhythmus, wir erledigen den Rest, %s.",
            },
            gruppe = {
                "Der Wind gibt schon den Takt vor.",
                "Ein Schritt mit der Stroemung, einer gegen sie.",
                "Wer fliegen kann, sollte auch tanzen koennen.",
                "Mal sehen, ob unsere Schritte mit dem Wind mithalten.",
                "Zephras schickt den Rhythmus, wir erledigen den Rest.",
            },
        },
        SIT = {
            ziel = {
                "Setzt Euch, %s. Auch der Wind legt sich gelegentlich.",
                "Eine Rast, %s. Der Horizont laeuft uns nicht davon.",
                "Kommt zur Ruhe, %s. Ein klarer Blick braucht manchmal Stillstand.",
                "Ein Augenblick zwischen zwei Aufwinden, %s.",
                "Ruht Euch aus, %s. Danach wartet wieder der offene Himmel.",
            },
            gruppe = {
                "Auch der Wind legt sich gelegentlich. Zeit fuer eine Rast.",
                "Der Horizont laeuft uns nicht davon.",
                "Ein klarer Blick braucht manchmal Stillstand.",
                "Ein Augenblick zwischen zwei Aufwinden.",
                "Ruht Euch aus. Danach wartet wieder der offene Himmel.",
            },
        },
        SLEEP = {
            ziel = {
                "Schlaft gut, %s. Moege der Wind Eure Traeume sanft tragen.",
                "Ruht unter weitem Himmel, %s.",
                "Moege die Nacht ruhig und der Morgen voller Aufwind sein, %s.",
                "Zephras wache ueber Euren Schlaf, %s.",
                "Der Himmel bleibt offen, auch wenn Ihr die Augen schliesst, %s.",
            },
            gruppe = {
                "Moege der Wind unsere Traeume sanft tragen.",
                "Ruht unter weitem Himmel.",
                "Moege die Nacht ruhig und der Morgen voller Aufwind sein.",
                "Zephras wache ueber unseren Schlaf.",
                "Der Himmel bleibt offen, auch wenn wir die Augen schliessen.",
            },
        },
        THANK = {
            ziel = {
                "Habt Dank, %s. Der Wind soll Euch den Gefallen eines Tages zuruecktragen.",
                "Eure Hilfe war ein willkommener Aufwind, %s.",
                "Mein Dank begleitet Euch, %s.",
                "Ihr habt meinen Weg leichter gemacht, %s. Danke.",
                "Zephras schenke Euch guten Wind fuer Eure Hilfe, %s.",
            },
            gruppe = {
                "Habt Dank. Ihr wart ein willkommener Aufwind.",
                "Mein Dank begleitet Euch.",
                "Ihr habt den Weg leichter gemacht. Danke.",
                "Zephras schenke Euch guten Wind fuer Eure Hilfe.",
                "Gute Gefaehrten tragen weiter als jeder Aufwind.",
            },
        },
    
        FLIRT = {
            ziel = {
                "Der Wind scheint heute immer wieder zu Euch zu finden, %s. Ich verstehe ihn.",
                "%s, Ihr macht es schwer, den Blick am Horizont zu halten.",
                "Wenn Ihr mögt, %s, teile ich den nächsten Aufwind mit Euch.",
            },
            gruppe = {
                "Manche Begegnungen tragen weiter als jeder Wind.",
                "Der Himmel ist weit, aber gute Gesellschaft findet man selten.",
                "Heute trägt der Wind einen ausgesprochen angenehmen Gedanken.",
            },
        },
},

    ["Tauren"] = {

        HELLO = {
            ziel = {
                "Die Erdenmutter grüße Euch, %s.",
                "Seid willkommen, %s. Möge Euer Weg ruhig sein.",
                "Es ist gut, Euch zu sehen, %s.",
            },
            gruppe = {
                "Die Erdenmutter grüße uns alle.",
                "Seid willkommen. Mögen unsere Wege sicher sein.",
                "Es ist gut, Gefährten am Feuer zu wissen.",
            },
        },
        WAVE = {
            ziel = {
                "Ein ruhiger Gruß, %s.",
                "Möge der Wind Euch freundlich begegnen, %s.",
                "Die Erdenmutter begleite Euch, %s.",
            },
            gruppe = {
                "Ein Gruß an alle Gefährten.",
                "Möge der Wind uns freundlich begegnen.",
                "Die Erdenmutter begleite unsere Schritte.",
            },
        },
        SALUTE = {
            ziel = {
                "Ihr habt meinen Respekt, %s.",
                "Die Ahnen mögen über Euch wachen, %s.",
                "Ehre Eurem Weg, %s.",
            },
            gruppe = {
                "Respekt und Ehre.",
                "Die Ahnen mögen über uns wachen.",
                "Ehre unseren gemeinsamen Wegen.",
            },
        },
        BOW = {
            ziel = {
                "Ich neige mein Haupt vor Euch, %s.",
                "Mit Respekt, %s.",
                "Die Erdenmutter lehre uns Demut, %s.",
            },
            gruppe = {
                "Ich neige mein Haupt vor Euch.",
                "Mit Respekt, Gefährten.",
                "Die Erdenmutter lehre uns Demut.",
            },
        },
        LAUGH = {
            ziel = {
                "Ha! Das tat gut, %s.",
                "Euer Lachen ist ansteckend, %s.",
                "Ein leichter Geist trägt weit, %s.",
            },
            gruppe = {
                "Ha! Ein gutes Lachen wärmt das Herz.",
                "Ein leichter Geist trägt weit.",
                "Auch ernste Wege brauchen Freude.",
            },
        },
        DANCE = {
            ziel = {
                "Kommt, %s. Lasst die Erde unseren Takt tragen.",
                "Tanzt mit mir, %s.",
                "Ein wenig Freude ehrt das Leben, %s.",
            },
            gruppe = {
                "Lasst die Erde unseren Takt tragen.",
                "Tanzt, Gefährten.",
                "Ein wenig Freude ehrt das Leben.",
            },
        },
        SIT = {
            ziel = {
                "Setzt Euch zu mir, %s. Der Weg kann warten.",
                "Ruht Eure Beine, %s.",
                "Ein stiller Augenblick tut gut, %s.",
            },
            gruppe = {
                "Setzt Euch. Der Weg kann warten.",
                "Ruht die Beine, Gefährten.",
                "Ein stiller Augenblick tut gut.",
            },
        },
        SLEEP = {
            ziel = {
                "Ruht wohl, %s. Die Erdenmutter wache über Euren Schlaf.",
                "Schlaft friedlich, %s.",
                "Morgen trägt die Erde Eure Schritte erneut, %s.",
            },
            gruppe = {
                "Ruht wohl. Die Erdenmutter wache über uns.",
                "Schlaft friedlich.",
                "Morgen trägt die Erde unsere Schritte erneut.",
            },
        },
        THANK = {
            ziel = {
                "Habt meinen Dank, %s.",
                "Die Erdenmutter vergelte Eure Hilfe, %s.",
                "Ich werde Eure Güte nicht vergessen, %s.",
            },
            gruppe = {
                "Habt meinen Dank.",
                "Die Erdenmutter vergelte Eure Hilfe.",
                "Güte wird nicht vergessen.",
            },
        },
        FLIRT = {
            ziel = {
                "Die Erdenmutter hat Euch einen ruhigen Blick geschenkt, %s.",
                "%s, an einem langen Abend würde ich gern einen Platz am Feuer mit Euch teilen.",
                "Eure Gegenwart bringt Ruhe in meinen Schritt, %s.",
            },
            gruppe = {
                "Gute Gesellschaft wärmt besser als manches Feuer.",
                "Manche Wege möchte man nicht allein gehen.",
                "Die Erdenmutter schenkt uns bisweilen sehr angenehme Begegnungen.",
            },
        },
    },

    ["Draenei"] = {

        HELLO = {
            ziel = {
                "Das Licht grüße Euch, %s.",
                "Seid willkommen, %s. Mögen die Sterne Euren Weg leiten.",
                "Es freut mich, Euch zu begegnen, %s.",
            },
            gruppe = {
                "Das Licht grüße Euch alle.",
                "Seid willkommen. Mögen die Sterne unsere Wege leiten.",
                "Eine erfreuliche Begegnung.",
            },
        },
        WAVE = {
            ziel = {
                "Seid gegrüßt, %s.",
                "Das Licht sei mit Euch, %s.",
                "Ein Gruß von einem Reisenden an den anderen, %s.",
            },
            gruppe = {
                "Seid gegrüßt.",
                "Das Licht sei mit uns.",
                "Ein Gruß an alle Reisenden.",
            },
        },
        SALUTE = {
            ziel = {
                "Ehre und Licht, %s.",
                "Ihr habt meine Achtung, %s.",
                "Mögen die Naaru Euren Weg erhellen, %s.",
            },
            gruppe = {
                "Ehre und Licht.",
                "Meine Achtung gilt Euch.",
                "Mögen die Naaru unsere Wege erhellen.",
            },
        },
        BOW = {
            ziel = {
                "Ich verneige mich vor Euch, %s.",
                "Mit Achtung, %s.",
                "Möge Demut unseren Blick klären, %s.",
            },
            gruppe = {
                "Ich verneige mich vor Euch.",
                "Mit Achtung, Gefährten.",
                "Möge Demut unseren Blick klären.",
            },
        },
        LAUGH = {
            ziel = {
                "Das war erfreulich, %s.",
                "Ihr bringt selbst einen langen Weg zum Leuchten, %s.",
                "Ein gutes Lachen ist auf jeder Reise willkommen, %s.",
            },
            gruppe = {
                "Ein gutes Lachen ist auf jeder Reise willkommen.",
                "Freude macht selbst lange Wege leichter.",
                "Das Licht kennt auch Heiterkeit.",
            },
        },
        DANCE = {
            ziel = {
                "Tanzt mit mir, %s. Auch Reisende dürfen feiern.",
                "Ein Schritt für die Freude, %s.",
                "Lasst uns den Sternen etwas zum Ansehen geben, %s.",
            },
            gruppe = {
                "Auch Reisende dürfen feiern.",
                "Ein Schritt für die Freude.",
                "Lasst uns den Sternen etwas zum Ansehen geben.",
            },
        },
        SIT = {
            ziel = {
                "Setzt Euch, %s. Selbst lange Reisen brauchen Pausen.",
                "Ruht einen Augenblick, %s.",
                "Der nächste Schritt kann warten, %s.",
            },
            gruppe = {
                "Setzt Euch. Selbst lange Reisen brauchen Pausen.",
                "Ruht einen Augenblick.",
                "Der nächste Schritt kann warten.",
            },
        },
        SLEEP = {
            ziel = {
                "Ruht wohl, %s. Mögen die Sterne über Euch wachen.",
                "Schlaft friedlich, %s.",
                "Das Licht begleite Eure Träume, %s.",
            },
            gruppe = {
                "Ruht wohl. Mögen die Sterne über uns wachen.",
                "Schlaft friedlich.",
                "Das Licht begleite unsere Träume.",
            },
        },
        THANK = {
            ziel = {
                "Habt Dank, %s. Das Licht vergelte Eure Güte.",
                "Eure Hilfe ehrt Euch, %s.",
                "Ich werde Eure Hilfe auf meiner Reise nicht vergessen, %s.",
            },
            gruppe = {
                "Habt Dank. Das Licht vergelte Eure Güte.",
                "Eure Hilfe ehrt Euch.",
                "Solche Hilfe wird auf keiner Reise vergessen.",
            },
        },
        FLIRT = {
            ziel = {
                "Das Licht der Sterne steht Euch gut, %s.",
                "%s, Eure Gegenwart lässt selbst eine lange Reise kürzer erscheinen.",
                "Wenn die Naaru Schönheit messen würden, %s, hätten sie heute viel zu tun.",
            },
            gruppe = {
                "Auch auf langen Reisen findet man unerwartet schöne Begegnungen.",
                "Die Sterne leuchten heute bemerkenswert freundlich.",
                "Manche Begegnungen sind ein kleines Geschenk des Schicksals.",
            },
        },
    },


}
