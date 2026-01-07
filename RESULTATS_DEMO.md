# Rapport de Validation : Preuve de Gestion Mémoire

Ce document analyse les logs générés lors de la démonstration "Crash Test" pour valider la compétence "Gestion Dynamique de la Mémoire".

## Analyse du Log

### 1. Remplissage du Buffer
On observe que les paquets s'accumulent car la transmission échoue (Simulé par une distance excessive de 500m).
```text
Info: Packet Generated (ID: 1, Val: 28.20) | Usage: 1/5
...
Info: Packet Generated (ID: 2, Val: 63.60) | Usage: 2/5
...
Info: Packet Generated (ID: 5, Val: 91.40) | Usage: 5/5
```
À ce stade, la mémoire allouée est pleine (5 structs Packet).

### 2. Saturation et Libération (Preuve)
Lors de la génération du 6ème paquet, le système détecte la saturation.
```text
ALERTE : Mémoire saturée. Suppression du paquet ID [1] pour libérer de l'espace.
Info: Packet Generated (ID: 6, Val: 37.50) | Usage: 5/5
```
**Explication Technique :**
1. Le pointeur `bufferHead` (ID 1) est identifié.
2. `free(oldHead)` est appelé pour libérer la mémoire.
3. Les pointeurs sont mis à jour.
4. Le nouveau paquet (ID 6) est alloué (`malloc`) et ajouté à la fin.

Ce comportement se répète pour chaque nouveau paquet (FIFO - First In First Out) :
```text
ALERTE : Mémoire saturée. Suppression du paquet ID [2]...
ALERTE : Mémoire saturée. Suppression du paquet ID [3]...
```

## Conclusion
Le programme gère correctement la contrainte matérielle de 5 paquets et évite toute fuite mémoire grâce à la rotation dynamique des allocations.
