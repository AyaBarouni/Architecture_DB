CREATE TABLE Architecte (
   A_ID INT,
   A_Nom VARCHAR(50) NOT NULL,
   A_Prénom VARCHAR(50) NOT NULL,
   A_Date_de_naissance DATE,
   A_Date_de_décès DATE,
   A_Nationalité VARCHAR(50),
   PRIMARY KEY (A_ID)
);

CREATE TABLE Matériaux (
   M_ID INT,
   M_Nom VARCHAR(50) NOT NULL,
   ID_Indice_de_durabilité INT,
   PRIMARY KEY (M_ID)
);

CREATE TABLE Style_architectural (
   S_ID INT,
   S_Nom VARCHAR(50) NOT NULL,
   S_Origine VARCHAR(50),
   PRIMARY KEY (S_ID)
);

CREATE TABLE Epoque (
   E_ID INT,
   E_Nom VARCHAR(50) NOT NULL,
   E_Date_de_début DATE,
   E_Date_de_fin DATE,
   PRIMARY KEY (E_ID)
);

CREATE TABLE Localisation (
   L_ID INT,
   L_Ville VARCHAR(50) NOT NULL,
   L_Pays VARCHAR(50) NOT NULL,
   L_Coordonnées_latitude DECIMAL(15,6),
   L_Coordonnées_Longitude DECIMAL(15,6),
   PRIMARY KEY (L_ID)
);

CREATE TABLE Méthode_de_reproduction (
   MR_ID INT,
   MR_Nom VARCHAR(50) NOT NULL,
   MR_Type VARCHAR(50),
   MR_Niveau_de_détail VARCHAR(50),
   MR_Durée INT,
   MR_Coût DECIMAL(15,2),
   PRIMARY KEY (MR_ID)
);

CREATE TABLE Usage_Oeuvre (
   U_ID INT,
   U_Type VARCHAR(50) NOT NULL,
   PRIMARY KEY (U_ID)
);

CREATE TABLE Financement (
   F_ID INT,
   F_Source VARCHAR(50),
   F_Type VARCHAR(50),
   F_Coût DECIMAL(15,2),
   PRIMARY KEY (F_ID)
);

CREATE TABLE OEuvre_Architecturale (
   OE_ID INT,
   OE_Nom VARCHAR(50) NOT NULL,
   OE_Date_début_construction DATE,
   OE_Date_fin_construction DATE,
   OE_Etat VARCHAR(50),
   L_ID INT NOT NULL,
   PRIMARY KEY (OE_ID),
   FOREIGN KEY (L_ID) REFERENCES Localisation(L_ID)
);

CREATE TABLE Caractéristique_esthétique (
   OE_ID INT,
   C_ID INT,
   C_Hauteur DECIMAL(15,2),
   C_Palette_de_couleur VARCHAR(50),
   C_Ornement VARCHAR(50),
   C_Largeur DECIMAL(15,2),
   PRIMARY KEY (OE_ID, C_ID),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID)
);

CREATE TABLE collaborer (
   A_ID INT,
   A_ID_1 INT,
   PRIMARY KEY (A_ID, A_ID_1),
   FOREIGN KEY (A_ID) REFERENCES Architecte(A_ID),
   FOREIGN KEY (A_ID_1) REFERENCES Architecte(A_ID)
);

CREATE TABLE appartenir (
   OE_ID INT,
   S_ID INT,
   E_ID INT,
   PRIMARY KEY (OE_ID, S_ID, E_ID),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID),
   FOREIGN KEY (S_ID) REFERENCES Style_architectural(S_ID),
   FOREIGN KEY (E_ID) REFERENCES Epoque(E_ID)
);

CREATE TABLE est_utilisée (
   OE_ID INT,
   U_ID INT,
   PRIMARY KEY (OE_ID, U_ID),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID),
   FOREIGN KEY (U_ID) REFERENCES Usage_Oeuvre(U_ID)
);

CREATE TABLE inspirer (
   OE_ID INT,
   OE_ID_1 INT,
   PRIMARY KEY (OE_ID, OE_ID_1),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID),
   FOREIGN KEY (OE_ID_1) REFERENCES OEuvre_Architecturale(OE_ID)
);

CREATE TABLE reproduire (
   OE_ID INT,
   MR_ID INT,
   PRIMARY KEY (OE_ID, MR_ID),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID),
   FOREIGN KEY (MR_ID) REFERENCES Méthode_de_reproduction(MR_ID)
);

CREATE TABLE bénéficier (
   OE_ID INT,
   F_ID INT,
   PRIMARY KEY (OE_ID, F_ID),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID),
   FOREIGN KEY (F_ID) REFERENCES Financement(F_ID)
);

CREATE TABLE travailler (
   A_ID INT,
   OE_ID INT,
   M_ID INT,
   PRIMARY KEY (A_ID, OE_ID, M_ID),
   FOREIGN KEY (A_ID) REFERENCES Architecte(A_ID),
   FOREIGN KEY (OE_ID) REFERENCES OEuvre_Architecturale(OE_ID),
   FOREIGN KEY (M_ID) REFERENCES Matériaux(M_ID)
);