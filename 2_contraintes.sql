ALTER TABLE Architecte
ADD CONSTRAINT CK_Architecte_Dates CHECK (
    A_Date_de_naissance < A_Date_de_décès OR A_Date_de_décès IS NULL
);

ALTER TABLE Epoque
ADD CONSTRAINT CK_Epoque_Dates CHECK (
    E_Date_de_début < E_Date_de_fin
);

ALTER TABLE OEuvre_Architecturale
ADD CONSTRAINT CK_OEuvre_Etat_Terminé CHECK (
    (OE_Etat <> 'Terminée') OR (OE_Date_fin_construction IS NOT NULL)
);

ALTER TABLE Caractéristique_esthétique
ADD CONSTRAINT CK_Caractéristique_Positive CHECK (
    C_Hauteur > 0 AND C_Largeur > 0
);

ALTER TABLE Caractéristique_esthétique
ADD CONSTRAINT CK_Caractéristique_Hauteur CHECK (
    C_Hauteur BETWEEN 1 AND 1000
);

ALTER TABLE Matériaux
ADD CONSTRAINT CK_Matériaux_Durabilité CHECK (
    ID_Indice_de_durabilité BETWEEN 1 AND 10
);

ALTER TABLE Méthode_de_reproduction
ADD CONSTRAINT CK_Méthode_Validité CHECK (
    MR_Durée > 0 AND MR_Coût >= 0
);

ALTER TABLE Collaborer
ADD CONSTRAINT CK_Collaborer_Self CHECK (
    A_ID <> A_ID_1
);
