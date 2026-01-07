# Comprendre le Projet (Pour ne pas être perdu)

Tu as l'impression de ne rien comprendre ? Pas de panique. Voici l'explication simple "avec les mains".

## 1. L'Analogie de la Boîte aux Lettres 📬

Imagine que tu es un **Capteur** dans un champ.
Ta mission : Noter la température et envoyer ce message à la **Base** (la maison).

*   **Le Message** = Un "Paquet".
*   **Ta Mémoire (Buffer)** = Ta sacoche. Elle est petite, elle ne peut contenir que **5 messages maximum**.
*   **Ta Batterie** = Ton énergie pour courir jusqu'à la maison.

## 2. Pourquoi Buffer = 0 à (10, 10) ? (Cas Facile)
Si tu es juste à côté de la maison (Position 10 mètres, 10 mètres) :
1.  Tu écris un message.
2.  Ça te coûte très peu d'énergie d'aller le donner.
3.  Tu le donnes immédiatement.
4.  **Résultat : Ta sacoche est vide.** (Buffer = 0).
C'est pour ça que quand tu mets (10, 10), le buffer reste à 0. Tout est envoyé instantanément !

## 3. Pourquoi Buffer = 5 à (500, 500) ? (Cas Difficile)
Si tu es super loin de la maison (500 mètres) :
1.  Tu écris un message.
2.  Tu regardes ton énergie : "Oula, c'est trop loin, je vais mourir si j'y vais".
3.  **Tu ne peux pas l'envoyer.**
4.  Tu gardes le message dans ta sacoche. (Buffer = 1).
5.  Une heure après, tu en écris un autre. Toujours trop loin. Tu le gardes. (Buffer = 2).
6.  ... Jusqu'à ce que ta sacoche soit pleine (Buffer = 5).

## 4. Et si la sacoche est pleine ? (Le Cœur du Projet)
Tu as 5 messages dans ta sacoche. Tu en écris un 6ème.
Tu ne peux pas porter 6 messages.
**La règle du jeu (Le Code) :**
*   Tu prends le message **le plus vieux** (celui qui est là depuis le plus longtemps).
*   Tu le jettes (Suppression / `free`).
*   Tu mets le nouveau à la place.
*   *L'alerte "ALERTE : Mémoire saturée" apparaît à ce moment là.*

## 5. C'est quoi le Rapport (`log.txt`) ?
C'est juste ton journal de bord.
Le prof veut voir si ta batterie descend bien et si ta sacoche se remplit.
Exemple de ligne dans le rapport :
`Temps: 10s | Batterie: 95J | Paquets en attente: 0` -> "Il est 10h, j'ai de l'énergie, sacoche vide (car j'ai tout envoyé)."
`Temps: 50s | Batterie: 5J | Paquets en attente: 5` -> "Il est midi, je suis fatigué, sacoche pleine (je n'arrive plus à envoyer)."

## En résumé pour ton Oral
*   **Le but** : Simuler un capteur intelligent.
*   **La contrainte** : Mémoire limitée (5 places).
*   **La preuve** : Montrer que quand on est loin, la mémoire se remplit et qu'on supprime proprement les vieux messages sans faire planter l'ordi.
