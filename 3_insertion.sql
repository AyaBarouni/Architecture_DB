-- =================================================
-- 1. Table Architecte (20 architectes)
-- =================================================

INSERT INTO Architecte (A_ID, A_Nom, A_Prénom, A_Date_de_naissance, A_Date_de_décès, A_Nationalité) VALUES
(1, 'Le Corbusier', 'Charles-Édouard Jeanneret-Gris', '1887-10-06', '1965-08-27', 'Suisse'),
(2, 'Eiffel', 'Gustave', '1832-12-15', '1923-12-27', 'Française'),
(3, 'Hadid', 'Zaha', '1950-10-31', '2016-03-31', 'Irakienne'),
(4, 'Gehry', 'Frank', '1929-02-28', NULL, 'Américaine'),
(5, 'Foster', 'Norman', '1935-06-01', NULL, 'Britannique'),
(6, 'Piano', 'Renzo', '1937-09-14', NULL, 'Italien'),
(7, 'Nouvel', 'Jean', '1945-08-12', NULL, 'Française'),
(8, 'Ando', 'Tadao', '1941-09-13', NULL, 'Japonaise'),
(9, 'Calatrava', 'Santiago', '1951-07-28', NULL, 'Espagnole'),
(10, 'I. M. Pei', 'Ieoh Ming', '1917-04-26', '2019-05-16', 'Chinoise'),
(11, 'Niemeyer', 'Oscar', '1907-12-15', '2012-12-05', 'Brésilienne'),
(12, 'Gaudí', 'Antoni', '1852-06-25', '1926-06-10', 'Espagnole'),
(13, 'Sullivan', 'Louis', '1856-09-03', '1924-04-14', 'Américaine'),
(14, 'Meier', 'Richard', '1934-10-12', NULL, 'Américaine'),
(15, 'Koolhaas', 'Rem', '1944-11-17', NULL, 'Néerlandaise'),
(16, 'Bjarke Ingels', 'Bjarke', '1974-10-02', NULL, 'Danoise'),
(17, 'Herzog & de Meuron', 'Jacques Herzog et Pierre de Meuron', '1950-04-19', NULL, 'Suisse'),
(18, 'David Chipperfield', 'David', '1953-12-18', NULL, 'Britannique'),
(19, 'Mario Botta', 'Mario', '1943-04-01', NULL, 'Suisse'),
(20, 'Jean-Michel Wilmotte', 'Jean-Michel', '1948-02-29', NULL, 'Française');

-- =================================================
-- 2. Table Matériaux
-- =================================================

INSERT INTO Matériaux (M_ID, M_Nom, ID_Indice_de_durabilité) VALUES
(1,'Béton',8),
(2,'Verre',7),
(3,'Acier',9),
(4,'Pierre',10),
(5,'Bois',6),
(6,'Brique',8),
(7,'Marbre',10),
(8,'Aluminium',7),
(9,'Plastique',4),
(10,'Cuivre',9);

-- =================================================
-- 3. Table Style_architectural
-- =================================================

INSERT INTO Style_architectural (S_ID, S_Nom, S_Origine) VALUES
(1, 'Modernisme', 'Europe'),
(2, 'Art Déco', 'Europe'),
(3, 'Baroque', 'Europe'),
(4, 'Gothique', 'Europe'),
(5, 'Renaissance', 'Europe'),
(6, 'Néoclassicisme', 'Europe'),
(7, 'Minimalisme', 'Europe'),
(8, 'Futurisme', 'International'),
(9, 'Brutalisme', 'International'),
(10, 'Déconstructivisme', 'Europe');

-- =================================================
-- 4. Table Epoque
-- =================================================

INSERT INTO Epoque (E_ID, E_Nom, E_Date_de_début, E_Date_de_fin) VALUES
(1,'Antiquité','0000-01-01','0500-12-31'),
(2,'Moyen Âge','0500-01-01','1500-12-31'),
(3,'Renaissance','1500-01-01','1700-12-31'),
(4,'Baroque','1600-01-01','1750-12-31'),
(5,'Néoclassicisme','1750-01-01','1850-12-31'),
(6,'Révolution Industrielle','1800-01-01','1900-12-31'),
(7,'Modernisme','1900-01-01','1950-12-31'),
(8,'Postmodernisme','1950-01-01','2000-12-31'),
(9,'Contemporain','2000-01-01',NULL);

