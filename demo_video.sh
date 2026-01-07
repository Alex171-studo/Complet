#!/bin/bash

# Script d'automatisation pour la vidéo de démo "Eco-Sensing"
# Ce script lance le programme et simule les entrées utilisateur avec des pauses
# pour que tu aies le temps de parler ou que la vidéo soit fluide.

# 1. Compilation propre
echo "--- Étape 1 : Compilation ---"
make clean
make
echo "--- Lancement de la Démo ---"
sleep 2

# 2. Exécution du scénario "Saturation Mémoire"
# ( echo "1"; sleep 1; ... ) permet d'envoyer les commandes une par une avec du délai.

(
    # Choisir "New Simulation"
    echo "1" 
    sleep 1
    
    # Position X = 500
    echo "500"
    sleep 1
    # Position Y = 500
    echo "500"
    sleep 1
    
    # Validation du "Press Enter" après init
    echo ""
    sleep 1

    # Step 1
    echo "5"
    sleep 1
    echo "" # Press Enter

    # Step 2
    echo "5"
    sleep 1
    echo "" # Press Enter

    # Step 3
    echo "5"
    sleep 1
    echo "" # Press Enter

    # Step 4
    echo "5"
    sleep 1
    echo "" # Press Enter

    # Step 5
    echo "5"
    sleep 1
    echo "" # Press Enter

    # Step 6 -> ALERTE
    echo "5"
    sleep 4
    echo "" # Press Enter

    # Save State
    echo "6"
    sleep 2
    echo "" # Press Enter

    # Exit
    echo "7"
    sleep 1
    # Confirm Save (1=Yes)
    echo "1"

) | ./eco_sensing

echo ""
echo "--- Fin de la Démo ---"
