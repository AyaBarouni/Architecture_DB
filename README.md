# Base de Données - Monuments et Architecture du Monde

Projet réalisé dans le cadre du cours **TI503N – Bases de données 1** (TI503N-2526PSA01) – EFREI Paris (2025-2026).  
Encadrante : Lena TREBAUL — Framework prompt engineering : Salim NAHLE  
Réalisé par : Aya BAROUNI - Ing1 New, Groupe 1

---

## Contexte

Ce projet modélise le système d'information d'un laboratoire de recherche fictif spécialisé dans l'architecture mondiale, inspiré d'institutions comme l'IPRAUS. L'objectif était d'appliquer la méthode **MERISE** de bout en bout, des règles de gestion jusqu'au script SQL exécutable, en passant par le MCD, le MLD et le MPD.

La base recense 35 monuments emblématiques, 20 architectes de nationalités variées, leurs styles, époques, matériaux, financements et usages.

**Cas d'usage typique :** un professeur d'histoire de l'art peut interroger la base pour préparer un cours — lister les monuments par style, calculer des statistiques de hauteur, explorer les collaborations entre architectes ou les sources de financement publiques et privées.

---

## Modélisation MERISE

### Associations notables

Le MCD contient plusieurs associations non triviales qui ont nécessité une réflexion approfondie :

**Association réflexive `collaborer`** sur `Architecte` : un architecte peut collaborer avec un ou plusieurs autres architectes. La contrainte `A_ID <> A_ID_1` empêche qu'un architecte collabore avec lui-même.

**Association réflexive `inspirer`** sur `OEuvre_Architecturale` : une œuvre peut en inspirer d'autres, créant un graphe de filiation entre monuments.

**Association ternaire `travailler`** entre `Architecte`, `OEuvre_Architecturale` et `Matériaux` : un architecte travaille sur une œuvre avec un matériau donné. Cette association à trois entités évite toute redondance et capture fidèlement la réalité.

---

## Structure de la base

14 tables issues de la modélisation :

**Entités :** `Architecte`, `OEuvre_Architecturale`, `Localisation`, `Style_architectural`, `Epoque`, `Matériaux`, `Caractéristique_esthétique`, `Financement`, `Méthode_de_reproduction`, `Usage_Oeuvre`

**Associations :** `travailler`, `appartenir`, `collaborer`, `inspirer`, `bénéficier`, `est_utilisée`, `reproduire`

---

## Contraintes d'intégrité

Les contraintes CHECK garantissent la cohérence des données :

```sql
-- La date de décès ne peut pas précéder la date de naissance
ALTER TABLE Architecte ADD CONSTRAINT CK_Architecte_Dates
CHECK (A_Date_de_naissance < A_Date_de_décès OR A_Date_de_décès IS NULL);

-- La hauteur d'une œuvre doit être réaliste
ALTER TABLE Caractéristique_esthétique ADD CONSTRAINT CK_Caractéristique_Hauteur
CHECK (C_Hauteur BETWEEN 1 AND 1000);

-- Un architecte ne peut pas collaborer avec lui-même
ALTER TABLE Collaborer ADD CONSTRAINT CK_Collaborer_Self
CHECK (A_ID <> A_ID_1);
```

---

## Exemples de requêtes avancées

```sql
-- Monuments financés uniquement par des sources publiques (NOT EXISTS)
SELECT O.OE_Nom FROM OEuvre_Architecturale AS O
JOIN bénéficier AS B ON O.OE_ID = B.OE_ID
WHERE NOT EXISTS (
    SELECT * FROM Financement AS F
    WHERE F.F_ID = B.F_ID AND F.F_Type <> 'Public'
);

-- Monuments dont la hauteur dépasse tous les monuments de style Baroque (ALL)
SELECT OE_ID, C_Hauteur FROM Caractéristique_esthétique
WHERE C_Hauteur > ALL (
    SELECT C_Hauteur FROM Caractéristique_esthétique CE
    JOIN appartenir AS Ap ON CE.OE_ID = Ap.OE_ID
    JOIN Style_architectural AS S ON Ap.S_ID = S.S_ID
    WHERE S.S_Nom = 'Baroque'
);

-- Hauteur moyenne des monuments par style
SELECT S.S_Nom, AVG(C.C_Hauteur) AS Hauteur_moyenne
FROM Caractéristique_esthétique AS C
JOIN appartenir AS A ON C.OE_ID = A.OE_ID
JOIN Style_architectural AS S ON A.S_ID = S.S_ID
GROUP BY S.S_Nom;
```

---

## Fichiers

| Fichier | Contenu |
|---|---|
| `1_creation.sql` | Création des 14 tables |
| `2_contraintes.sql` | Contraintes d'intégrité (CHECK) |
| `3_insertion.sql` | 35 monuments, 20 architectes, données complètes |
| `4_interrogation.sql` | 19 requêtes d'interrogation |
| `MCD.loo` | Modèle Conceptuel de Données (Looping) |
| `CompteRendu_ProjetBD.pdf` | Compte rendu complet |

---

## Lancer le projet

```bash
mysql -u root -p -e "CREATE DATABASE architecture_db;"
mysql -u root -p architecture_db < 1_creation.sql
mysql -u root -p architecture_db < 2_contraintes.sql
mysql -u root -p architecture_db < 3_insertion.sql
mysql -u root -p architecture_db < 4_interrogation.sql
```

---

## Technologies

- **SGBD :** MySQL
- **Méthode :** MERISE (MCD → MLD → MPD)
- **Outil MCD :** Looping

---

## Ce que j'ai appris

- **La méthode MERISE de bout en bout** : partir des règles de gestion métier pour construire un MCD, en déduire le MLD, puis le MPD. Comprendre que chaque décision de modélisation (entité vs attribut, association binaire vs ternaire) a des conséquences directes sur la qualité et la cohérence de la base.

- **Concevoir des associations complexes** : les associations réflexives (`collaborer`, `inspirer`) et l'association ternaire (`travailler`) m'ont forcée à raisonner sur la sémantique exacte des relations, au-delà des schémas classiques. Une association ternaire n'est pas juste "trois entités reliées", c'est un fait qui n'existe que lorsque les trois sont présentes simultanément.

- **Rédiger des requêtes SQL avancées** : la différence entre `NOT IN` et `NOT EXISTS`, l'opérateur `ALL` pour comparer à un ensemble, les sous-requêtes corrélées. Ces constructions permettent d'exprimer des questions métier précises que les jointures simples ne peuvent pas capturer.

- **Définir des contraintes d'intégrité** : comprendre que la qualité d'une base ne repose pas uniquement sur sa structure, mais sur les règles qui empêchent les données incohérentes d'y entrer. Une contrainte bien pensée vaut mieux qu'une dizaine de vérifications applicatives.

---

*Projet réalisé dans le cadre de la formation Ingénieur – EFREI Paris, 2025-2026.*