-- =================================================
-- 5. Table Localisation
-- =================================================
INSERT INTO Localisation (L_ID, L_Ville, L_Pays, L_Coordonnées_latitude, L_Coordonnées_Longitude) VALUES
(1, 'Paris', 'France', 48.858844, 2.294351),
(2, 'Londres', 'Royaume-Uni', 51.507351, -0.127758),
(3, 'New York', 'États-Unis', 40.712776, -74.005974),
(4, 'Tokyo', 'Japon', 35.676192, 139.650311),
(5, 'Berlin', 'Allemagne', 52.520008, 13.404954),
(6, 'Rome', 'Italie', 41.902782, 12.496366),
(7, 'Barcelone', 'Espagne', 41.403629, 2.174356),
(8, 'Los Angeles', 'USA', 34.052235, -118.243683),
(9, 'Shanghai', 'Chine', 31.230416, 121.473701),
(10, 'Moscou', 'Russie', 55.755825, 37.617298),
(11, 'Sydney', 'Australie', -33.856784, 151.215297),
(12, 'Rio de Janeiro', 'Brésil', -22.906847, -43.172896),
(13, 'Le Caire', 'Égypte', 30.044420, 31.235712),
(14, 'Istanbul', 'Turquie', 41.008238, 28.978359),
(15, 'Athènes', 'Grèce', 37.983810, 23.727539),
(16, 'Buenos Aires', 'Argentine', -34.603684, -58.381559),
(17, 'Mexico', 'Mexique', 19.432608, -99.133209),
(18, 'Lagos', 'Nigeria', 6.524379, 3.379206),
(19, 'Mumbai', 'Inde', 19.076090, 72.877426),
(20, 'Bangkok', 'Thaïlande', 13.756331, 100.501762),
(21, 'Jakarta', 'Indonésie', -6.208763, 106.845599),
(22, 'Lisbonne', 'Portugal', 38.722252, -9.139337),
(23, 'Florence', 'Italie', 43.769562, 11.255814),
(24, 'Paris', 'France', 48.860611, 2.352222),
(25, 'Chicago', 'USA', 41.878876, -87.635915),
(26, 'Brasilia', 'Brésil', -15.794229, -47.882166),
(27, 'Barcelona', 'Espagne', 41.391640, 2.164900),
(28, 'Berlin', 'Allemagne', 52.521500, 13.403000),
(29, 'Paris', 'France', 48.861111, 2.336111),
(30, 'Chicago', 'USA', 41.879500, -87.634500),
(31, 'Brasilia', 'Brésil', -15.795500, -47.883500),
(32, 'Barcelona', 'Espagne', 41.414500, 2.152000),
(33, 'Dubai', 'Émirats Arabes Unis', 25.197197, 55.274376),
(34, 'Singapour', 'Singapour', 1.283333, 103.860000),
(35, 'Sydney', 'Australie', -33.857500, 151.216000);

-- =================================================
-- 6. Table Œuvre Architecturale
-- =================================================

INSERT INTO OEuvre_Architecturale (OE_ID, OE_Nom, OE_Date_début_construction, OE_Date_fin_construction, OE_Etat, L_ID) VALUES
(1,'Tour Eiffel','1887-01-28','1889-03-31','Bon',1),
(2,'Tower Bridge','1886-04-21','1894-06-30','Bon',2),
(3,'Empire State Building','1930-03-17','1931-05-01','Excellent',3),
(4,'Tokyo Skytree','2008-07-14','2012-02-29','Neuf',4),
(5,'Reichstag','1884-06-01','1894-06-05','Restaurée',5),
(6,'Colisée','0072-01-01','0080-12-31','En ruine',6),
(7,'Sagrada Familia','1882-03-19',NULL,'En restauration',7),
(8,'Walt Disney Concert Hall','1999-06-25','2003-10-24','Excellent',8),
(9,'Shanghai Tower','2008-11-29','2015-09-06','Excellent',9),
(10,'Saint-Basile','1555-01-01','1561-12-31','Mauvais',10),
(11,'Sydney Opera House','1959-03-02','1973-10-20','Bon',11),
(12,'Christ the Redeemer','1922-03-04','1931-10-12','Moyen',12),
(13,'Pyramide de Khéops','1560-01-01','1580-01-01','En ruine',13),
(14,'Sainte-Sophie','532-02-23','537-12-27','Restaurée',14),
(15,'Parthénon','0432-01-01','0447-01-01','En ruine',15),
(16,'Teatro Colón','1889-05-01','1908-05-25','En restauration',16),
(17,'Cathédrale Métropolitaine','1573-02-15','1813-09-08','Moyen',17),
(18,'National Theatre','1976-01-01','1976-12-31','Bon',18),
(19,'Chhatrapati Shivaji Terminus','1878-01-01','1888-01-01','Moyen',19),
(20,'Grand Palais','1897-01-01','1900-12-31','Bon',20),
(21,'Monas','1961-08-17','1975-08-17','Bon',21),
(22,'Tour de Belém','1515-01-01','1519-01-01','En ruine',22),
(23,'Cathédrale Santa Maria del Fiore','1296-08-09','1436-03-25','Restaurée',23),
(24,'Centre Pompidou','1971-01-01','1977-01-31','Excellent',24),
(25,'Tribune Tower','1923-10-01','1925-09-30','Bon',25),
(26,'Palais du Planalto','1959-05-21','1960-04-21','Bon',26),
(27,'Casa Batlló','1904-01-01','1906-12-31','Moyen',27),
(28,'Jewish Museum Berlin','1989-06-01','2001-09-09','Excellent',28),
(29,'Louvre','1190-01-01','1989-10-12','Restaurée',29),
(30,'Willis Tower','1970-08-16','1973-05-03','Bon',30),
(31,'Cathédrale de Brasilia','1958-02-12','1970-05-31','Bon',31),
(32,'Parc Güell','1900-03-01','1914-12-01','Moyen',32),
(33,'Burj Khalifa','2004-01-06','2010-01-04','Neuf',33),
(34,'Marina Bay Sands','2007-04-14','2010-06-23','Neuf',34),
(35,'Sydney Opera House','1959-03-02','1973-10-20','Excellent',35);

