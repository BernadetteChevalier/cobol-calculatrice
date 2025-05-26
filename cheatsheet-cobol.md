# 📝 Cheat Sheet COBOL

**la syntaxe, les commandes arithmetiques, les conditions, les boucles, ...**

---

## 💻 Syntaxe de base COBOL

### 1. **Structure générale d'un programme COBOL**

```cobol
IDENTIFICATION DIVISION.
    PROGRAM-ID. NomDuProgramme.
    AUTHOR. Auteur.
    DATE-WRITTEN. Date.

ENVIRONMENT DIVISION.
    * Configuration des entrées/sorties (fichiers, périphériques).

DATA DIVISION.
    * Déclaration des variables (WORKING-STORAGE, FILE SECTION).

PROCEDURE DIVISION.
    * Code du programme, procédures et algorithmes.


## **Les conditions**

`IF`, `IF ELSE`, `EVALUATE`, `NEXT SENTENCE`, etc.

## 🔹 1. IF simple

```cobol
IF AGE > 18
    DISPLAY "Majeur".
END-IF.

 Exécute l'instruction si la condition est vraie.
---
 IF AGE >= 18
    DISPLAY "Majeur".
ELSE
    DISPLAY "Mineur".
END-IF.
---
IF NOTE >= 15
    DISPLAY "Très bien".
ELSE IF NOTE >= 10
    DISPLAY "Moyen".
ELSE
    DISPLAY "Insuffisant".
END-IF.
👉 Permet de tester plusieurs cas de façon hiérarchique.

---
🔹 4. Conditions combinées avec AND / OR

IF AGE > 18 AND STATUT = "ACTIF"
    DISPLAY "Adulte actif".
END-IF.

IF NOTE < 10 OR ABSENCES > 5
    DISPLAY "Alerte : élève à risque".
END-IF.
👉 Combine plusieurs conditions logiques dans un seul IF.

---
🔹 5. IF dans une boucle (PERFORM)

PERFORM UNTIL REPONSE = "N"
    IF PRIX > 100
        DISPLAY "Prix élevé".
    ELSE
        DISPLAY "Prix acceptable".
    END-IF
    ACCEPT REPONSE
END-PERFORM.
👉 IF est évalué à chaque tour de boucle.

---
🔹 6. EVALUATE (équivalent du switch/case)

EVALUATE CHOIX
    WHEN "1"
        DISPLAY "Option 1 sélectionnée".
    WHEN "2"
        DISPLAY "Option 2 sélectionnée".
    WHEN OTHER
        DISPLAY "Choix invalide".
END-EVALUATE.
👉 Plus propre que plusieurs IF successifs quand on teste une même variable.

---
🔹 7. EVALUATE avec des conditions personnalisées

EVALUATE TRUE
    WHEN AGE < 12
        DISPLAY "Enfant".
    WHEN AGE < 18
        DISPLAY "Adolescent".
    WHEN OTHER
        DISPLAY "Adulte".
END-EVALUATE.
👉 EVALUATE TRUE permet de tester des expressions complexes.

---
🔹 8. NEXT SENTENCE

IF ERREUR = "O"
    DISPLAY "Erreur détectée."
    NEXT SENTENCE
END-IF.

DISPLAY "Suite du traitement.".
🟡 Attention : NEXT SENTENCE saute au prochain point (.). Rarement conseillé, car peu clair.

🧠 Conseils pratiques
Chaque IF doit toujours se terminer par END-IF.

Utilise EVALUATE pour remplacer des blocs de IF / ELSE complexes

Évite NEXT SENTENCE sauf cas très spécifiques

Combine AND, OR, NOT pour des conditions logiques avancées


