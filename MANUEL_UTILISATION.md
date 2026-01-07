# Manuel d'Utilisation : Eco-Sensing

Ce guide est fait pour toi. Il t'explique comment manipuler le logiciel comme un pro.

## 1. À quoi sert ce logiciel ?
C'est un simulateur de capteur agricole. Il imagine qu'il a une batterie et une mémoire. Il essaie d'envoyer des données (Température/Humidité) à une station.
*   Si le capteur est **proche**, ça coûte peu d'énergie, il envoie tout de suite.
*   Si le capteur est **tard**, ça coûte trop cher, il garde les données en mémoire (Buffer).
*   Si la mémoire est **pleine**, il doit supprimer les vieilles données pour faire de la place (c'est le cœur du projet).

## 2. Comment le lancer ?
Dans ton terminal, assure-toi d'être dans le dossier et tape :
```bash
./eco_sensing
```
Tu arriveras sur le menu principal.

## 3. Comprendre le Menu
Voici ce que fait chaque option :

*   **1. New Simulation** : C'est le "Reset". Ça crée un nouveau capteur tout neuf (Batterie 100%). Tu dois choisir sa position X et Y.
    *   *Astuce* : Mets X=10, Y=10 pour que tout marche bien. Mets X=500, Y=500 pour provoquer des bugs (saturation mémoire).
*   **2. Load Previous State** : Charge le fichier `save.bin`. Ça te permet de reprendre exactement là où tu avais sauvegardé (même batterie, mêmes paquets en attente).
*   **3. View Sensor Status** : Affiche l'état actuel (Batterie restante, contenu du buffer).
*   **4. Run Simulation (Auto)** : Le mode "Laisser tourner". Le logiciel va mouliner tout seul jusqu'à ce que la batterie tombe à 0.
    *   ⚠️ **Comment arrêter ?** Si c'est trop long, tu peux faire **`Ctrl + C`** dans le terminal pour forcer l'arrêt.
*   **5. Run Single Step** : Le mode "Pas à pas". C'est le plus utile pour le professeur. À chaque fois que tu le lances, il se passe 1 seconde simulée (Création d'un paquet -> Tentative d'envoi).
*   **6. Save State** : Crée le fichier `save.bin`.
*   **7. Exit** : Quitte le logiciel proprement (et te propose de sauvegarder).

## 4. Tes Questions Précises

### "Comment générer le rapport ?"
Tu n'as **rien à faire** ! 😄
Le rapport se génère tout seul.
*   À chaque fois que le simulateur avance (en mode Auto ou Single Step), il écrit une ligne dans le fichier **`log.txt`** qui se trouve dans le même dossier.
*   Ouvre ce fichier avec un éditeur de texte pour voir l'historique de ta simulation. C'est ça le "rapport".

### "Comment arrêter une capture ?"
*   Si tu parles de la **simulation** (le texte qui défile vite) : Attends que la batterie soit vide (ça s'arrête tout seul) ou appuie sur **`Ctrl` et `C`** en même temps pour couper.
*   Si tu parles de la **vidéo de ton écran** : Ça dépend de ton logiciel d'enregistrement (OBS, QuickTime, etc.). Quand le script `demo_video.sh` affiche "--- Fin de la Démo ---", tu peux arrêter l'enregistrement vidéo.

### "À quoi sert save.bin ?"
C'est ta "carte mémoire".
Le projet demandait de prouver qu'on sait faire de la "persistance binaire".
Contrairement à un fichier texte (que tu peux lire), `save.bin` est écrit en langage machine (des 0 et des 1). C'est illisible pour un humain, mais c'est très rapide pour l'ordinateur.
*   **Utilité** : Lance une simulation, vide la moitié de la batterie, fais "Save", quitte, relance, fais "Load". Tu retrouveras ta batterie à 50%. C'est la preuve que ça marche.

## 5. Résumé pour ta Vidéo
1.  Lance `./demo_video.sh`
2.  Regarde le script tout faire tout seul.
3.  Quand le script a fini, arrête ton enregistrement vidéo.
4.  C'est tout !