-- =================================================
-- 7. Table Caractéristique_esthétique
-- =================================================

INSERT INTO Caractéristique_esthétique (OE_ID, C_ID, C_Hauteur, C_Palette_de_couleur, C_Ornement, C_Largeur) VALUES
(1,1,324,'Gris','Tour métallique',125),
(2,2,65,'Gris','Pont à bascule',30),
(3,3,381,'Gris clair','Art déco',187),
(4,4,634,'Blanc','Structure TV',60),
(5,5,98,'Beige','Colonnes',135),
(6,6,48,'Pierre','Amphithéâtre',188),
(7,7,172,'Ocre','Façade sculptée',90),
(8,8,72,'Argenté','Courbes',60),
(9,9,632,'Gris','Torsade',128),
(10,10,47,'Coloré','Coupoles',55),
(11,11,65,'Blanc','Voiles',180),
(12,12,30,'Blanc','Christ géant',28),
(13,13,146,'Beige','Pyramide',230),
(14,14,55,'Blanc et Or','Mosaïque',82),
(15,15,13,'Marbre','Colonnes',30),
(16,16,80,'Rouge','Décor',30),
(17,17,67,'Gris','Colonnes',60),
(18,18,30,'Beige','Théâtre',40),
(19,19,37,'Brun','Style victorien',30),
(20,20,45,'Blanc','Sculptures',70),
(21,21,132,'Blanc','Obélisque',30),
(22,22,30,'Gris','Tours',30),
(23,23,114,'Rouge et blanc','Dôme',90),
(24,24,42,'Blanc et bleu','Escaliers',50),
(25,25,141,'Gris','Flèches',55),
(26,26,65,'Blanc','Colonnes',50),
(27,27,35,'Bleu et vert','Façade',20),
(28,28,25,'Gris','Triangles',25),
(29,29,35,'Beige','Pyramides',100),
(30,30,442,'Noir','Tours',90),
(31,31,40,'Blanc','Vitres',40),
(32,32,17,'Vert et jaune','Façade',30),
(33,33,828,'Gris et bleu','Torsade',200),
(34,34,200,'Beige et vert','Skypark',120),
(35,35,65,'Blanc','Voiles',180);

-- =================================================
-- 8. Table travailler
-- =================================================

INSERT INTO travailler (A_ID, OE_ID, M_ID) VALUES
(1,1,3),
(1,1,1),
(2,2,3),
(2,2,6),
(3,4,1),
(3,4,2),
(4,8,1),
(4,8,2),
(5,5,4),
(5,5,3),
(6,9,1),
(6,9,2),
(7,24,1),
(7,24,2),
(8,11,1),
(8,11,2),
(9,10,4),
(10,30,3),
(11,12,2),
(12,7,6),
(12,7,4),
(13,25,3),
(14,28,1),
(15,32,1),
(16,34,1),
(17,33,3),
(18,31,1),
(19,26,1),
(20,29,4);

-- =================================================
-- 9. Table Méthode_de_reproduction
-- =================================================

