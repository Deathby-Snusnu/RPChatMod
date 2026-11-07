-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Spoken RP follow-ups. Never /me: the WoW client supplies its own emote.
local _, addon = ...
local texts = addon.localeData.frFR.generalTexts
texts.AGREE = { gruppe = { "Pour une fois, nous sommes d'accord.", "Cet argument tient parfaitement debout." }, ziel = { "%s, je partage ton avis." } }
texts.AMAZE = { gruppe = { "Voilà qui me laisse sans voix.", "Par les étoiles, comment est-ce possible ?" }, ziel = { "%s, tu m'étonnes vraiment." } }
texts.ANGRY = { gruppe = { "Ma patience vient de quitter la pièce.", "N'essayez surtout pas de recommencer." }, ziel = { "%s, tu mets ma patience à rude épreuve." } }
texts.ATTACKTARGET = { gruppe = { "Armes prêtes ! La cible est désignée.", "Plus de discours, gardez les yeux sur l'ennemi !" }, ziel = { "Sur %s ! Tenez la ligne !" } }
texts.BARK = { gruppe = { "Ouaf ! J'espère avoir été assez clair.", "Un chien comprend parfois mieux qu'un conseiller." }, ziel = { "%s, c'était assez clair pour toi ?" } }
texts.BASHFUL = { gruppe = { "Un peu moins d'attention me ferait plaisir.", "Je suis un héros, pas l'attraction du soir." }, ziel = { "%s, tu me fais rougir." } }
texts.BECKON = { gruppe = { "Approchez, nous parlerons mieux ici.", "Rassurez-vous, je n'ai encore mordu personne aujourd'hui." }, ziel = { "%s, approche et rejoins-nous !" } }
texts.BEG = { gruppe = { "Un peu d'aide ferait des miracles.", "Je déteste demander deux fois, mais je peux faire une exception." }, ziel = { "%s, aie un peu de pitié." } }
texts.BELCH = { gruppe = { "Pardon. Mon repas avait visiblement un mot à dire.", "Un bon rôti aime parfois avoir le dernier mot." }, ziel = { "%s, j'espère que tu ne m'en voudras pas." } }
texts.BITE = { gruppe = { "Toute menace n'a pas besoin d'une lame.", "Il me reste des dents et bien peu de patience." }, ziel = { "%s, garde tes distances avec mes dents." } }
texts.BLEED = { gruppe = { "Une simple égratignure. Particulièrement tenace.", "Qui a dit que les héros ne saignent jamais ?" }, ziel = { "%s, un bandage serait le bienvenu." } }
texts.BLINK = { gruppe = { "Ai-je bien vu ce que je viens de voir ?", "Mes yeux exigent une explication." }, ziel = { "%s, refais cela, mes yeux n'y croient pas." } }
texts.BLOW = { gruppe = { "Un baiser voyageur a besoin d'un bon vent.", "Que la brise emporte un geste affectueux." }, ziel = { "%s, ce baiser soufflé est pour toi." } }
texts.BLUSH = { gruppe = { "Voilà qui était fort inattendu.", "Mes joues parlent plus vite que moi aujourd'hui." }, ziel = { "%s, tu ne me facilites pas la réponse." } }
texts.BOGGLE = { gruppe = { "Plusieurs mots me manquent à la fois.", "Mon esprit réclame une petite pause." }, ziel = { "%s, explique-moi ce qui se passe." } }
texts.BONK = { gruppe = { "Parfois un rappel demande un peu d'insistance.", "C'était une leçon, pas une déclaration de guerre." }, ziel = { "%s, retiens ce petit avertissement." } }
texts.BORED = { gruppe = { "Quelqu'un pourrait rallumer l'aventure ?", "J'ai déjà contemplé des pierres plus passionnantes." }, ziel = { "%s, tu aurais une meilleure idée ?" } }
texts.BOUNCE = { gruppe = { "Aucune chaise ne me retiendra aujourd'hui.", "Mes pieds semblent avoir leurs propres projets." }, ziel = { "%s, allez, bouge un peu !" } }
texts.BRB = { gruppe = { "Un petit détour, je reviens tout de suite.", "Garde ma place et la soupe au chaud." }, ziel = { "%s, je reviens dans un instant." } }
texts.CACKLE = { gruppe = { "Ha ! Cela devient de plus en plus amusant.", "Je devrais peut-être moins m'en réjouir." }, ziel = { "%s, tu l'as bien cherché !" } }
texts.CALM = { gruppe = { "Du calme. La précipitation ne sert à rien.", "Un esprit clair reste une arme fiable." }, ziel = { "%s, respire avant de répondre." } }
texts.CHARGE = { gruppe = { "En avant ! La route ne va pas s'ouvrir toute seule.", "Les braves ne connaissent pas la marche arrière." }, ziel = { "Avec moi, %s ! C'est parti !" } }
texts.CHEW = { gruppe = { "Cette ration mérite un examen minutieux.", "Qui mâche trop vite manque la moitié du goût." }, ziel = { "%s, tu en veux un morceau ?" } }
texts.CHICKEN = { gruppe = { "Cot cot ! C'était une retraite tactique, évidemment.", "Pas besoin d'être une poule pour voir le danger." }, ziel = { "%s, tu caquettes ou tu agis ?" } }
texts.CHUCKLE = { gruppe = { "C'était mieux que je ne l'espérais.", "Un petit rire sauve parfois une longue journée." }, ziel = { "%s, tu sais me remonter le moral." } }
texts.COLD = { gruppe = { "Quelqu'un aurait une seconde paire de chaussettes ?", "Même mes pensées commencent à geler." }, ziel = { "%s, tu connais un endroit plus chaud ?" } }
texts.CONFUSED = { gruppe = { "La carte et la réalité ne sont pas d'accord.", "Je ne suis pas perdu. J'étudie les possibilités." }, ziel = { "%s, peux-tu m'expliquer le rapport ?" } }
texts.CONGRATS = { gruppe = { "Tu as bien mérité cela par ton travail !", "Aujourd'hui nous pouvons compter nos victoires." }, ziel = { "%s, toutes mes félicitations !" } }
texts.COUGH = { gruppe = { "Cette poussière aurait mieux fait de rester dehors.", "Pardon, l'air est particulièrement désagréable aujourd'hui." }, ziel = { "%s, aurais-tu un peu d'eau ?" } }
texts.COWER = { gruppe = { "Un petit pas en arrière serait peut-être sage.", "Le courage et la témérité ne sont pas identiques." }, ziel = { "%s, viens plutôt derrière ce mur." } }
texts.CRACK = { gruppe = { "Les doigts sont prêts. Le reste doit suivre.", "Il est temps de se remettre en mouvement." }, ziel = { "%s, prêt pour un nouveau tour ?" } }
texts.CRINGE = { gruppe = { "On aurait pu faire cela avec plus d'élégance.", "Je vais faire semblant de n'avoir rien vu." }, ziel = { "%s, dis-moi que ce n'était pas ton plan." } }
texts.CRY = { gruppe = { "Parfois les mots sont bien trop petits.", "Les larmes aussi ont besoin d'un chemin." }, ziel = { "%s, pardonne-moi. J'ai besoin d'un instant." } }
texts.CURIOUS = { gruppe = { "Voilà qui promet une histoire intéressante.", "J'aimerais comprendre comment cela fonctionne." }, ziel = { "%s, raconte-m'en davantage." } }
