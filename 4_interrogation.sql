-- 1. Liste des monuments de style Modernisme ainsi que de leur état actuel
SELECT OE_Nom, OE_Etat FROM OEuvre_Architecturale AS O
JOIN appartenir AS A ON O.OE_ID = A.OE_ID
JOIN Style_architectural AS S ON A.S_ID = S.S_ID
WHERE S.S_Nom = 'Modernisme'

-- 2. Liste des monuments dont la construction a débutée entre 1900 et 2000
SELECT OE_Nom, OE_Date_début_construction FROM OEuvre_Architecturale
WHERE OE_Date_début_construction BETWEEN '1900-01-01' AND '2000-12-31';

-- 3. Liste des monuments situés à Paris ou Londres
SELECT OE_Nom, L_Ville FROM OEuvre_Architecturale AS O
JOIN Localisation AS L ON O.L_ID = L.L_ID
WHERE L.L_Ville IN ('Paris', 'Londres');

-- 4. Liste des architectes encore vivants à l'heure actuelle ainsi que de leur nationnalité
SELECT A_Nom, A_Prénom, A_Nationalité FROM Architecte
WHERE A_Date_de_décès IS NULL;

-- 5. Hauteur moyenne des monuments par style
SELECT S.S_Nom, AVG(C.C_Hauteur) AS Hauteur_moyenne FROM Caractéristique_esthétique AS C
JOIN appartenir AS A ON C.OE_ID = A.OE_ID
JOIN Style_architectural AS S ON A.S_ID = S.S_ID
GROUP BY S.S_Nom;

-- 6. Nombre de monuments par pays
SELECT L.L_Pays, COUNT(*) AS Nb_Monuments FROM OEuvre_Architecturale AS O
JOIN Localisation AS L ON O.L_ID = L.L_ID
GROUP BY L.L_Pays;

-- 7. Monuments financés par plus d’une source
SELECT O.OE_Nom AS Nom_Oeuvre, COUNT(B.F_ID) AS Nb_sources FROM bénéficier AS B
JOIN OEuvre_Architecturale AS O ON B.OE_ID = O.OE_ID
GROUP BY O.OE_Nom
HAVING COUNT(B.F_ID) > 1;

-- 8. Coût total des financements par type de financement
SELECT F_Type, SUM(F_Coût) AS Total_financement FROM Financement
GROUP BY F_Type;

-- 9. Hauteur maximale d'oeuvre architecturale par matériau principal
SELECT M.M_Nom, MAX(C.C_Hauteur) AS Hauteur_max FROM travailler AS T
JOIN Matériaux AS M ON T.M_ID = M.M_ID
JOIN Caractéristique_esthétique AS C ON T.OE_ID = C.OE_ID
GROUP BY M.M_Nom;

-- 10. Liste des monuments et leurs architectes
SELECT O.OE_Nom, A.A_Nom, A.A_Prénom FROM OEuvre_Architecturale AS O
JOIN Travailler AS T ON O.OE_ID = T.OE_ID
JOIN Architecte AS A ON T.A_ID = A.A_ID;

-- 11. Liste des monuments avec leur style et leur époque
SELECT O.OE_Nom, S.S_Nom AS Style, E.E_Nom AS Epoque FROM OEuvre_Architecturale AS O
JOIN appartenir AS Ap ON O.OE_ID = Ap.OE_ID
JOIN Style_architectural AS S ON Ap.S_ID = S.S_ID
JOIN Epoque AS E ON Ap.E_ID = E.E_ID;

-- 12. Liste des monuments et de leurs matériaux
SELECT O.OE_Nom, M.M_Nom AS Materiau FROM OEuvre_Architecturale AS O
JOIN Travailler AS T ON O.OE_ID = T.OE_ID
JOIN Matériaux AS M ON T.M_ID = M.M_ID;

-- 13. Liste de tous les monuments avec leur usage
SELECT O.OE_Nom, U.U_Type FROM OEuvre_Architecturale AS O
LEFT JOIN est_utilisée AS EU ON O.OE_ID = EU.OE_ID
LEFT JOIN Usage_Oeuvre AS U ON EU.U_ID = U.U_ID;

-- 14. Architectes ayant collaboré avec d’autres
SELECT A1.A_Nom AS Architecte1, A2.A_Nom AS Architecte2 FROM Collaborer AS C
JOIN Architecte A1 ON C.A_ID = A1.A_ID
JOIN Architecte A2 ON C.A_ID_1 = A2.A_ID;

-- 15. Monuments dont la hauteur est supérieure à la moyenne
SELECT O.OE_Nom AS Nom_Oeuvre, C.C_Hauteur FROM Caractéristique_esthétique AS C
JOIN OEuvre_Architecturale AS O ON C.OE_ID = O.OE_ID
WHERE C.C_Hauteur > (SELECT AVG(C_Hauteur) FROM Caractéristique_esthétique);

-- 16. Architectes qui n’ont jamais utilisé le matériau Acier
SELECT A_Nom FROM Architecte
WHERE A_ID NOT IN (SELECT A_ID FROM Travailler WHERE M_ID = '3');

-- 17. Monuments financés uniquement par des sources publiques
SELECT O.OE_Nom AS Nom_Oeuvre
FROM OEuvre_Architecturale AS O
JOIN bénéficier AS B ON O.OE_ID = B.OE_ID
WHERE NOT EXISTS (SELECT * FROM Financement AS F
WHERE F.F_ID = B.F_ID AND F.F_Type <> 'Public'
);

-- 18. Monuments inspirés uniquement par l'oeuvre architecturale d'ID égal à 1
SELECT OE_ID FROM inspirer
WHERE OE_ID_1 = '1';

-- 19. Monuments dont la hauteur est supérieure à tous les monuments de style Baroque
SELECT OE_ID, C_Hauteur FROM Caractéristique_esthétique
WHERE C_Hauteur > ALL (SELECT C_Hauteur FROM Caractéristique_esthétique CE
JOIN appartenir AS Ap ON CE.OE_ID = Ap.OE_ID
JOIN Style_architectural AS S ON Ap.S_ID = S.S_ID
WHERE S.S_Nom = 'Baroque');