INSERT INTO Méthode_de_reproduction (MR_ID, MR_Nom, MR_Type, MR_Niveau_de_détail, MR_Durée, MR_Coût) VALUES
(1,'Impression 3D','Physique','Très détaillé',360,50000),
(2,'Scan laser','Numérique','Ultra précis',120,20000),
(3,'Modélisation 3D','Numérique','Précis',240,15000),
(4,'Maquette physique','Hybride','Détaillé',180,10000),
(5,'Photogrammétrie','Numérique','Moyen',60,5000);

-- =================================================
-- 10. Table Financement
-- =================================================

INSERT INTO Financement (F_ID, F_Source, F_Type, F_Coût) VALUES
(1,'État Français','Public',700000),
(2,'Fondation Getty','Privé',500000),
(3,'Union Européenne','International',300000),
(4,'Crowdfunding','Participatif',200000),
(5,'Propriétaire privé','Auto-financement',150000),
(6,'Banque Mondiale','Mixte',400000);

-- =================================================
-- 11. Table Usage_Oeuvre
-- =================================================

INSERT INTO Usage_Oeuvre (U_ID, U_Type) VALUES
(1,'Tourisme'),
(2,'Religieux'),
(3,'Bureaux'),
(4,'Résidentiel'),
(5,'Culturel'),
(6,'Transport');

-- =================================================
-- 12. Table appartenir
-- =================================================

INSERT INTO appartenir (OE_ID, S_ID, E_ID) VALUES
(1,1,7),
(2,6,6),
(3,2,7),
(4,10,9),
(5,6,6),
(6,5,1),
(7,1,7),
(8,10,8),
(9,8,9),
(10,3,4),
(11,7,8),
(12,3,4),
(13,5,1),
(14,3,2),
(15,4,2),
(16,5,3),
(17,6,5),
(18,1,7),
(19,6,6),
(20,3,4),
(21,1,8),
(22,6,5),
(23,5,3),
(24,10,8),
(25,2,7),
(26,1,7),
(27,2,7),
(28,10,8),
(29,6,5),
(30,1,7),
(31,1,8),
(32,2,7),
(33,8,9),
(34,10,9),
(35,7,8);

-- =================================================
-- 13. Table collaborer
-- =================================================

INSERT INTO collaborer (A_ID, A_ID_1) VALUES
(12,7),
(1,4),
(3,16);

-- =================================================
-- 14. Table reproduire
-- =================================================

INSERT INTO reproduire (OE_ID, MR_ID) VALUES
(1,2),
(2,4),
(3,3),
(4,1),
(5,4),
(6,4),
(7,1),
(8,3),
(9,2),
(10,5),
(11,4),
(12,3),
(13,4),
(14,2),
(15,4),
(16,3),
(17,4),
(18,5),
(19,4),
(20,3),
(21,1),
(22,4),
(23,4),
(24,3),
(25,2),
(26,4),
(27,4),
(28,3),
(29,2),
(30,1),
(31,4),
(32,3),
(33,1),
(34,3),
(35,4);

-- =================================================
-- 15. Table bénéficier
-- =================================================

INSERT INTO bénéficier (OE_ID, F_ID) VALUES
(1,1),(1,2),(1,3),
(2,1),
(3,2),(3,3),
(4,4),
(5,1),(5,6),
(6,1),
(7,2),(7,4),
(8,2),(8,3),
(9,3),
(10,1),
(11,2),
(12,5),
(13,1),
(14,1),
(15,1),
(16,2),
(17,6),
(18,1),
(19,2),
(20,3),
(21,1),
(22,1),
(23,1),
(24,3),
(25,2),
(26,6),
(27,2),
(28,3),
(29,1),
(30,2),
(31,1),
(32,2),
(33,3),
(34,3),
(35,2);

-- =================================================
-- 16. Table Est_utilisée
-- =================================================

INSERT INTO est_utilisée (OE_ID, U_ID) VALUES
(1,1),(2,6),(3,3),(4,3),(5,3),(6,2),(7,2),(8,5),(9,3),(10,2),
(11,5),(12,2),(13,2),(14,2),(15,2),(16,5),(17,2),(18,5),(19,6),(20,5),
(21,5),(22,2),(23,2),(24,5),(25,3),(26,3),(27,2),(28,5),(29,5),(30,3),
(31,2),(32,5),(33,3),(34,5),(35,5);

-- =================================================
-- 17. Table inspirer
-- =================================================

INSERT INTO inspirer (OE_ID, OE_ID_1) VALUES
(3,1),(4,3),(8,4),(30,3),(34,33),(32,27),(24,23);
