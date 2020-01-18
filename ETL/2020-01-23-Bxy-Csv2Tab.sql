-- ===============================================================================
-------- Universit� Sorbonne Paris Cit�, Universit� Paris 13 , Institut Gali�e
-------- Master 2 (M2 EID2), Informatique, Ing�nieur
-------- Exploration Informatique des Donn�es et D�cisionnel
-- ===============================================================================
-------- La Data ; The Data
-------- La Donn�e est le monde du futur ; Les donn�es et le monde de l'avenir
-------- The Data is the world of the future ;  The Data and the future's world

-------- DATA -->>> Big Data, Dark Data, Open Data, ... 
-- ===============================================================================
-------- Bases de Donn�es Avanc�es = Advanced Databases (BDA)

-------- Bases de Donn�es = Databases (BD, DB)
-------- BD + BD + ... + BD = BD ! Big Data 

-------- Entrep�ts de Donn�es = Data Warehouses (DWH, EDON)
-------- Lacs de Donn�es = Data Lakes (LD, DL)
-------- Donn�es de r�f�rence = Master Data

-------- Directeur :  Dr. M. Faouzi Boufar�s (MFB)
-------- Enseignant-Chercheur Responsable      

-------- Page Web : http://www.lipn.univ-paris13.fr/~boufares

-- ==========================================================================================
-- ======= MFB = From a CSV file TO a TABLE with columns ! ==================================

-- ==========================================================================================
-- Jeudi 12 d�cembre 2019 --->>>>>> Jeudi 23 janvier 2020
-- Binome num�ro : Bxy
-- NOM1 Pr�nom 1 :
-- NOM2 Pr�nom 2 :
-- ==========================================================================================

-- ==========================================================================================
-- ======= MFB = From a CSV file TO a TABLE with columns ! ==================================

-- >>>>>>>>>> FROM CSV TO Table-Columns

-- >>>>>>>>>> Csv2Tab Csv2Tab Csv2Tab Csv2Tab *** Csv2Tab Csv2Tab Csv2Tab Csv2Tab

-- >>>>>>>>>> A LA DECOUVERTE DES ANOMALIES ! -- >>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!!!! !==
-- ==========================================================================================

/*

Les donn�es dans les fichiers CSV peuvent contenir plusieurs anomalies � cause de 
l'h�t�rog�n�it� des sources et des outils utilis�s !

Plusieurs types d'anomalies existent dans ces donn�es!

Plusieurs actions de nettoyages (Data Cleaning) sont n�cessaires telles que :
- l'homog�n�isation et la standardisation
- la d�tection de certaines anoamlies (intracolonne, intercolonnes et interlignes
- la correction de certaines anoamlies

Afin de mieux nettoyer les donn�es, il est n�cessaire de (re)-d�couvrir les m�ta-donn�es et leur s�mantique :
- le type syntaxique de chaque colonne
- le sens (la s�mantique) de chaque colonne
- le(s) liens s�mantiques �ventuels qui peuvent exister entre les colonnes
- les similarit�s �ventuelles (doubles et similaires) qui peuvent exsiter entre les lignes
 
Les fichiers, au format CSV, sont charg�s sous forme d'une table compos�e d'une seule colonne de type chaine de caract�res

-- La colonne Col sera d�compos�e en plusieurs colonnes (Col1, Col2, ...) de m�me type (chaine de caract�res)
-- Chaque colonne devra ensuite �tre typ�e selon son contenu majoritaire (STRING-CHAR-VARCHAR, NUMBER ou DATE)
-- Etc... A LA DECOUVERTE DES ANOMALIES !

*/

--==================================================================================================
-- DS : Data Sources
--==================================================================================================

/*
-- =================================================================================================
-- >>>>>>>>>>>>>>>> EXEMPLE 1 <<<<<<<<<<<<<<<<<<<<<<<<
-- =================================================================================================

-- >>>>>>>>>>>>>>>> CSVfile1

Adam;Paris;M;19;19-06-2001;38�C
Eve;Paris;F;23;16-10-1996;37�C
Gabriel;Paris;m;18;17-09-2002;36,5�C
Mariam;Paris;F;41;13-08-1978;38Celcius
Nadia;Londres;f;55;10-10-1965;95�F
In�s;Madrid;F;50;22-11-1969;99,5�F
Inconnu;77;12-12-2012
Abnomly;Rome;1;88;02-10-2019;38�C
Anomalies;Tunis;f;99;25-30-2020;x
Adam;Paris;M;19;19-06-2001;38�C
Eve;Paris;F;23;16-10-1996;37�C
Marie;Pari;F;41;17-09-1979;38Celcius

*/

CREATE TABLE CSVfile1 (Col VARCHAR2(1000));

INSERT INTO CSVfile1 VALUES ('Adam;Paris;M;19;19-06-2001;38�C');
INSERT INTO CSVfile1 VALUES ('Eve;Paris;F;23;16-10-1996;37�C');
INSERT INTO CSVfile1 VALUES ('Gabriel;Paris;m;18;17-09-2002;36,5�C');
INSERT INTO CSVfile1 VALUES ('Mariam;Paris;F;41;13-08-1978;38Celcius');
INSERT INTO CSVfile1 VALUES ('Nadia;Londres;f;55;10-10-1965;95�F');
INSERT INTO CSVfile1 VALUES ('In�s;Madrid;F;50;22-11-1969;99,5�F');
INSERT INTO CSVfile1 VALUES ('Inconnu;77;12-12-2012');
INSERT INTO CSVfile1 VALUES ('Abnomly;Rome;1;88;02-10-2019;38�C');
INSERT INTO CSVfile1 VALUES ('Anomalies;Tunis;f;99;25-30-2020;x');
INSERT INTO CSVfile1 VALUES ('Adam;Paris;M;19;19-06-2001;38�C');
INSERT INTO CSVfile1 VALUES ('Eve;Paris;F;23;16-10-1996;37�C');
INSERT INTO CSVfile1 VALUES ('Marie;Pari;F;41;17-09-1979;38Celcius');

COMMIT;

/*
-- =================================================================================================
-- >>>>>>>>>>>>>>>> EXEMPLE 2 <<<<<<<<<<<<<<<<<<<<<<<<
-- =================================================================================================

-- >>>>>>>>>>>>>>>> CSVfile2

Id01;Eve;PREMIER;19-ao�t-1988;eve.premier@labas.fr;2;F;40983,3 g;France;Europe;71,279;87.53�F;638,76 cm
Id02;Claire;SOLEIL;10-f�vrier-1965;claire.soleil@gmail.com;A-;F;44456,57 g;Itale;;62,623;35;$1
Id03;Rose;PARIS;20-ao�t-1974;rose.paris@gmail;A+;F;50723,21 g;S�n�gal;Afrique;105,304;102.42  �F;77
Id04;Mamadou;TROPFOR;10-02-1965;mamadou.tropfor@hotmail.com;1;M;91,11 KG;Qatar;Asie;10;26.93�C;10,96 m
Id05;Mamadou;DELOIN;19-08-1988;mamadou.deloin@gmail.com;B-;M;58,74 KG;Tunisie;Afrique;46;25;**
Id06;M�decin;PLUS BELLE;03-01-1975;m�decin.plus belle@gmail.com;A+;M;66,94 KG;Tunisie;Afrique;9;25;0
Id07;Ibrahim;SPORTIF;17-08-1969;ibrahim.sportif@gmail.com;B-;M;86,33 KG;Alg�rie;Afrique;33;41.44 �c;9,22 m
Id08;Kenza;MIGNONNE;18-mai-1960;kenza.mignonne@hotmail.com;2;F;63159,57 g;Br�sil;Am�rique;105,158;111.29�F;736,84 cm
Id09;In�s;TROPFOR;27-novembre-1999;in�s.tropfor@yahoo.fr;X;X;40983,3 g;Espagne;;93,323;91.1�F;77
Id10;Rayan;FORT;24-06-1995;rayan.fort@hotmail.com;AB;M;88,87 KG;Maroc;Afrique;74;26.26�C;20,97 m
Id11;Marie;FORT;06-ao�t-1974;marie.fort@yahoo;1;0;72425,34 g;Alg�rie;Afrique;60,732;87.53�F;476,25 cm
Id12;M�decin;PLUS BELLE;18-05-1960;m�decin.plus belle@hotmail.com;AB+;M;82,68 KG;Tunisie;Afrique;60;20.9�C;1
Id13;Omar;GRANDE;25-02-1995;omar.grande@yahoo.fr;A+;M;64,63 KG;Itale;;53;26.26�C;**
Id14;Adam;GRANDE;21-05-1969;adam.grande@hotmail.com;AB;M;66,94 KG;Espagne;;24;41.44 �c;13,28 m
Id15;Alain;AIMANT;21-01-1979;alain.aimant@gmail;B+;Y;64,54 KG;Chine;Asie;47;41.44 �c;13,28 m
Id16;Rayan;MIGNONNE;10-02-1965;rayan.mignonne@hotmail.com;A+;M;88,87 KG;Qatar;Asie;10;15.67�C;1
Id17;Faouzi;UNIQUE;27-11-1999;faouzi.unique@gmail.com;AB-;M;0;Belgique;Europe;62;25.32�Celcius;13,28 m
Id18;Fleurette;PREMIER;21-janvier-1979;fleurette.premier@hotmail.com;2;F;44456,57 g;Allemagne;Europe;135,238;119.05�F;679,87 cm
Id19;Sabrine;BON;25-f�vrier-1995;sabrine.bon@gmail.com;2;F;44456,57 g;France;Europe;136,181;114.03�F;713,41 cm
Id20;Maria;DELOIN;25-f�vrier-1995;maria.deloin@hotmail.com;AB;F;44456,57 g;Canada;Am�rique;131,203;102.42  �F;638,76 cm
Id21;Faouzi;EXCELLE;03-01-1975;faouzi.excelle@gmail.com;O-;M;93,88 KG;Canada;Am�rique;57;26.93�C;14,98 m
Id22;Marie;SPORTIF;20-ao�t-1974;marie.sportif@gmail.com;AB+;X;48710,39 g;Chine;Asie;41,529;35;644,34 cm
Id23;Eve;PARIS;03-janvier-1975;eve.paris@hotmail.com;X;F;42015,79 g;Tunisie;Afrique;28,967;102.42  �F;713,41 cm
Id24;Omar;CLEMENT;14-01-1978;omar.clement@yahoo.fr;AB+;M;64,54 KG;France;Europe;37;41.44 �c;12,95 m
Id25;Emna;JOLIE;17-ao�t-1969;emna.jolie@hotmail.com;B-;F;71214,11g;Itale;;41,249;114.03�F;713,41 cm
Id26;Ibrahim;PARIS;27-11-1993;ibrahim.paris@hotmail.com;-;M;58,74 KG;Tunisie;Afrique;59;41.44 �c;9,22 m
Id27;Cl�ment;TOUIL;27-11-1999;cl�ment.touil@hotmail.com;AB-;M;58,74 KG;Tunisie;Afrique;34;26.93�C;1
Id28;Jean;SPORTIF;27-11-1993;jean.sportif@hotmail.com;AB+;M;64,24 KG;France;;69;41.44 �c;12,94 m
Id29;Alain;MIGNONNE;10-02-1965;alain.mignonne@ici.tn;B-;M;0;Tunisie;Afrique;10;;1
Id30;M�decin;MOUSTAFA;19-08-1988;m�decin.moustafa@yahoo.fr;AB;M;64,54 KG;Maroc;Afrique;44;38.05�C;20,97 m
Id31;Cl�ment;MOUSTAFA;27-11-1993;cl�ment.moustafa@yahoo.fr;1;M;58,74 KG;France;;60;38.13�C;20,97 m
Id32;Mamadou;FORT;08-12-1982;mamadou.fort@gmail.com;A-;M;0;Maroc;Afrique;58;25;**
Id33;Emna;FORT;19-ao�t-1988;emna.fort@gmail.com;A+;F;65850,12 g;Maroc;Afrique;64,365;84.91�F;$1
Id34;Omar;PARIS;18-05-1960;omar.paris@gmail.com;AB-;M;64,63 KG;Malie;Afrique;73;26.93�C;**
Id35;Mamadou;CLEMENT;24-06-1995;mamadou.clement@hotmail.com;AB-;M;86,33 KG;Canada;Am�rique;50;38.05�C;12,95 m
Id36;Mamadou;SOLEIL;24-06-1995;mamadou.soleil@gmail;A;0;64,24 KG;Espagne;;44;38.05�C;2,39 m
Id37;Ibrahim;BELLE;08-12-1982;ibrahim.belle@gmail;A-;M;64,63 KG;France;Europe;12;20.9�C;12,94 m
Id38;Ibrahim;PLUS BELLE;08-09-1960;ibrahim.plus belle@hotmail.com;B+;0;64,24 KG;France;;9;25.04�C;0
Id39;Cl�ment;PRINTEMPS;27-11-1999;cl�ment.printemps@gmail.com;O+;M;93,88 KG;Alg�rie;Afrique;33;20.9�C;2,39 m
Id40;Claire;SPORTIF;24-juin-1995;claire.sportif@yahoo.fr;B+;F;72425,34 g;Tunisie;Afrique;121,929;119.05�F;428,03 cm
Id41;Eve;RAHMA;25-f�vrier-1995;eve.rahma@gmail.com;X;F;63282,34 g;Portugal;Europe;56,813;102.42  �F;0
Id42;Cl�mence;SPORTIF;30-avril-2000;cl�mence.sportif@yahoo.fr;B+;F;72425,34 g;Portugal;Europe;135,288;111.29�F;77
Id43;Jean;INFORME;17-08-1969;jean.informe@ici.tn;O-;Y;86,33 KG;S�n�gal;Afrique;71;;0
Id44;Jean;SOLEIL;05-06-1993;jean.soleil@hotmail.com;2;M;1;Canada;Am�rique;18;26.93�C;20,97 m
Id45;Ibrahim;TROPFOR;01-03-1967;ibrahim.tropfor@hotmail.com;A+;0;64,54 KG;Itale;;72;20.9�C;10,96 m
Id46;Faouzi;AIMANT;14-01-1978;faouzi.aimant@ici.tn;AB+;Y;0;Argentine;Am�rique;12;25.32�Celcius;2,39 m
Id47;Fleurette;UNIQUE;03-janvier-1975;fleurette.unique@gmail.com;AB+;F;71214,11g;Chine;Asie;146,323;111.29�F;644,34 cm
Id48;Jean;CLEMENT;25-02-1995;jean.clement@hotmail.com;O+;M;0;Alg�rie;Afrique;11;25.32�Celcius;10,96 m
Id49;Ibrahim;FORT;21-05-1969;ibrahim.fort@gmail.com;AB-;M;1;Malie;Afrique;33;25;10,96 m
Id50;Sabrine;EXCELLE;14-f�vrier-1966;sabrine.excelle@yahoo.fr;B-;F;44456,57 g;Portugal;Europe;64,008;91.1�F;644,34 cm

*/

CREATE TABLE CSVfile2 (Col VARCHAR2(1000));

INSERT INTO CSVFile2 VALUES ('Id01;Eve;PREMIER;19-ao�t-1988;eve.premier@labas.fr;2;F;40983,3 g;France;Europe;71,279;87.53�F;638,76 cm');
INSERT INTO CSVFile2 VALUES ('Id02;Claire;SOLEIL;10-f�vrier-1965;claire.soleil@gmail.com;A-;F;44456,57 g;Itale;;62,623;35;$1');
INSERT INTO CSVFile2 VALUES ('Id03;Rose;PARIS;20-ao�t-1974;rose.paris@gmail;A+;F;50723,21 g;S�n�gal;Afrique;105,304;102.42  �F;77');
INSERT INTO CSVFile2 VALUES ('Id04;Mamadou;TROPFOR;10-02-1965;mamadou.tropfor@hotmail.com;1;M;91,11 KG;Qatar;Asie;10;26.93�C;10,96 m');
INSERT INTO CSVFile2 VALUES ('Id05;Mamadou;DELOIN;19-08-1988;mamadou.deloin@gmail.com;B-;M;58,74 KG;Tunisie;Afrique;46;25;**');
INSERT INTO CSVFile2 VALUES ('Id06;M�decin;PLUS BELLE;03-01-1975;m�decin.plus belle@gmail.com;A+;M;66,94 KG;Tunisie;Afrique;9;25;0');
INSERT INTO CSVFile2 VALUES ('Id07;Ibrahim;SPORTIF;17-08-1969;ibrahim.sportif@gmail.com;B-;M;86,33 KG;Alg�rie;Afrique;33;41.44 �c;9,22 m');
INSERT INTO CSVFile2 VALUES ('Id08;Kenza;MIGNONNE;18-mai-1960;kenza.mignonne@hotmail.com;2;F;63159,57 g;Br�sil;Am�rique;105,158;111.29�F;736,84 cm');
INSERT INTO CSVFile2 VALUES ('Id09;In�s;TROPFOR;27-novembre-1999;in�s.tropfor@yahoo.fr;X;X;40983,3 g;Espagne;;93,323;91.1�F;77');
INSERT INTO CSVFile2 VALUES ('Id10;Rayan;FORT;24-06-1995;rayan.fort@hotmail.com;AB;M;88,87 KG;Maroc;Afrique;74;26.26�C;20,97 m');
INSERT INTO CSVFile2 VALUES ('Id11;Marie;FORT;06-ao�t-1974;marie.fort@yahoo;1;0;72425,34 g;Alg�rie;Afrique;60,732;87.53�F;476,25 cm');
INSERT INTO CSVFile2 VALUES ('Id12;M�decin;PLUS BELLE;18-05-1960;m�decin.plus belle@hotmail.com;AB+;M;82,68 KG;Tunisie;Afrique;60;20.9�C;1');
INSERT INTO CSVFile2 VALUES ('Id13;Omar;GRANDE;25-02-1995;omar.grande@yahoo.fr;A+;M;64,63 KG;Itale;;53;26.26�C;**');
INSERT INTO CSVFile2 VALUES ('Id14;Adam;GRANDE;21-05-1969;adam.grande@hotmail.com;AB;M;66,94 KG;Espagne;;24;41.44 �c;13,28 m');
INSERT INTO CSVFile2 VALUES ('Id15;Alain;AIMANT;21-01-1979;alain.aimant@gmail;B+;Y;64,54 KG;Chine;Asie;47;41.44 �c;13,28 m');
INSERT INTO CSVFile2 VALUES ('Id16;Rayan;MIGNONNE;10-02-1965;rayan.mignonne@hotmail.com;A+;M;88,87 KG;Qatar;Asie;10;15.67�C;1');
INSERT INTO CSVFile2 VALUES ('Id17;Faouzi;UNIQUE;27-11-1999;faouzi.unique@gmail.com;AB-;M;0;Belgique;Europe;62;25.32�Celcius;13,28 m');
INSERT INTO CSVFile2 VALUES ('Id18;Fleurette;PREMIER;21-janvier-1979;fleurette.premier@hotmail.com;2;F;44456,57 g;Allemagne;Europe;135,238;119.05�F;679,87 cm');
INSERT INTO CSVFile2 VALUES ('Id19;Sabrine;BON;25-f�vrier-1995;sabrine.bon@gmail.com;2;F;44456,57 g;France;Europe;136,181;114.03�F;713,41 cm');
INSERT INTO CSVFile2 VALUES ('Id20;Maria;DELOIN;25-f�vrier-1995;maria.deloin@hotmail.com;AB;F;44456,57 g;Canada;Am�rique;131,203;102.42  �F;638,76 cm');
INSERT INTO CSVFile2 VALUES ('Id21;Faouzi;EXCELLE;03-01-1975;faouzi.excelle@gmail.com;O-;M;93,88 KG;Canada;Am�rique;57;26.93�C;14,98 m');
INSERT INTO CSVFile2 VALUES ('Id22;Marie;SPORTIF;20-ao�t-1974;marie.sportif@gmail.com;AB+;X;48710,39 g;Chine;Asie;41,529;35;644,34 cm');
INSERT INTO CSVFile2 VALUES ('Id23;Eve;PARIS;03-janvier-1975;eve.paris@hotmail.com;X;F;42015,79 g;Tunisie;Afrique;28,967;102.42  �F;713,41 cm');
INSERT INTO CSVFile2 VALUES ('Id24;Omar;CLEMENT;14-01-1978;omar.clement@yahoo.fr;AB+;M;64,54 KG;France;Europe;37;41.44 �c;12,95 m');
INSERT INTO CSVFile2 VALUES ('Id25;Emna;JOLIE;17-ao�t-1969;emna.jolie@hotmail.com;B-;F;71214,11g;Itale;;41,249;114.03�F;713,41 cm');
INSERT INTO CSVFile2 VALUES ('Id26;Ibrahim;PARIS;27-11-1993;ibrahim.paris@hotmail.com;-;M;58,74 KG;Tunisie;Afrique;59;41.44 �c;9,22 m');
INSERT INTO CSVFile2 VALUES ('Id27;Cl�ment;TOUIL;27-11-1999;cl�ment.touil@hotmail.com;AB-;M;58,74 KG;Tunisie;Afrique;34;26.93�C;1');
INSERT INTO CSVFile2 VALUES ('Id28;Jean;SPORTIF;27-11-1993;jean.sportif@hotmail.com;AB+;M;64,24 KG;France;;69;41.44 �c;12,94 m');
INSERT INTO CSVFile2 VALUES ('Id29;Alain;MIGNONNE;10-02-1965;alain.mignonne@ici.tn;B-;M;0;Tunisie;Afrique;10;;1');
INSERT INTO CSVFile2 VALUES ('Id30;M�decin;MOUSTAFA;19-08-1988;m�decin.moustafa@yahoo.fr;AB;M;64,54 KG;Maroc;Afrique;44;38.05�C;20,97 m');
INSERT INTO CSVFile2 VALUES ('Id31;Cl�ment;MOUSTAFA;27-11-1993;cl�ment.moustafa@yahoo.fr;1;M;58,74 KG;France;;60;38.13�C;20,97 m');
INSERT INTO CSVFile2 VALUES ('Id32;Mamadou;FORT;08-12-1982;mamadou.fort@gmail.com;A-;M;0;Maroc;Afrique;58;25;**');
INSERT INTO CSVFile2 VALUES ('Id33;Emna;FORT;19-ao�t-1988;emna.fort@gmail.com;A+;F;65850,12 g;Maroc;Afrique;64,365;84.91�F;$1');
INSERT INTO CSVFile2 VALUES ('Id34;Omar;PARIS;18-05-1960;omar.paris@gmail.com;AB-;M;64,63 KG;Malie;Afrique;73;26.93�C;**');
INSERT INTO CSVFile2 VALUES ('Id35;Mamadou;CLEMENT;24-06-1995;mamadou.clement@hotmail.com;AB-;M;86,33 KG;Canada;Am�rique;50;38.05�C;12,95 m');
INSERT INTO CSVFile2 VALUES ('Id36;Mamadou;SOLEIL;24-06-1995;mamadou.soleil@gmail;A;0;64,24 KG;Espagne;;44;38.05�C;2,39 m');
INSERT INTO CSVFile2 VALUES ('Id37;Ibrahim;BELLE;08-12-1982;ibrahim.belle@gmail;A-;M;64,63 KG;France;Europe;12;20.9�C;12,94 m');
INSERT INTO CSVFile2 VALUES ('Id38;Ibrahim;PLUS BELLE;08-09-1960;ibrahim.plus belle@hotmail.com;B+;0;64,24 KG;France;;9;25.04�C;0');
INSERT INTO CSVFile2 VALUES ('Id39;Cl�ment;PRINTEMPS;27-11-1999;cl�ment.printemps@gmail.com;O+;M;93,88 KG;Alg�rie;Afrique;33;20.9�C;2,39 m');
INSERT INTO CSVFile2 VALUES ('Id40;Claire;SPORTIF;24-juin-1995;claire.sportif@yahoo.fr;B+;F;72425,34 g;Tunisie;Afrique;121,929;119.05�F;428,03 cm');
INSERT INTO CSVFile2 VALUES ('Id41;Eve;RAHMA;25-f�vrier-1995;eve.rahma@gmail.com;X;F;63282,34 g;Portugal;Europe;56,813;102.42  �F;0');
INSERT INTO CSVFile2 VALUES ('Id42;Cl�mence;SPORTIF;30-avril-2000;cl�mence.sportif@yahoo.fr;B+;F;72425,34 g;Portugal;Europe;135,288;111.29�F;77');
INSERT INTO CSVFile2 VALUES ('Id43;Jean;INFORME;17-08-1969;jean.informe@ici.tn;O-;Y;86,33 KG;S�n�gal;Afrique;71;;0');
INSERT INTO CSVFile2 VALUES ('Id44;Jean;SOLEIL;05-06-1993;jean.soleil@hotmail.com;2;M;1;Canada;Am�rique;18;26.93�C;20,97 m');
INSERT INTO CSVFile2 VALUES ('Id45;Ibrahim;TROPFOR;01-03-1967;ibrahim.tropfor@hotmail.com;A+;0;64,54 KG;Itale;;72;20.9�C;10,96 m');
INSERT INTO CSVFile2 VALUES ('Id46;Faouzi;AIMANT;14-01-1978;faouzi.aimant@ici.tn;AB+;Y;0;Argentine;Am�rique;12;25.32�Celcius;2,39 m');
INSERT INTO CSVFile2 VALUES ('Id47;Fleurette;UNIQUE;03-janvier-1975;fleurette.unique@gmail.com;AB+;F;71214,11g;Chine;Asie;146,323;111.29�F;644,34 cm');
INSERT INTO CSVFile2 VALUES ('Id48;Jean;CLEMENT;25-02-1995;jean.clement@hotmail.com;O+;M;0;Alg�rie;Afrique;11;25.32�Celcius;10,96 m');
INSERT INTO CSVFile2 VALUES ('Id49;Ibrahim;FORT;21-05-1969;ibrahim.fort@gmail.com;AB-;M;1;Malie;Afrique;33;25;10,96 m');
INSERT INTO CSVFile2 VALUES ('Id50;Sabrine;EXCELLE;14-f�vrier-1966;sabrine.excelle@yahoo.fr;B-;F;44456,57 g;Portugal;Europe;64,008;91.1�F;644,34 cm');

COMMIT;

/*
-- =================================================================================================
-- >>>>>>>>>>>>>>>> EXEMPLE 3 <<<<<<<<<<<<<<<<<<<<<<<<
-- =================================================================================================

-- >>>>>>>>>>>>>>>> CSVfile3

M. Adam SAITOUT;M;A+;Paris;France
Mme Eve LABELLE;F;B+;Paris;Franc
M. Adam TRAIFOR;M;A+;Paris;France
M. Gabriel ANGE;M;B+;Paris;
M. Ines ETINCELLE;F;B+;Paris;Fr
Mme Clemence JOLIE;F;B+;Pari;France
M. Clement LEGRAND;M;AB+;Londres;RU
M. Clement LEGRAND;M;AB+;London;United-Kingdom
M. Adam SAITOUT;M;A+;Paris;France
M. Adam BEN TRAIFOR ;M;A+;Paris;France
Mme Linda BEN SALEM;F;A+;Paris;

*/

CREATE TABLE CSVfile3 (Col VARCHAR2(1000));

INSERT INTO CSVFile3 VALUES ('M. Adam SAITOUT;M;A+;Paris;France');
INSERT INTO CSVFile3 VALUES ('Mme Eve LABELLE;F;B+;Paris;Franc');
INSERT INTO CSVFile3 VALUES ('M. Adam TRAIFOR;M;A+;Paris;France');
INSERT INTO CSVFile3 VALUES ('M. Gabriel ANGE;M;B+;Paris;');
INSERT INTO CSVFile3 VALUES ('M. Ines ETINCELLE;F;B+;Paris;Fr');
INSERT INTO CSVFile3 VALUES ('Mme Clemence JOLIE;F;B+;Pari;France');
INSERT INTO CSVFile3 VALUES ('M. Clement LEGRAND;M;AB+;Londres;RU');
INSERT INTO CSVFile3 VALUES ('M. Clement LEGRAND;M;AB+;London;United-Kingdom');
INSERT INTO CSVFile3 VALUES ('M. Adam SAITOUT;M;A+;Paris;France');
INSERT INTO CSVFile3 VALUES ('M. Clement LEGRAND;M;AB+;London;United-Kingdom');
INSERT INTO CSVFile3 VALUES ('M. Adam BEN TRAIFOR ;M;A+;Paris;France');
INSERT INTO CSVFile3 VALUES ('Mme Linda BEN SALEM;F;A+;Paris');

COMMIT;

/*
-- =================================================================================================
-- >>>>>>>>>>>>>>>> EXEMPLE 4 <<<<<<<<<<<<<<<<<<<<<<<<
-- =================================================================================================

-- >>>>>>>>>>>>>>>> CSVfile4

Mme;Anne MARTIN;M;12-05-1985;A+;a.martin@hotmail.fr;;PARIS;FRANCE;EUROPE
MME;ANNE MARTIN;M;12-05-1985;A+;A.MARTIN@HOTMAIL.FR;;PARIS;FRANCE;EUROPE
Mme;Karine LEBON;F;NULL;AB+;kl@@cnam.fr;;PARIS;FRANCE;EUROPE
M;Robert FORT;M;03-12-1990;O+;rl@yahoo.fr;;NICE;FRANCE;EUROPE
M;Robert DUPONT;M;12-04-1987;B-; nn.pn@yahoo.com;;PɐKIN;CHINE;ASIE
M;Simon GENEREUX;M;10-16-1996;NULL;sg@gmail.com;;LONDRES;ROYAUME-UNI;EUROPE
M;Simon GENEREUX@;M;16-october-1996;O-;;3313007085013;LONDON;UNITED-KINGDOM;EUROPE
Mme;Katia BON;F;26-november-1957;X;;3313007085022;BEIJING;CHINA;ASIA
M;Adem LE BON;M;05-june-2000;A+;;3313007085012;TUNIS;TUNISIA;AFRICA
M;Adem LE BON;M;05-june-2000;NULL;;3363007085012;TUNIS;TUNISIA;AFRICA
M;Robert LEBON;M;12-december-1980;B+;;3313007085052;PARIS;FRANCE;EUROPE

*/

CREATE TABLE CSVFILE4 (Col VARCHAR2(1000));

INSERT INTO CSVFILE4 VALUES ('Mme;Anne MARTIN;M;12-05-1985;A+;a.martin@hotmail.fr;;PARIS;FRANCE;EUROPE');
INSERT INTO CSVFILE4 VALUES ('MME;ANNE MARTIN;M;12-05-1985;A+;A.MARTIN@HOTMAIL.FR;;PARIS;FRANCE;EUROPE');
INSERT INTO CSVFILE4 VALUES ('Mme;Karine LEBON;F;NULL;AB+;kl@@cnam.fr;;PARIS;FRANCE;EUROPE');
INSERT INTO CSVFILE4 VALUES ('M;Robert FORT;M;03-12-1990;O+;rl@yahoo.fr;;NICE;FRANCE;EUROPE');
INSERT INTO CSVFILE4 VALUES ('M;Robert DUPONT;M;12-04-1987;B-; nn.pn@yahoo.com;;PɐKIN;CHINE;ASIE');
INSERT INTO CSVFILE4 VALUES ('M;Simon GENEREUX;M;10-16-1996;NULL;sg@gmail.com;;LONDRES;ROYAUME-UNI;EUROPE');
INSERT INTO CSVFILE4 VALUES ('M;Simon GENEREUX@;M;16-october-1996;O-;;3313007085013;LONDON;UNITED-KINGDOM;EUROPE');
INSERT INTO CSVFILE4 VALUES ('Mme;Katia BON;F;26-november-1957;X;;3313007085022;BEIJING;CHINA;ASIA');
INSERT INTO CSVFILE4 VALUES ('M;Adem LE BON;M;05-june-2000;A+;;3313007085012;TUNIS;TUNISIA;AFRICA');
INSERT INTO CSVFILE4 VALUES ('M;Adem LE BON;M;05-june-2000;NULL;;3363007085012;TUNIS;TUNISIA;AFRICA');
INSERT INTO CSVFILE4 VALUES ('M;Robert LEBON;M;12-december-1980;B+;;3313007085052;PARIS;FRANCE;EUROPE');

COMMIT;

/*
-- =================================================================================================
-- >>>>>>>>>>>>>>>> EXEMPLE 5 <<<<<<<<<<<<<<<<<<<<<<<<
-- =================================================================================================

-- >>>>>>>>>>>>>>>> CSVfile5

Id01;M.;Alain;CLEMENT;M;21/02/1970;;B+;France;Europe;EPINAY;EPINAY;27330;HAUTE-NORMANDIE;EURE;27;48.978759462, 0.641805752881;75 KG;1,6 m;21/02/1970
Id02;Mme;In�s;MIGNONNE;F;;01/01/2020;A;France;Europe;EPINAY-CHAMPLATREUX;EPINAY CHAMPLATREUX;95270;ILE-DE-FRANCE;VAL-D'OISE;95;49.0900262096, 2.40710033598;60 KG;1,67 m;
Id03;M.;Omar;BELLE;M;;?@;R;France;Europe;EPINAY-SOUS-SENART;EPINAY SOUS SENART;91860;ILE-DE-FRANCE;ESSONNE;91;48.6871527113, 2.51577225491;56 KG;1,72 m;
Id04;M.;Rayan;MIGNONNE;M;10/06/1961;rayan.mignonne@hotmail.com;A-;France;;EPINAY-SUR-DUCLAIR;EPINAY SUR DUCLAIR;76480;HAUTE-NORMANDIE;SEINE-MARITIME;76;49.5253630622, 0.835855173591;89 KG;1,85 m;10/06/1961
Id05;Mme;Eve;AIMANT;F;;eve.aimant@gmail.com;1;France;Europe;EPINAY-SUR-ODON;EPINAY SUR ODON;14310;BASSE-NORMANDIE;CALVADOS;14;49.0688314523, -0.61907881728;65 KG;1,62 m;
Id06;M.;Alain;MOUSTAFA;M;26/12/1969;alain.moustafa@yahoo.fr;++;France;Europe;EPINAY-SUR-ORGE;EPINAY SUR ORGE;91360;ILE-DE-FRANCE;ESSONNE;91;48.672618112, 2.31834586071;71 KG;1,76 m;26/12/1969
Id07;Mme;Sabrine;PRINTEMPS;F;14/11/1962;sabrine.printemps@hotmail.com;AB+;France;Europe;EPINAY-SUR-SEINE;EPINAY SUR SEINE;93800;ILE-DE-FRANCE;SEINE-SAINT-DENIS;93;48.9550132062, 2.31453043227;90 KG;1,83 m;14/11/1962
Id08;Mme;Cl�ment;DELOIN;A+;14/11/1962;cl�ment.deloin@gmail.com;AB+;France;Europe;EPINEAU-LES-VOVES;EPINEAU LES VOVES;89400;BOURGOGNE;YONNE;89;47.9468458779, 3.46998413291;76 KG;1,56 m;14/11/1962
Id09;Mme;Emna;AIMANT;F;14/04/1970;emna.aimant@hotmail.com;++;France;Europe;EPINEUIL;EPINEUIL;89700;BOURGOGNE;YONNE;89;47.8812855119, 3.98935069483;87 KG;1,66 m;14/04/1970
Id10;Mme;Claire;EXCELLE;F;02/03/1970;claire.excelle@gmail.com;AB-;France;Europe;EPINEUIL-LE-FLEURIEL;EPINEUIL LE FLEURIEL;18360;CENTRE;CHER;18;46.5709100191, 2.55643995578;84 KG;1,54 m;02/03/1970
Id11;M.;Mamadou;MOUSTAFA;M;02/03/1970;mamadou.moustafa@gmail.com;A+;France;Europe;EPINEU-LE-CHEVREUIL;EPINEU LE CHEVREUIL;72540;PAYS DE LA LOIRE;SARTHE;72;48.0405286412, -0.132212278805;80 KG;1,75 m;02/03/1970
Id12;M.;Jean;JOLIE;M;28/12/1978;01/01/2020;AB+;France;Europe;EPINEUSE;EPINEUSE;60190;PICARDIE;OISE;60;49.400292993, 2.5501491477;90 kg;1,58 m;28/12/1978
Id13;M.;Faouzi;GRANDE;M;31/12/1982;faouzi.grande@yahoo.fr;++;France;Europe;PARIS-10E-ARRONDISSEMENT;PARIS 10;75010;ILE-DE-FRANCE;PARIS;75;48.8760285569, 2.36111290453;64 kg;1,62 m;31/12/1982
Id14;M.;Alexandre;FORT;M;31/01/1999;;B+;France;Europe;PARIS-11E-ARRONDISSEMENT;PARIS 11;75011;ILE-DE-FRANCE;PARIS;75;48.8594154976, 2.37874106024;69 kg;1,65 m;31/01/1999
Id15;Mme;Cl�ment;PARIS;0;;cl�ment.paris@yahoo.fr;;France;Europe;PARIS-12E-ARRONDISSEMENT;PARIS 12;75012;ILE-DE-FRANCE;PARIS;75;48.8351562307, 2.41980703498;76 Kg;1,67 m;
Id16;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;55 Kg;1,53 m;
Id17;M.;Mamadou;JOLIE;M;31/01/1999;01/01/2020;++;France;Europe;PARIS-14E-ARRONDISSEMENT;PARIS 14;75014;ILE-DE-FRANCE;PARIS;75;48.8289932116, 2.32710088328;69 Kg;1,87 m;31/01/1999
Id18;M.;Alain;PARIS;M;21/02/1970;alain.paris@gmail.com;;France;Europe;PARIS-15E-ARRONDISSEMENT;PARIS 15;75015;ILE-DE-FRANCE;PARIS;;48.8401554186, 2.29355937243;KG;1,59 m;21/02/1970
Id19;M.;Jean;FORT;M;14/04/1970;jean.fort@yahoo.fr;O+;France;Europe;PARIS-16E-ARRONDISSEMENT;PARIS 16;75116;ILE-DE-FRANCE;PARIS;;48.8603987604, 2.26209955941;KG;1,5 m;14/04/1970
Id20;M.;M�decin;FORT;M;;m�decin.fort@hotmail.com;++;France;;PARIS-16E-ARRONDISSEMENT;PARIS 16;75016;ILE-DE-FRANCE;PARIS;75;48.8603987604, 2.26209955941;89 KG;1,76 m;
Id21;Mme;Emna;BON;F;31-janv-1999;emna.bon@yahoo.fr;AB;France;Europe;PARIS-17E-ARRONDISSEMENT;PARIS 17;75017;ILE-DE-FRANCE;PARIS;75;48.8873371665, 2.30748555949;86 KG;1,76 m;31-janv-1999
Id22;Mme;Ibrahim;MIGNONNE;0;07-avr-1989;ibrahim.mignonne@gmail.com;;France;Europe;PARIS-18E-ARRONDISSEMENT;PARIS 18;75018;ILE-DE-FRANCE;PARIS;75;48.8927350746, 2.34871193388;91 KG;1,64 m;07-avr-1989
Id23;Mme;Maria;MIGNONNE;F;31-janv-1999;1;AB+;France;Europe;PARIS-19E-ARRONDISSEMENT;PARIS 19;75019;ILE-DE-FRANCE;PARIS;75;48.886868623, 2.38469432786;90 KG;1,71 m;31-janv-1999
Id24;M.;Adam;SPORTIF;M;26-d�c-1969;01/01/2020;A-;##;;PARIS-1ER-ARRONDISSEMENT;PARIS 01;75001;ILE-DE-FRANCE;PARIS;75;48.8626304852, 2.33629344656;74 KG;1,7 m;26-d�c-1969
Id25;M.;Alexandre;SOLEIL;M;14-avr-1970;+33 6 25 11 29 05;A+;France;Europe;PARIS-20E-ARRONDISSEMENT;PARIS 20;75020;ILE-DE-FRANCE;PARIS;75;48.8631867774, 2.40081982672;93 KG;1,6 m;14-avr-1970
Id26;M.;Omar;MOUSTAFA;M;31-d�c-1982;+33 6 01 08 20 28;++;France;Europe;PARIS-2E-ARRONDISSEMENT;PARIS 02;75002;ILE-DE-FRANCE;PARIS;75;48.8679033789, 2.34410716663;85 KG;1,62 m;31-d�c-1982
Id27;Mme;Cl�mence;PRINTEMPS;F;03-avr-1970;+33 6 25 15 06 27;;France;Europe;PARIS-3E-ARRONDISSEMENT;PARIS 03;75003;ILE-DE-FRANCE;PARIS;75;48.8630541318, 2.35936105899;65 KG;1,71 m;03-avr-1970
Id28;Mme;Kenza;TROPFOR;F;10-juin-1961;+33 6 12 01 20 17;A+;France;;PARIS-4E-ARRONDISSEMENT;PARIS 04;75004;ILE-DE-FRANCE;PARIS;75;48.854228282, 2.35736193814;89 KG;1,73 m;10-juin-1961
Id29;M.;Rayan;TROPFOR;M;14-nov-1962;+33 6 26 25 02 12;++;France;Europe;PARIS-5E-ARRONDISSEMENT;PARIS 05;75005;ILE-DE-FRANCE;PARIS;75;48.8445086596, 2.34985938554;66 KG;1,88 m;14-nov-1962
Id30;M.;Alain;INFORME;M;;+33 6 17 26 28 03;AB+;France;Europe;PARIS-6E-ARRONDISSEMENT;PARIS 06;75006;ILE-DE-FRANCE;PARIS;75;48.8489680919, 2.33267089856;79 KG;1,89 m;
Id31;Mme;Anne MARTIN;;M;12-mai-1985;+33 6 13 15 27 23;a+;France;Europe;PARIS-7E-ARRONDISSEMENT;PARIS 07;75007;ILE-DE-FRANCE;PARIS;75;48.8560825982, 2.31243868774;83 KG;1,86 m;12-mai-1985
Id32;MME;ANNE MARTIN;;M;12-mai-1985;+33 6 24 06 25 25;A+;France;Europe;PARIS-8E-ARRONDISSEMENT;PARIS 08;75008;ILE-DE-FRANCE;PARIS;75;48.8725272666, 2.3125825604;55 KG;1,9 m;12-mai-1985
Id33;Mme;Karine LEBON;;F;;+33 6 09 03 27 05;AB+;France;Europe;PARIS-9E-ARRONDISSEMENT;PARIS 09;75009;ILE-DE-FRANCE;PARIS;75;48.8768961624, 2.33746024136;70 KG;1,7 m;
Id34;M;Robert FORT;;M;03-d�c-1990;+33 6 10 09 08 22;O+;France;Europe;PARIS-L'HOPITAL;PARIS L HOPITAL;71150;BOURGOGNE;SAONE-ET-LOIRE;71;46.9127885574, 4.63958573148;62 KG;1,5 m;03-d�c-1990
Id35;M;Robert DUPONT;;M;12-avr-1987;+33 6 09 15 06 09;B-;France;Europe;PARISOT;PARISOT;82160;MIDI-PYRENEES;TARN-ET-GARONNE;82;44.2617881809, 1.86571509224;82 KG;1,6 m;12-avr-1987
Id36;M;Simon GENEREUX;;M;10-16-1996;+33 6 24 17 30 19;;France;Europe;PARISOT;PARISOT;81310;MIDI-PYRENEES;TARN;81;43.8046304256, 1.83642655485;71 KG;1,62 m;10-16-1996
Id37;M;M. Adam SAITOUT;;M;mardi 11-mars-1969;+33 6 25 05 22 12;A+;France;Europe;PARLAN;PARLAN;15290;AUVERGNE;CANTAL;15;44.8274613305, 2.173229616;91 KG;1,62 m;mardi 11-mars-1969
Id38;Mme;Mme Eve LABELLE;;F;dimanche 24-janvier-1960;+33 6 18 10 30 01;A+;France;Europe;LYON--1ER-ARRONDISSEMENT;LYON 01;69001;RHONE-ALPES;RHONE;69;45.7699284396, 4.82922464978;65 KG;1,64 m;dimanche 24-janvier-1960
Id39;M;M. Adam TRAIFOR;;m;dimanche 01-septembre-1968;+33 6 25 08 06 05;A+;France;Europe;LYON--2E--ARRONDISSEMENT;LYON 02;69002;RHONE-ALPES;RHONE;69;45.7492560394, 4.82617032551;55 KG;1,69 m;dimanche 01-septembre-1968
Id40;Mme;M. Gabrielle ANGE;;f;vendredi 29-mars-1968;+33 6 13 08 07 05;A+;France;Europe;LYON--3E--ARRONDISSEMENT;LYON 03;69003;RHONE-ALPES;RHONE;69;45.7533552486, 4.86918522015;78 KG;1,57 m;vendredi 29-mars-1968
Id41;Mme;M. Ines ETINCELLE;;f;samedi 25-octobre-1969;+33 6 09 17 21 09;A+;France;Europe;LYON--4E--ARRONDISSEMENT;LYON 04;69004;RHONE-ALPES;RHONE;69;45.7786867581, 4.82396112687;67 KG;1,88 m;samedi 25-octobre-1969
Id42;Mme;Mme Clemence JOLIE;;f;jeudi 15-d�cembre-1966;+33 6 04 07 17 01;;France;Europe;LYON--5E--ARRONDISSEMENT;LYON 05;69005;RHONE-ALPES;RHONE;69;45.7558317849, 4.8022536949;77 KG;1,69 m;jeudi 15-d�cembre-1966
Id43;Mme;M. Clementine LEGRAND;;f;samedi 18-f�vrier-1961;+33 6 27 13 09 31;AB+;France;Europe;LYON--6E--ARRONDISSEMENT;LYON 06;69006;RHONE-ALPES;RHONE;69;45.7728507239, 4.85207911439;63 KG;1,72 m;samedi 18-f�vrier-1961
Id44;M;M. Clement LEGRAND;;m;mercredi 29-octobre-1969;+33 6 24 11 08 14;AB+;France;Europe;LYON--7E--ARRONDISSEMENT;LYON 07;69007;RHONE-ALPES;RHONE;69;45.7334098415, 4.83758495702;68 KG;1,63 m;mercredi 29-octobre-1969
Id45;M;M. Adam SAITOUT;;m;mardi 26-avril-1960;+33 6 04 28 07 22;AB+;France;Europe;LYON--8E--ARRONDISSEMENT;LYON 08;69008;RHONE-ALPES;RHONE;69;45.7342034691, 4.86935722306;58 KG;1,74 m;mardi 26-avril-1960
Id46;M;M. Adam BEN TRAIFOR ;;M;vendredi 24-d�cembre-1965;+33 6 11 03 15 06;AB+;France;Europe;LYON--9E--ARRONDISSEMENT;LYON 09;69009;RHONE-ALPES;RHONE;69;45.7817805887, 4.80818327819;92 KG;1,77 m;vendredi 24-d�cembre-1965
Id47;M;Mme Linda BEN SALEM;;f;jeudi 11-mai-1967;+33 6 27 11 24 10;AB+;France;Europe;LYONS-LA-FORET;LYONS LA FORET;27480;HAUTE-NORMANDIE;EURE;27;49.3936970778, 1.47355856776;58 KG;1,65 m;jeudi 11-mai-1967
Id48;M;M. Killian;MAPOUPEE;M;jeudi 21-ao�t-1969;+33 6 17 12 21 10;AB+;France;Europe;LYS;LYS;64260;AQUITAINE;PYRENEES-ATLANTIQUES;64;43.1338458627, -0.346755700041;79 KG;1,58 m;jeudi 21-ao�t-1969
Id49;M;M. Lionel;MAICIMAINON;M;mercredi 29-octobre-1958;+33 6 23 25 13 10;ab+;France;Europe;LYS;LYS;58190;BOURGOGNE;NIEVRE;58;47.334846257, 3.59874573793;85 KG;1,81 m;mercredi 29-octobre-1958
Id50;M.;Roberto;EMILIANO;M;mercredi 19-juin-1974;Roberto.EMILIANO@gmail.com;;Italie;Europe;;;;;;99;;83825 g;164,6 cm;mercredi 19-juin-1974
Id51;Mme;Clemence;JONNY;F;;Clemence.JONNY@gmail.com;1;Royaume-Uni;Europe;LONDRES;;;;;99;;58467 g;160,5 cm;
Id52;M.;Alain;ROBERTINO;M;vendredi 26-d�cembre-1969;Alain.ROBERTINO@gmail.com;++;Argentine;Am�rique;;;;;;99;;58274 g;157,8 cm;vendredi 26-d�cembre-1969
Id53;Mme;Sabrine;LONDRES;F;mercredi 14-novembre-1962;Sabrine.LONDRES@gmail.com;AB+;Royaume-Uni;Europe;LONDRES;;;;;99;;91837 g;177,5 cm;mercredi 14-novembre-1962
Id54;Mme;Adam;TRAIFOR;A+;mercredi 14-novembre-1962;Adam.TRAIFOR@gmail.com;AB+;Tunisie;Afrique;SOUSSE;;;;;99;;75470 g;167 cm;mercredi 14-novembre-1962
Id55;Mme;Emma;LALLEMANDE;F;mardi 14-avril-1970;Emma.LALLEMANDE@gmail.com;++;Allemagne;Europe;BERLIN;;;;;99;;62258 g;150,7 cm;mardi 14-avril-1970
Id56;Mme;Claire;SOLEIL;F;lundi 02-mars-1970;Claire.SOLEIL@gmail.com;AB-;Tunisie;Afrique;SOUSSE;;;;;99;;55599 g;169,2 cm;lundi 02-mars-1970
Id57;M.;Mamadou;MOUSTAFA;M;lundi 02-mars-1970;Mamadou.MOUSTAFA@gmail.com;A+;Alg�rie;Afrique;ALGER;;;;;99;;69855 g;166,4 cm;lundi 02-mars-1970
Id58;M.;Jean;JOLIE;M;jeudi 28-d�cembre-1978;01/01/2020;AB+;Belgique;Europe;BRUXELLES;;;;;99;;68825 g;190 cm;jeudi 28-d�cembre-1978
Id59;M.;Faouzi;GRANDE;M;vendredi 31-d�cembre-1982;Faouzi.GRANDE@gmail.com;++;Tunisie;Afrique;TUNIS;;;;;99;;72001 g;183,8 cm;vendredi 31-d�cembre-1982
Id60;M.;Alexandre;FORT;M;dimanche 31-janvier-1999;;B+;Tunisie;Afrique;TUNIS;;;;;99;;67634 g;186,6 cm;dimanche 31-janvier-1999
Id61;Mme;Lina;ITALIA;0;;Lina.ITALIA@gmail.com;;Italie;Europe;ROME;;;;;99;;79706 g;156,9 cm;
Id62;M.;Emir;BENBOU;M;;Emir.BENBOU@gmail.com;B+;Qatar;Asie;DOHA;;;;;99;;79563 g;159,8 cm;
Id63;M.;Lee;NGUYEN;M;dimanche 31-janvier-1999;01/01/2020;++;Chine;Asie;PEKIN;;;;;99;;84230 g;168,5 cm;dimanche 31-janvier-1999
Id64;M.;Martino;PELE;M;samedi 21-f�vrier-1970;Martino.PELE@gmail.com;;Br�sil;Am�rique;;;;;;99;;66503 g;185,1 cm;samedi 21-f�vrier-1970
Id65;M.;Mohamed;Maghreb;M;mardi 14-avril-1970;Mohamed.Maghreb@gmail.com;O+;Alg�rie;Afrique;ALGER;;;;;99;;59356 g;171,3 cm;mardi 14-avril-1970
Id66;M.;Sebastiao;BONFOOT;F;dimanche 31-janvier-1999;Sebastiao.BONFOOT@gmail.com;AB;Br�sil;Am�rique;;;;;;99;;56134 g;183,9 cm;dimanche 31-janvier-1999
Id67;0;Mariam;MIGNONNE;F;dimanche 31-janvier-1999;1;AB+;Qatar;Asie;DOHA;;;;;99;;94422 g;151,1 cm;dimanche 31-janvier-1999
Id68;1;Adamo;SPORTIFO;M;vendredi 26-d�cembre-1969;01/01/2020;A-;Espagne;;MADRID;;;;;99;;73598 g;161,9 cm;vendredi 26-d�cembre-1969
Id69;1;Lee;SOLEIL;M;mardi 14-avril-1970;Lee.SOLEIL@gmail.com;A+;Japon;Asie;TOKYO;;;;;99;;73205 g;173,4 cm;mardi 14-avril-1970
Id70;1;Alexandre;BOUFARE;M;vendredi 31-d�cembre-1982;Alexandre.BOUFARE@gmail.com;++;Canada;Am�rique;MONTREAL;;;;;99;;86497 g;158,8 cm;vendredi 31-d�cembre-1982
Id71;0;Claaudia;PRINTEMPS;F;vendredi 03-avril-1970;Claaudia.PRINTEMPS@gmail.com;;Italie;Europe;MILAN;;;;;99;;79477 g;161,4 cm;vendredi 03-avril-1970
Id72;0;Kenza;TROPFOR;F;samedi 10-juin-1961;Kenza.TROPFOR@gmail.com;A+;Tunisie;;TUNIS;;;;;99;;72845 g;cm;samedi 10-juin-1961
Id73;1;Rayan;TROPFOR;M;mercredi 14-novembre-1962;Rayan.TROPFOR@gmail.com;++;Qatar;Asie;DOHA;;;;;99;;66202 g;cm;mercredi 14-novembre-1962
Id74;1;Paoulo;Casio;M;;Paoulo.Casio@gmail.com;AB+;Itale;Europe;MILAN;;;;;99;;84410 g;177,5 cm;
Id75;M;Simon GENEREUX@;;M;16-october-1996;+33 6 20 05 29 14;O-;UNITED-KINGDOM;EUROPE;LONDON;;;;;99;;90263 g;165,3 cm;16-october-1996
Id76;Mme;Katia BON;;F;26-november-1957;+33 6 23 27 16 11;X;CHINA;ASIA;BEIJING;;;;;99;;76847 g;160,9 cm;26-november-1957
Id77;M;Adem LE BON;;M;05-june-2000;+33 6 11 16 14 29;A+;TUNISIA;AFRICA;TUNIS;;;;;99;;69737 G;166,4 cm;05-june-2000
Id78;M;Adem LE BON;;M;05-june-2000;+33 6 10 27 30 18;NULL;TUNISIA;AFRICA;TUNIS;;;;;99;;61055;160,7 cm;05-june-2000
Id79;M;Robert LEBON;;M;12-december-1980;+33 6 26 07 22 11;B+;FRANCE;EUROPE;PARIS;;;;;99;;77867 g;159,2 cm;12-december-1980
Id80;Mme;Mamma;DISPARUE;F;20-november-1994;+33 6 26 07 22 12;A+;TUNISIA;AFRICA;TUNIS;;;;;99;;77867 g;159,2 cm;20-november-1994
Id16A;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;55 KG;1,53 m;
Id16B;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;5500 g;153 cm;
Id16C;M.;Alexandre;JOLIE;M;;;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;5500 g;153 cm;
Id53A;Mme;Sabrine;LONDRES;F;mercredi 14-novembre-1962;Sabrine.LONDRES@gmail.com;AB+;UNITED-KINGDOM;EUROPE;LONDON;;;;;99;;91837 g;177,5 cm;mercredi 14-novembre-1962
Id05Bis;Mme;Eve;AIMANT;F;;eve.aimant@gmail.com;1;France;Europe;EPINAY-SUR-ODON;EPINAY SUR ODON;14310;BASSE-NORMANDIE;CALVADOS;14;49.0688314523, -0.61907881728;65 KG;1,62 m;
Id06Bis;M.;Alain;MOUSTAFA;M;26/12/1969;alain.moustafa@yahoo.fr;++;France;Europe;EPINAY-SUR-ORGE;EPINAY SUR ORGE;91360;ILE-DE-FRANCE;ESSONNE;91;48.672618112, 2.31834586071;71 KG;1,76 m;26/12/1969
Id07Bis;Mme;Sabrine;PRINTEMPS;F;14/11/1962;sabrine.printemps@hotmail.com;AB+;France;Europe;EPINAY-SUR-SEINE;EPINAY SUR SEINE;93800;ILE-DE-FRANCE;SEINE-SAINT-DENIS;93;48.9550132062, 2.31453043227;90 KG;1,83 m;14/11/1962
Id08Bis;Mme;Cl�ment;DELOIN;A+;14/11/1962;cl�ment.deloin@gmail.com;AB+;France;Europe;EPINEAU-LES-VOVES;EPINEAU LES VOVES;89400;BOURGOGNE;YONNE;89;47.9468458779, 3.46998413291;76 KG;1,56 m;14/11/1962
Id09Bis;Mme;Emna;AIMANT;F;14/04/1970;emna.aimant@hotmail.com;++;France;Europe;EPINEUIL;EPINEUIL;89700;BOURGOGNE;YONNE;89;47.8812855119, 3.98935069483;87 KG;1,66 m;14/04/1970
Id10Bis;Mme;Claire;EXCELLE;F;02/03/1970;claire.excelle@gmail.com;AB-;France;Europe;EPINEUIL-LE-FLEURIEL;EPINEUIL LE FLEURIEL;18360;CENTRE;CHER;18;46.5709100191, 2.55643995578;84 KG;1,54 m;02/03/1970
Id11Bis;M.;Mamadou;MOUSTAFA;M;02/03/1970;mamadou.moustafa@gmail.com;A+;France;Europe;EPINEU-LE-CHEVREUIL;EPINEU LE CHEVREUIL;72540;PAYS DE LA LOIRE;SARTHE;72;48.0405286412, -0.132212278805;80 KG;1,75 m;02/03/1970
Id12Bis;M.;Jean;JOLIE;M;28/12/1978;01/01/2020;AB+;France;Europe;EPINEUSE;EPINEUSE;60190;PICARDIE;OISE;60;49.400292993, 2.5501491477;90 kg;1,58 m;28/12/1978
Id13Bis;M.;Faouzi;GRANDE;M;31/12/1982;faouzi.grande@yahoo.fr;++;France;Europe;PARIS-10E-ARRONDISSEMENT;PARIS 10;75010;ILE-DE-FRANCE;PARIS;75;48.8760285569, 2.36111290453;64 kg;1,62 m;31/12/1982
Id14Bis;M.;Alexandre;FORT;M;31/01/1999;;B+;France;Europe;PARIS-11E-ARRONDISSEMENT;PARIS 11;75011;ILE-DE-FRANCE;PARIS;75;48.8594154976, 2.37874106024;69 kg;1,65 m;31/01/1999
Id15Bis;Mme;Cl�ment;PARIS;0;;cl�ment.paris@yahoo.fr;;France;Europe;PARIS-12E-ARRONDISSEMENT;PARIS 12;75012;ILE-DE-FRANCE;PARIS;75;48.8351562307, 2.41980703498;76 Kg;1,67 m;
Id16Bis;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;55 Kg;1,53 m;
Id17Bis;M.;Mamadou;JOLIE;M;31/01/1999;01/01/2020;++;France;Europe;PARIS-14E-ARRONDISSEMENT;PARIS 14;75014;ILE-DE-FRANCE;PARIS;75;48.8289932116, 2.32710088328;69 Kg;1,87 m;31/01/1999
Id18Bis;M.;Alain;PARIS;M;21/02/1970;alain.paris@gmail.com;;France;Europe;PARIS-15E-ARRONDISSEMENT;PARIS 15;75015;ILE-DE-FRANCE;PARIS;;48.8401554186, 2.29355937243;KG;1,59 m;21/02/1970
Id19Bis;M.;Jean;FORT;M;14/04/1970;jean.fort@yahoo.fr;O+;France;Europe;PARIS-16E-ARRONDISSEMENT;PARIS 16;75116;ILE-DE-FRANCE;PARIS;;48.8603987604, 2.26209955941;KG;1,5 m;14/04/1970
Id20Bis;M.;M�decin;FORT;M;;m�decin.fort@hotmail.com;++;France;;PARIS-16E-ARRONDISSEMENT;PARIS 16;75016;ILE-DE-FRANCE;PARIS;75;48.8603987604, 2.26209955941;89 KG;1,76 m;
Id21Bis;Mme;Emna;BON;F;31-janv-1999;emna.bon@yahoo.fr;AB;France;Europe;PARIS-17E-ARRONDISSEMENT;PARIS 17;75017;ILE-DE-FRANCE;PARIS;75;48.8873371665, 2.30748555949;86 KG;1,76 m;31-janv-1999
Id22Bis;Mme;Ibrahim;MIGNONNE;0;07-avr-1989;ibrahim.mignonne@gmail.com;;France;Europe;PARIS-18E-ARRONDISSEMENT;PARIS 18;75018;ILE-DE-FRANCE;PARIS;75;48.8927350746, 2.34871193388;91 KG;1,64 m;07-avr-1989
Id23Bis;Mme;Maria;MIGNONNE;F;31-janv-1999;1;AB+;France;Europe;PARIS-19E-ARRONDISSEMENT;PARIS 19;75019;ILE-DE-FRANCE;PARIS;75;48.886868623, 2.38469432786;90 KG;1,71 m;31-janv-1999
Id24Bis;M.;Adam;SPORTIF;M;26-d�c-1969;01/01/2020;A-;##;;PARIS-1ER-ARRONDISSEMENT;PARIS 01;75001;ILE-DE-FRANCE;PARIS;75;48.8626304852, 2.33629344656;74 KG;1,7 m;26-d�c-1969
Id25Bis;M.;Alexandre;SOLEIL;M;14-avr-1970;+33 6 25 11 29 05;A+;France;Europe;PARIS-20E-ARRONDISSEMENT;PARIS 20;75020;ILE-DE-FRANCE;PARIS;75;48.8631867774, 2.40081982672;93 KG;1,6 m;14-avr-1970
Id26Bis;M.;Omar;MOUSTAFA;M;31-d�c-1982;+33 6 01 08 20 28;++;France;Europe;PARIS-2E-ARRONDISSEMENT;PARIS 02;75002;ILE-DE-FRANCE;PARIS;75;48.8679033789, 2.34410716663;85 KG;1,62 m;31-d�c-1982
Id27Bis;Mme;Cl�mence;PRINTEMPS;F;03-avr-1970;+33 6 25 15 06 27;;France;Europe;PARIS-3E-ARRONDISSEMENT;PARIS 03;75003;ILE-DE-FRANCE;PARIS;75;48.8630541318, 2.35936105899;65 KG;1,71 m;03-avr-1970
Id28Bis;Mme;Kenza;TROPFOR;F;10-juin-1961;+33 6 12 01 20 17;A+;France;;PARIS-4E-ARRONDISSEMENT;PARIS 04;75004;ILE-DE-FRANCE;PARIS;75;48.854228282, 2.35736193814;89 KG;1,73 m;10-juin-1961
Id29Bis;M.;Rayan;TROPFOR;M;14-nov-1962;+33 6 26 25 02 12;++;France;Europe;PARIS-5E-ARRONDISSEMENT;PARIS 05;75005;ILE-DE-FRANCE;PARIS;75;48.8445086596, 2.34985938554;66 KG;1,88 m;14-nov-1962
Id30Bis;M.;Alain;INFORME;M;;+33 6 17 26 28 03;AB+;France;Europe;PARIS-6E-ARRONDISSEMENT;PARIS 06;75006;ILE-DE-FRANCE;PARIS;75;48.8489680919, 2.33267089856;79 KG;1,89 m;
*/

CREATE TABLE CSVFILE5 (Col VARCHAR2(1000));

INSERT INTO CSVFILE5 VALUES ('Id01;M.;Alain;CLEMENT;M;21/02/1970;;B+;France;Europe;EPINAY;EPINAY;27330;HAUTE-NORMANDIE;EURE;27;48.978759462, 0.641805752881;75 KG;1,6 m;21/02/1970');
INSERT INTO CSVFILE5 VALUES ('Id02;Mme;In�s;MIGNONNE;F;;01/01/2020;A;France;Europe;EPINAY-CHAMPLATREUX;EPINAY CHAMPLATREUX;95270;ILE-DE-FRANCE;VAL-D''OISE;95;49.0900262096, 2.40710033598;60 KG;1,67 m;');
INSERT INTO CSVFILE5 VALUES ('Id03;M.;Omar;BELLE;M;;?@;R;France;Europe;EPINAY-SOUS-SENART;EPINAY SOUS SENART;91860;ILE-DE-FRANCE;ESSONNE;91;48.6871527113, 2.51577225491;56 KG;1,72 m;');
INSERT INTO CSVFILE5 VALUES ('Id04;M.;Rayan;MIGNONNE;M;10/06/1961;rayan.mignonne@hotmail.com;A-;France;;EPINAY-SUR-DUCLAIR;EPINAY SUR DUCLAIR;76480;HAUTE-NORMANDIE;SEINE-MARITIME;76;49.5253630622, 0.835855173591;89 KG;1,85 m;10/06/1961');
INSERT INTO CSVFILE5 VALUES ('Id05;Mme;Eve;AIMANT;F;;eve.aimant@gmail.com;1;France;Europe;EPINAY-SUR-ODON;EPINAY SUR ODON;14310;BASSE-NORMANDIE;CALVADOS;14;49.0688314523, -0.61907881728;65 KG;1,62 m;');
INSERT INTO CSVFILE5 VALUES ('Id06;M.;Alain;MOUSTAFA;M;26/12/1969;alain.moustafa@yahoo.fr;++;France;Europe;EPINAY-SUR-ORGE;EPINAY SUR ORGE;91360;ILE-DE-FRANCE;ESSONNE;91;48.672618112, 2.31834586071;71 KG;1,76 m;26/12/1969');
INSERT INTO CSVFILE5 VALUES ('Id07;Mme;Sabrine;PRINTEMPS;F;14/11/1962;sabrine.printemps@hotmail.com;AB+;France;Europe;EPINAY-SUR-SEINE;EPINAY SUR SEINE;93800;ILE-DE-FRANCE;SEINE-SAINT-DENIS;93;48.9550132062, 2.31453043227;90 KG;1,83 m;14/11/1962');
INSERT INTO CSVFILE5 VALUES ('Id08;Mme;Cl�ment;DELOIN;A+;14/11/1962;cl�ment.deloin@gmail.com;AB+;France;Europe;EPINEAU-LES-VOVES;EPINEAU LES VOVES;89400;BOURGOGNE;YONNE;89;47.9468458779, 3.46998413291;76 KG;1,56 m;14/11/1962');
INSERT INTO CSVFILE5 VALUES ('Id09;Mme;Emna;AIMANT;F;14/04/1970;emna.aimant@hotmail.com;++;France;Europe;EPINEUIL;EPINEUIL;89700;BOURGOGNE;YONNE;89;47.8812855119, 3.98935069483;87 KG;1,66 m;14/04/1970');
INSERT INTO CSVFILE5 VALUES ('Id10;Mme;Claire;EXCELLE;F;02/03/1970;claire.excelle@gmail.com;AB-;France;Europe;EPINEUIL-LE-FLEURIEL;EPINEUIL LE FLEURIEL;18360;CENTRE;CHER;18;46.5709100191, 2.55643995578;84 KG;1,54 m;02/03/1970');
INSERT INTO CSVFILE5 VALUES ('Id11;M.;Mamadou;MOUSTAFA;M;02/03/1970;mamadou.moustafa@gmail.com;A+;France;Europe;EPINEU-LE-CHEVREUIL;EPINEU LE CHEVREUIL;72540;PAYS DE LA LOIRE;SARTHE;72;48.0405286412, -0.132212278805;80 KG;1,75 m;02/03/1970');
INSERT INTO CSVFILE5 VALUES ('Id12;M.;Jean;JOLIE;M;28/12/1978;01/01/2020;AB+;France;Europe;EPINEUSE;EPINEUSE;60190;PICARDIE;OISE;60;49.400292993, 2.5501491477;90 kg;1,58 m;28/12/1978');
INSERT INTO CSVFILE5 VALUES ('Id13;M.;Faouzi;GRANDE;M;31/12/1982;faouzi.grande@yahoo.fr;++;France;Europe;PARIS-10E-ARRONDISSEMENT;PARIS 10;75010;ILE-DE-FRANCE;PARIS;75;48.8760285569, 2.36111290453;64 kg;1,62 m;31/12/1982');
INSERT INTO CSVFILE5 VALUES ('Id14;M.;Alexandre;FORT;M;31/01/1999;;B+;France;Europe;PARIS-11E-ARRONDISSEMENT;PARIS 11;75011;ILE-DE-FRANCE;PARIS;75;48.8594154976, 2.37874106024;69 kg;1,65 m;31/01/1999');
INSERT INTO CSVFILE5 VALUES ('Id15;Mme;Cl�ment;PARIS;0;;cl�ment.paris@yahoo.fr;;France;Europe;PARIS-12E-ARRONDISSEMENT;PARIS 12;75012;ILE-DE-FRANCE;PARIS;75;48.8351562307, 2.41980703498;76 Kg;1,67 m;');
INSERT INTO CSVFILE5 VALUES ('Id16;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;55 Kg;1,53 m;');
INSERT INTO CSVFILE5 VALUES ('Id17;M.;Mamadou;JOLIE;M;31/01/1999;01/01/2020;++;France;Europe;PARIS-14E-ARRONDISSEMENT;PARIS 14;75014;ILE-DE-FRANCE;PARIS;75;48.8289932116, 2.32710088328;69 Kg;1,87 m;31/01/1999');
INSERT INTO CSVFILE5 VALUES ('Id18;M.;Alain;PARIS;M;21/02/1970;alain.paris@gmail.com;;France;Europe;PARIS-15E-ARRONDISSEMENT;PARIS 15;75015;ILE-DE-FRANCE;PARIS;;48.8401554186, 2.29355937243;KG;1,59 m;21/02/1970');
INSERT INTO CSVFILE5 VALUES ('Id19;M.;Jean;FORT;M;14/04/1970;jean.fort@yahoo.fr;O+;France;Europe;PARIS-16E-ARRONDISSEMENT;PARIS 16;75116;ILE-DE-FRANCE;PARIS;;48.8603987604, 2.26209955941;KG;1,5 m;14/04/1970');
INSERT INTO CSVFILE5 VALUES ('Id20;M.;M�decin;FORT;M;;m�decin.fort@hotmail.com;++;France;;PARIS-16E-ARRONDISSEMENT;PARIS 16;75016;ILE-DE-FRANCE;PARIS;75;48.8603987604, 2.26209955941;89 KG;1,76 m;');
INSERT INTO CSVFILE5 VALUES ('Id21;Mme;Emna;BON;F;31-janv-1999;emna.bon@yahoo.fr;AB;France;Europe;PARIS-17E-ARRONDISSEMENT;PARIS 17;75017;ILE-DE-FRANCE;PARIS;75;48.8873371665, 2.30748555949;86 KG;1,76 m;31-janv-1999');
INSERT INTO CSVFILE5 VALUES ('Id22;Mme;Ibrahim;MIGNONNE;0;07-avr-1989;ibrahim.mignonne@gmail.com;;France;Europe;PARIS-18E-ARRONDISSEMENT;PARIS 18;75018;ILE-DE-FRANCE;PARIS;75;48.8927350746, 2.34871193388;91 KG;1,64 m;07-avr-1989');
INSERT INTO CSVFILE5 VALUES ('Id23;Mme;Maria;MIGNONNE;F;31-janv-1999;1;AB+;France;Europe;PARIS-19E-ARRONDISSEMENT;PARIS 19;75019;ILE-DE-FRANCE;PARIS;75;48.886868623, 2.38469432786;90 KG;1,71 m;31-janv-1999');
INSERT INTO CSVFILE5 VALUES ('Id24;M.;Adam;SPORTIF;M;26-d�c-1969;01/01/2020;A-;##;;PARIS-1ER-ARRONDISSEMENT;PARIS 01;75001;ILE-DE-FRANCE;PARIS;75;48.8626304852, 2.33629344656;74 KG;1,7 m;26-d�c-1969');
INSERT INTO CSVFILE5 VALUES ('Id25;M.;Alexandre;SOLEIL;M;14-avr-1970;+33 6 25 11 29 05;A+;France;Europe;PARIS-20E-ARRONDISSEMENT;PARIS 20;75020;ILE-DE-FRANCE;PARIS;75;48.8631867774, 2.40081982672;93 KG;1,6 m;14-avr-1970');
INSERT INTO CSVFILE5 VALUES ('Id26;M.;Omar;MOUSTAFA;M;31-d�c-1982;+33 6 01 08 20 28;++;France;Europe;PARIS-2E-ARRONDISSEMENT;PARIS 02;75002;ILE-DE-FRANCE;PARIS;75;48.8679033789, 2.34410716663;85 KG;1,62 m;31-d�c-1982');
INSERT INTO CSVFILE5 VALUES ('Id27;Mme;Cl�mence;PRINTEMPS;F;03-avr-1970;+33 6 25 15 06 27;;France;Europe;PARIS-3E-ARRONDISSEMENT;PARIS 03;75003;ILE-DE-FRANCE;PARIS;75;48.8630541318, 2.35936105899;65 KG;1,71 m;03-avr-1970');
INSERT INTO CSVFILE5 VALUES ('Id28;Mme;Kenza;TROPFOR;F;10-juin-1961;+33 6 12 01 20 17;A+;France;;PARIS-4E-ARRONDISSEMENT;PARIS 04;75004;ILE-DE-FRANCE;PARIS;75;48.854228282, 2.35736193814;89 KG;1,73 m;10-juin-1961');
INSERT INTO CSVFILE5 VALUES ('Id29;M.;Rayan;TROPFOR;M;14-nov-1962;+33 6 26 25 02 12;++;France;Europe;PARIS-5E-ARRONDISSEMENT;PARIS 05;75005;ILE-DE-FRANCE;PARIS;75;48.8445086596, 2.34985938554;66 KG;1,88 m;14-nov-1962');
INSERT INTO CSVFILE5 VALUES ('Id30;M.;Alain;INFORME;M;;+33 6 17 26 28 03;AB+;France;Europe;PARIS-6E-ARRONDISSEMENT;PARIS 06;75006;ILE-DE-FRANCE;PARIS;75;48.8489680919, 2.33267089856;79 KG;1,89 m;');
INSERT INTO CSVFILE5 VALUES ('Id31;Mme;Anne MARTIN;;M;12-mai-1985;+33 6 13 15 27 23;a+;France;Europe;PARIS-7E-ARRONDISSEMENT;PARIS 07;75007;ILE-DE-FRANCE;PARIS;75;48.8560825982, 2.31243868774;83 KG;1,86 m;12-mai-1985');
INSERT INTO CSVFILE5 VALUES ('Id32;MME;ANNE MARTIN;;M;12-mai-1985;+33 6 24 06 25 25;A+;France;Europe;PARIS-8E-ARRONDISSEMENT;PARIS 08;75008;ILE-DE-FRANCE;PARIS;75;48.8725272666, 2.3125825604;55 KG;1,9 m;12-mai-1985');
INSERT INTO CSVFILE5 VALUES ('Id33;Mme;Karine LEBON;;F;;+33 6 09 03 27 05;AB+;France;Europe;PARIS-9E-ARRONDISSEMENT;PARIS 09;75009;ILE-DE-FRANCE;PARIS;75;48.8768961624, 2.33746024136;70 KG;1,7 m;');
INSERT INTO CSVFILE5 VALUES ('Id34;M;Robert FORT;;M;03-d�c-1990;+33 6 10 09 08 22;O+;France;Europe;PARIS-L''HOPITAL;PARIS L HOPITAL;71150;BOURGOGNE;SAONE-ET-LOIRE;71;46.9127885574, 4.63958573148;62 KG;1,5 m;03-d�c-1990');
INSERT INTO CSVFILE5 VALUES ('Id35;M;Robert DUPONT;;M;12-avr-1987;+33 6 09 15 06 09;B-;France;Europe;PARISOT;PARISOT;82160;MIDI-PYRENEES;TARN-ET-GARONNE;82;44.2617881809, 1.86571509224;82 KG;1,6 m;12-avr-1987');
INSERT INTO CSVFILE5 VALUES ('Id36;M;Simon GENEREUX;;M;10-16-1996;+33 6 24 17 30 19;;France;Europe;PARISOT;PARISOT;81310;MIDI-PYRENEES;TARN;81;43.8046304256, 1.83642655485;71 KG;1,62 m;10-16-1996');
INSERT INTO CSVFILE5 VALUES ('Id37;M;M. Adam SAITOUT;;M;mardi 11-mars-1969;+33 6 25 05 22 12;A+;France;Europe;PARLAN;PARLAN;15290;AUVERGNE;CANTAL;15;44.8274613305, 2.173229616;91 KG;1,62 m;mardi 11-mars-1969');
INSERT INTO CSVFILE5 VALUES ('Id38;Mme;Mme Eve LABELLE;;F;dimanche 24-janvier-1960;+33 6 18 10 30 01;A+;France;Europe;LYON--1ER-ARRONDISSEMENT;LYON 01;69001;RHONE-ALPES;RHONE;69;45.7699284396, 4.82922464978;65 KG;1,64 m;dimanche 24-janvier-1960');
INSERT INTO CSVFILE5 VALUES ('Id39;M;M. Adam TRAIFOR;;m;dimanche 01-septembre-1968;+33 6 25 08 06 05;A+;France;Europe;LYON--2E--ARRONDISSEMENT;LYON 02;69002;RHONE-ALPES;RHONE;69;45.7492560394, 4.82617032551;55 KG;1,69 m;dimanche 01-septembre-1968');
INSERT INTO CSVFILE5 VALUES ('Id40;Mme;M. Gabrielle ANGE;;f;vendredi 29-mars-1968;+33 6 13 08 07 05;A+;France;Europe;LYON--3E--ARRONDISSEMENT;LYON 03;69003;RHONE-ALPES;RHONE;69;45.7533552486, 4.86918522015;78 KG;1,57 m;vendredi 29-mars-1968');
INSERT INTO CSVFILE5 VALUES ('Id41;Mme;M. Ines ETINCELLE;;f;samedi 25-octobre-1969;+33 6 09 17 21 09;A+;France;Europe;LYON--4E--ARRONDISSEMENT;LYON 04;69004;RHONE-ALPES;RHONE;69;45.7786867581, 4.82396112687;67 KG;1,88 m;samedi 25-octobre-1969');
INSERT INTO CSVFILE5 VALUES ('Id42;Mme;Mme Clemence JOLIE;;f;jeudi 15-d�cembre-1966;+33 6 04 07 17 01;;France;Europe;LYON--5E--ARRONDISSEMENT;LYON 05;69005;RHONE-ALPES;RHONE;69;45.7558317849, 4.8022536949;77 KG;1,69 m;jeudi 15-d�cembre-1966');
INSERT INTO CSVFILE5 VALUES ('Id43;Mme;M. Clementine LEGRAND;;f;samedi 18-f�vrier-1961;+33 6 27 13 09 31;AB+;France;Europe;LYON--6E--ARRONDISSEMENT;LYON 06;69006;RHONE-ALPES;RHONE;69;45.7728507239, 4.85207911439;63 KG;1,72 m;samedi 18-f�vrier-1961');
INSERT INTO CSVFILE5 VALUES ('Id44;M;M. Clement LEGRAND;;m;mercredi 29-octobre-1969;+33 6 24 11 08 14;AB+;France;Europe;LYON--7E--ARRONDISSEMENT;LYON 07;69007;RHONE-ALPES;RHONE;69;45.7334098415, 4.83758495702;68 KG;1,63 m;mercredi 29-octobre-1969');
INSERT INTO CSVFILE5 VALUES ('Id45;M;M. Adam SAITOUT;;m;mardi 26-avril-1960;+33 6 04 28 07 22;AB+;France;Europe;LYON--8E--ARRONDISSEMENT;LYON 08;69008;RHONE-ALPES;RHONE;69;45.7342034691, 4.86935722306;58 KG;1,74 m;mardi 26-avril-1960');
INSERT INTO CSVFILE5 VALUES ('Id46;M;M. Adam BEN TRAIFOR ;;M;vendredi 24-d�cembre-1965;+33 6 11 03 15 06;AB+;France;Europe;LYON--9E--ARRONDISSEMENT;LYON 09;69009;RHONE-ALPES;RHONE;69;45.7817805887, 4.80818327819;92 KG;1,77 m;vendredi 24-d�cembre-1965');
INSERT INTO CSVFILE5 VALUES ('Id47;M;Mme Linda BEN SALEM;;f;jeudi 11-mai-1967;+33 6 27 11 24 10;AB+;France;Europe;LYONS-LA-FORET;LYONS LA FORET;27480;HAUTE-NORMANDIE;EURE;27;49.3936970778, 1.47355856776;58 KG;1,65 m;jeudi 11-mai-1967');
INSERT INTO CSVFILE5 VALUES ('Id48;M;M. Killian;MAPOUPEE;M;jeudi 21-ao�t-1969;+33 6 17 12 21 10;AB+;France;Europe;LYS;LYS;64260;AQUITAINE;PYRENEES-ATLANTIQUES;64;43.1338458627, -0.346755700041;79 KG;1,58 m;jeudi 21-ao�t-1969');
INSERT INTO CSVFILE5 VALUES ('Id49;M;M. Lionel;MAICIMAINON;M;mercredi 29-octobre-1958;+33 6 23 25 13 10;ab+;France;Europe;LYS;LYS;58190;BOURGOGNE;NIEVRE;58;47.334846257, 3.59874573793;85 KG;1,81 m;mercredi 29-octobre-1958');
INSERT INTO CSVFILE5 VALUES ('Id50;M.;Roberto;EMILIANO;M;mercredi 19-juin-1974;Roberto.EMILIANO@gmail.com;;Italie;Europe;;;;;;99;;83825 g;164,6 cm;mercredi 19-juin-1974');
INSERT INTO CSVFILE5 VALUES ('Id51;Mme;Clemence;JONNY;F;;Clemence.JONNY@gmail.com;1;Royaume-Uni;Europe;LONDRES;;;;;99;;58467 g;160,5 cm;');
INSERT INTO CSVFILE5 VALUES ('Id52;M.;Alain;ROBERTINO;M;vendredi 26-d�cembre-1969;Alain.ROBERTINO@gmail.com;++;Argentine;Am�rique;;;;;;99;;58274 g;157,8 cm;vendredi 26-d�cembre-1969');
INSERT INTO CSVFILE5 VALUES ('Id53;Mme;Sabrine;LONDRES;F;mercredi 14-novembre-1962;Sabrine.LONDRES@gmail.com;AB+;Royaume-Uni;Europe;LONDRES;;;;;99;;91837 g;177,5 cm;mercredi 14-novembre-1962');
INSERT INTO CSVFILE5 VALUES ('Id54;Mme;Adam;TRAIFOR;A+;mercredi 14-novembre-1962;Adam.TRAIFOR@gmail.com;AB+;Tunisie;Afrique;SOUSSE;;;;;99;;75470 g;167 cm;mercredi 14-novembre-1962');
INSERT INTO CSVFILE5 VALUES ('Id55;Mme;Emma;LALLEMANDE;F;mardi 14-avril-1970;Emma.LALLEMANDE@gmail.com;++;Allemagne;Europe;BERLIN;;;;;99;;62258 g;150,7 cm;mardi 14-avril-1970');
INSERT INTO CSVFILE5 VALUES ('Id56;Mme;Claire;SOLEIL;F;lundi 02-mars-1970;Claire.SOLEIL@gmail.com;AB-;Tunisie;Afrique;SOUSSE;;;;;99;;55599 g;169,2 cm;lundi 02-mars-1970');
INSERT INTO CSVFILE5 VALUES ('Id57;M.;Mamadou;MOUSTAFA;M;lundi 02-mars-1970;Mamadou.MOUSTAFA@gmail.com;A+;Alg�rie;Afrique;ALGER;;;;;99;;69855 g;166,4 cm;lundi 02-mars-1970');
INSERT INTO CSVFILE5 VALUES ('Id58;M.;Jean;JOLIE;M;jeudi 28-d�cembre-1978;01/01/2020;AB+;Belgique;Europe;BRUXELLES;;;;;99;;68825 g;190 cm;jeudi 28-d�cembre-1978');
INSERT INTO CSVFILE5 VALUES ('Id59;M.;Faouzi;GRANDE;M;vendredi 31-d�cembre-1982;Faouzi.GRANDE@gmail.com;++;Tunisie;Afrique;TUNIS;;;;;99;;72001 g;183,8 cm;vendredi 31-d�cembre-1982');
INSERT INTO CSVFILE5 VALUES ('Id60;M.;Alexandre;FORT;M;dimanche 31-janvier-1999;;B+;Tunisie;Afrique;TUNIS;;;;;99;;67634 g;186,6 cm;dimanche 31-janvier-1999');
INSERT INTO CSVFILE5 VALUES ('Id61;Mme;Lina;ITALIA;0;;Lina.ITALIA@gmail.com;;Italie;Europe;ROME;;;;;99;;79706 g;156,9 cm;');
INSERT INTO CSVFILE5 VALUES ('Id62;M.;Emir;BENBOU;M;;Emir.BENBOU@gmail.com;B+;Qatar;Asie;DOHA;;;;;99;;79563 g;159,8 cm;');
INSERT INTO CSVFILE5 VALUES ('Id63;M.;Lee;NGUYEN;M;dimanche 31-janvier-1999;01/01/2020;++;Chine;Asie;PEKIN;;;;;99;;84230 g;168,5 cm;dimanche 31-janvier-1999');
INSERT INTO CSVFILE5 VALUES ('Id64;M.;Martino;PELE;M;samedi 21-f�vrier-1970;Martino.PELE@gmail.com;;Br�sil;Am�rique;;;;;;99;;66503 g;185,1 cm;samedi 21-f�vrier-1970');
INSERT INTO CSVFILE5 VALUES ('Id65;M.;Mohamed;Maghreb;M;mardi 14-avril-1970;Mohamed.Maghreb@gmail.com;O+;Alg�rie;Afrique;ALGER;;;;;99;;59356 g;171,3 cm;mardi 14-avril-1970');
INSERT INTO CSVFILE5 VALUES ('Id66;M.;Sebastiao;BONFOOT;F;dimanche 31-janvier-1999;Sebastiao.BONFOOT@gmail.com;AB;Br�sil;Am�rique;;;;;;99;;56134 g;183,9 cm;dimanche 31-janvier-1999');
INSERT INTO CSVFILE5 VALUES ('Id67;0;Mariam;MIGNONNE;F;dimanche 31-janvier-1999;1;AB+;Qatar;Asie;DOHA;;;;;99;;94422 g;151,1 cm;dimanche 31-janvier-1999');
INSERT INTO CSVFILE5 VALUES ('Id68;1;Adamo;SPORTIFO;M;vendredi 26-d�cembre-1969;01/01/2020;A-;Espagne;;MADRID;;;;;99;;73598 g;161,9 cm;vendredi 26-d�cembre-1969');
INSERT INTO CSVFILE5 VALUES ('Id69;1;Lee;SOLEIL;M;mardi 14-avril-1970;Lee.SOLEIL@gmail.com;A+;Japon;Asie;TOKYO;;;;;99;;73205 g;173,4 cm;mardi 14-avril-1970');
INSERT INTO CSVFILE5 VALUES ('Id70;1;Alexandre;BOUFARE;M;vendredi 31-d�cembre-1982;Alexandre.BOUFARE@gmail.com;++;Canada;Am�rique;MONTREAL;;;;;99;;86497 g;158,8 cm;vendredi 31-d�cembre-1982');
INSERT INTO CSVFILE5 VALUES ('Id71;0;Claaudia;PRINTEMPS;F;vendredi 03-avril-1970;Claaudia.PRINTEMPS@gmail.com;;Italie;Europe;MILAN;;;;;99;;79477 g;161,4 cm;vendredi 03-avril-1970');
INSERT INTO CSVFILE5 VALUES ('Id72;0;Kenza;TROPFOR;F;samedi 10-juin-1961;Kenza.TROPFOR@gmail.com;A+;Tunisie;;TUNIS;;;;;99;;72845 g;cm;samedi 10-juin-1961');
INSERT INTO CSVFILE5 VALUES ('Id73;1;Rayan;TROPFOR;M;mercredi 14-novembre-1962;Rayan.TROPFOR@gmail.com;++;Qatar;Asie;DOHA;;;;;99;;66202 g;cm;mercredi 14-novembre-1962');
INSERT INTO CSVFILE5 VALUES ('Id74;1;Paoulo;Casio;M;;Paoulo.Casio@gmail.com;AB+;Itale;Europe;MILAN;;;;;99;;84410 g;177,5 cm;');
INSERT INTO CSVFILE5 VALUES ('Id75;M;Simon GENEREUX@;;M;16-october-1996;+33 6 20 05 29 14;O-;UNITED-KINGDOM;EUROPE;LONDON;;;;;99;;90263 g;165,3 cm;16-october-1996');
INSERT INTO CSVFILE5 VALUES ('Id76;Mme;Katia BON;;F;26-november-1957;+33 6 23 27 16 11;X;CHINA;ASIA;BEIJING;;;;;99;;76847 g;160,9 cm;26-november-1957');
INSERT INTO CSVFILE5 VALUES ('Id77;M;Adem LE BON;;M;05-june-2000;+33 6 11 16 14 29;A+;TUNISIA;AFRICA;TUNIS;;;;;99;;69737 G;166,4 cm;05-june-2000');
INSERT INTO CSVFILE5 VALUES ('Id78;M;Adem LE BON;;M;05-june-2000;+33 6 10 27 30 18;NULL;TUNISIA;AFRICA;TUNIS;;;;;99;;61055;160,7 cm;05-june-2000');
INSERT INTO CSVFILE5 VALUES ('Id79;M;Robert LEBON;;M;12-december-1980;+33 6 26 07 22 11;B+;FRANCE;EUROPE;PARIS;;;;;99;;77867 g;159,2 cm;12-december-1980');
INSERT INTO CSVFILE5 VALUES ('Id80;Mme;Mamma;DISPARUE;F;20-november-1994;+33 6 26 07 22 12;A+;TUNISIA;AFRICA;TUNIS;;;;;99;;77867 g;159,2 cm;20-november-1994');
INSERT INTO CSVFILE5 VALUES ('Id16A;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;55 KG;1,53 m;');
INSERT INTO CSVFILE5 VALUES ('Id16B;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;5500 g;153 cm;');
INSERT INTO CSVFILE5 VALUES ('Id16C;M.;Alexandre;JOLIE;M;;;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;5500 g;153 cm;');
INSERT INTO CSVFILE5 VALUES ('Id53A;Mme;Sabrine;LONDRES;F;mercredi 14-novembre-1962;Sabrine.LONDRES@gmail.com;AB+;UNITED-KINGDOM;EUROPE;LONDON;;;;;99;;91837 g;177,5 cm;mercredi 14-novembre-1962');
INSERT INTO CSVFILE5 VALUES ('Id05Bis;Mme;Eve;AIMANT;F;;eve.aimant@gmail.com;1;France;Europe;EPINAY-SUR-ODON;EPINAY SUR ODON;14310;BASSE-NORMANDIE;CALVADOS;14;49.0688314523, -0.61907881728;65 KG;1,62 m;');
INSERT INTO CSVFILE5 VALUES ('Id06Bis;M.;Alain;MOUSTAFA;M;26/12/1969;alain.moustafa@yahoo.fr;++;France;Europe;EPINAY-SUR-ORGE;EPINAY SUR ORGE;91360;ILE-DE-FRANCE;ESSONNE;91;48.672618112, 2.31834586071;71 KG;1,76 m;26/12/1969');
INSERT INTO CSVFILE5 VALUES ('Id07Bis;Mme;Sabrine;PRINTEMPS;F;14/11/1962;sabrine.printemps@hotmail.com;AB+;France;Europe;EPINAY-SUR-SEINE;EPINAY SUR SEINE;93800;ILE-DE-FRANCE;SEINE-SAINT-DENIS;93;48.9550132062, 2.31453043227;90 KG;1,83 m;14/11/1962');
INSERT INTO CSVFILE5 VALUES ('Id08Bis;Mme;Cl�ment;DELOIN;A+;14/11/1962;cl�ment.deloin@gmail.com;AB+;France;Europe;EPINEAU-LES-VOVES;EPINEAU LES VOVES;89400;BOURGOGNE;YONNE;89;47.9468458779, 3.46998413291;76 KG;1,56 m;14/11/1962');
INSERT INTO CSVFILE5 VALUES ('Id09Bis;Mme;Emna;AIMANT;F;14/04/1970;emna.aimant@hotmail.com;++;France;Europe;EPINEUIL;EPINEUIL;89700;BOURGOGNE;YONNE;89;47.8812855119, 3.98935069483;87 KG;1,66 m;14/04/1970');
INSERT INTO CSVFILE5 VALUES ('Id10Bis;Mme;Claire;EXCELLE;F;02/03/1970;claire.excelle@gmail.com;AB-;France;Europe;EPINEUIL-LE-FLEURIEL;EPINEUIL LE FLEURIEL;18360;CENTRE;CHER;18;46.5709100191, 2.55643995578;84 KG;1,54 m;02/03/1970');
INSERT INTO CSVFILE5 VALUES ('Id11Bis;M.;Mamadou;MOUSTAFA;M;02/03/1970;mamadou.moustafa@gmail.com;A+;France;Europe;EPINEU-LE-CHEVREUIL;EPINEU LE CHEVREUIL;72540;PAYS DE LA LOIRE;SARTHE;72;48.0405286412, -0.132212278805;80 KG;1,75 m;02/03/1970');
INSERT INTO CSVFILE5 VALUES ('Id12Bis;M.;Jean;JOLIE;M;28/12/1978;01/01/2020;AB+;France;Europe;EPINEUSE;EPINEUSE;60190;PICARDIE;OISE;60;49.400292993, 2.5501491477;90 kg;1,58 m;28/12/1978');
INSERT INTO CSVFILE5 VALUES ('Id13Bis;M.;Faouzi;GRANDE;M;31/12/1982;faouzi.grande@yahoo.fr;++;France;Europe;PARIS-10E-ARRONDISSEMENT;PARIS 10;75010;ILE-DE-FRANCE;PARIS;75;48.8760285569, 2.36111290453;64 kg;1,62 m;31/12/1982');
INSERT INTO CSVFILE5 VALUES ('Id14Bis;M.;Alexandre;FORT;M;31/01/1999;;B+;France;Europe;PARIS-11E-ARRONDISSEMENT;PARIS 11;75011;ILE-DE-FRANCE;PARIS;75;48.8594154976, 2.37874106024;69 kg;1,65 m;31/01/1999');
INSERT INTO CSVFILE5 VALUES ('Id15Bis;Mme;Cl�ment;PARIS;0;;cl�ment.paris@yahoo.fr;;France;Europe;PARIS-12E-ARRONDISSEMENT;PARIS 12;75012;ILE-DE-FRANCE;PARIS;75;48.8351562307, 2.41980703498;76 Kg;1,67 m;');
INSERT INTO CSVFILE5 VALUES ('Id16Bis;M.;Alexandre;JOLIE;M;;alexandre.jolie@gmail.com;B+;France;Europe;PARIS-13E-ARRONDISSEMENT;PARIS 13;75013;ILE-DE-FRANCE;PARIS;75;48.8287176845, 2.3624682285;55 Kg;1,53 m;');
INSERT INTO CSVFILE5 VALUES ('Id17Bis;M.;Mamadou;JOLIE;M;31/01/1999;01/01/2020;++;France;Europe;PARIS-14E-ARRONDISSEMENT;PARIS 14;75014;ILE-DE-FRANCE;PARIS;75;48.8289932116, 2.32710088328;69 Kg;1,87 m;31/01/1999');
INSERT INTO CSVFILE5 VALUES ('Id18Bis;M.;Alain;PARIS;M;21/02/1970;alain.paris@gmail.com;;France;Europe;PARIS-15E-ARRONDISSEMENT;PARIS 15;75015;ILE-DE-FRANCE;PARIS;;48.8401554186, 2.29355937243;KG;1,59 m;21/02/1970');
INSERT INTO CSVFILE5 VALUES ('Id19Bis;M.;Jean;FORT;M;14/04/1970;jean.fort@yahoo.fr;O+;France;Europe;PARIS-16E-ARRONDISSEMENT;PARIS 16;75116;ILE-DE-FRANCE;PARIS;;48.8603987604, 2.26209955941;KG;1,5 m;14/04/1970');
INSERT INTO CSVFILE5 VALUES ('Id20Bis;M.;M�decin;FORT;M;;m�decin.fort@hotmail.com;++;France;;PARIS-16E-ARRONDISSEMENT;PARIS 16;75016;ILE-DE-FRANCE;PARIS;75;48.8603987604, 2.26209955941;89 KG;1,76 m;');
INSERT INTO CSVFILE5 VALUES ('Id21Bis;Mme;Emna;BON;F;31-janv-1999;emna.bon@yahoo.fr;AB;France;Europe;PARIS-17E-ARRONDISSEMENT;PARIS 17;75017;ILE-DE-FRANCE;PARIS;75;48.8873371665, 2.30748555949;86 KG;1,76 m;31-janv-1999');
INSERT INTO CSVFILE5 VALUES ('Id22Bis;Mme;Ibrahim;MIGNONNE;0;07-avr-1989;ibrahim.mignonne@gmail.com;;France;Europe;PARIS-18E-ARRONDISSEMENT;PARIS 18;75018;ILE-DE-FRANCE;PARIS;75;48.8927350746, 2.34871193388;91 KG;1,64 m;07-avr-1989');
INSERT INTO CSVFILE5 VALUES ('Id23Bis;Mme;Maria;MIGNONNE;F;31-janv-1999;1;AB+;France;Europe;PARIS-19E-ARRONDISSEMENT;PARIS 19;75019;ILE-DE-FRANCE;PARIS;75;48.886868623, 2.38469432786;90 KG;1,71 m;31-janv-1999');
INSERT INTO CSVFILE5 VALUES ('Id24Bis;M.;Adam;SPORTIF;M;26-d�c-1969;01/01/2020;A-;##;;PARIS-1ER-ARRONDISSEMENT;PARIS 01;75001;ILE-DE-FRANCE;PARIS;75;48.8626304852, 2.33629344656;74 KG;1,7 m;26-d�c-1969');
INSERT INTO CSVFILE5 VALUES ('Id25Bis;M.;Alexandre;SOLEIL;M;14-avr-1970;+33 6 25 11 29 05;A+;France;Europe;PARIS-20E-ARRONDISSEMENT;PARIS 20;75020;ILE-DE-FRANCE;PARIS;75;48.8631867774, 2.40081982672;93 KG;1,6 m;14-avr-1970');
INSERT INTO CSVFILE5 VALUES ('Id26Bis;M.;Omar;MOUSTAFA;M;31-d�c-1982;+33 6 01 08 20 28;++;France;Europe;PARIS-2E-ARRONDISSEMENT;PARIS 02;75002;ILE-DE-FRANCE;PARIS;75;48.8679033789, 2.34410716663;85 KG;1,62 m;31-d�c-1982');
INSERT INTO CSVFILE5 VALUES ('Id27Bis;Mme;Cl�mence;PRINTEMPS;F;03-avr-1970;+33 6 25 15 06 27;;France;Europe;PARIS-3E-ARRONDISSEMENT;PARIS 03;75003;ILE-DE-FRANCE;PARIS;75;48.8630541318, 2.35936105899;65 KG;1,71 m;03-avr-1970');
INSERT INTO CSVFILE5 VALUES ('Id28Bis;Mme;Kenza;TROPFOR;F;10-juin-1961;+33 6 12 01 20 17;A+;France;;PARIS-4E-ARRONDISSEMENT;PARIS 04;75004;ILE-DE-FRANCE;PARIS;75;48.854228282, 2.35736193814;89 KG;1,73 m;10-juin-1961');
INSERT INTO CSVFILE5 VALUES ('Id29Bis;M.;Rayan;TROPFOR;M;14-nov-1962;+33 6 26 25 02 12;++;France;Europe;PARIS-5E-ARRONDISSEMENT;PARIS 05;75005;ILE-DE-FRANCE;PARIS;75;48.8445086596, 2.34985938554;66 KG;1,88 m;14-nov-1962');
INSERT INTO CSVFILE5 VALUES ('Id30Bis;M.;Alain;INFORME;M;;+33 6 17 26 28 03;AB+;France;Europe;PARIS-6E-ARRONDISSEMENT;PARIS 06;75006;ILE-DE-FRANCE;PARIS;75;48.8489680919, 2.33267089856;79 KG;1,89 m;');

COMMIT;

--==================================================================================================
--==================================================================================================
-- DD : Data Dictionnaries
--==================================================================================================
--==================================================================================================
--==================================================================================================
-- DDRE_SYNTACTICTYPES : Data Dictionnary for Regular Expressions for syntactic types
--==================================================================================================
-- Creation of data structure
CREATE TABLE DDRE_SYNTACTICTYPES (SYNTACTICTYPE VARCHAR2(100), SYNTACTICSUBTYPE VARCHAR2(100), REGULAREXPRESSION VARCHAR2(1000));
-- Creation of regular expressions
-- Insertion of tuples for the basic syntactic types : Strings, Dates and Times, Numbers...
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('STRING', 'ALPHABETICUPPER', 'expr...');         --Alphabetical letters in uppercase
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('STRING', 'ALPHABETICLOWER', 'expr...');         --Alphabetical letters in lowercase.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('STRING', 'ALPHABETICUPPLOW', 'expr...');        --Alphabetical letters in lower and upper case.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('STRING', 'ALPHANUMERICUPPER', 'expr...');       --Alphanumeric characters in upper case.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('STRING', 'ALPHANUMERICLOWER', 'expr...');       --Alphanumeric characters in lowercase.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('STRING', 'ALPHANUMERICSPECIALCHAR', 'expr...'); --Alphanumeric characters (special).

INSERT INTO DDRE_SYNTACTICTYPES VALUES ('DATE', 'FRENCH', 'expr...');                    --French date.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('DATE', 'ENGLISH', 'expr...');                   --English date.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('TIME', 'TIMEH24', 'expr...');                   --Time format H24.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('TIME', 'TIMEH12', 'expr...');                   --Time format H12.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('DATETIME', 'DATETIMEH24', 'expr...');           --French date-Time H24.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('DATETIME', 'DATETIMEH12', 'expr...');           --English date-Time H12.

INSERT INTO DDRE_SYNTACTICTYPES VALUES ('NUMBER', 'INTEGER', 'expr...');                 --Integer Numbers.
INSERT INTO DDRE_SYNTACTICTYPES VALUES ('NUMBER', 'REAL', 'expr...');                    --Real Numbers.

-- Ci-dessous des exemples d'expressions r�guli�res. Le reste est � trouver par vos soins!

-- Date fran�aise : '^(([0-2][0-9]|3[0-1])/(0[0-9]|1[0-2])/[0-9]{4})$'
-- Date anglaise : 'DATEAM', '^((0[0-9]|1[0-2])/([0-2][0-9]|3[0-1])/[0-9]{4})$'
-- Alphab�tique : 'ALPHABETIQUE', '^[[:alpha:] ]+$'                           ?? -- ^[A-Za-z]
-- Num�rique : 'NUMERIQUE', '^[[:digit:]]+$'                                  ?? -- ^[0-9] et le + et le - ...

--==================================================================================================
-- DDRE : Data Dictionnary for Regular Expressions
--==================================================================================================
/*
-- Creation of data structure and the regular expressions
-- Voir fichier RegexMFB.sql
-- CREATE TABLE DDRE (...);
-- INSERT INTO DDRE VALUES ... ;
-- ===============================================================================
-- Le lien du testeur des expressions r�guli�res est :
-- >>>>>>>>>>>>>>>                 https://regex101.com/
-- ===============================================================================
*/

--==================================================================================================
-- DDVS : Data Dictionnary for Valid Strings
--==================================================================================================
/*
-- Creation of data structure and the considered valid strings
-- Voir fichier ddvs.sql
-- CREATE TABLE DDVS (...);
-- INSERT INTO DDVS VALUES ...;
*/

--==================================================================================================
--==================================================================================================
-- DR : Data Reports
--==================================================================================================
DROP TABLE DR_CSVFile_Col_i ;
CREATE TABLE DR_CSVFile_Col_i  -- Col_i le nom/numero de la colonne en question
(
REFERENCES 			VARCHAR2(100), --NomDuFichier CSV_ DateHeureSyst�me_Coli
OLDVALUES			VARCHAR2(1000),
SYNTACTICTYPE 		VARCHAR2(20),
SYNTACTICSUBTYPE	VARCHAR2(20),
COLUMNWIDHT 		NUMBER(5),
NUMBEROFWORDS 		NUMBER(2),
OBSERVATION 		VARCHAR2(100),
NEWVALUES 			VARCHAR2(1000),
SEMANTICCATEGORY 	VARCHAR2(1000),
SEMANTICSUBCATEGORY VARCHAR2(1000)
);

DROP TABLE DR_CSVFile_TabCol ;
CREATE TABLE DR_CSVFile_TabCol
(
REFERENCES 			VARCHAR2(100),    -- NomDuFichier CSV_ DateHeureSyst�me
OLDNAME 			VARCHAR2(100),
NEWNAME 			VARCHAR2(100),
M000				NUMBER(5),
M100				NUMBER(5),
M101				NUMBER(5),
M102				NUMBER(5),
Etc�
);

DROP TABLE DR_SemanticDependencies;
CREATE TABLE DR_SemanticDependencies 
(
REFERENCES 			VARCHAR2(100),   --NomDuFichier CSV_ DateHeureSyst�me
LEFTCOL				VARCHAR2(100),
SEMANTICDEPENDENCY	VARCHAR2(4),
RIGHTCOL			VARCHAR2(100),   
PERCENTAGE			NUMBER,          --Pourcentage de la v�rification de la relation s�mantique
CONSTRAINT CK_SEMDEP CHECK SEMANTICDEPENDENCY IN ('-DF-', '-EQ-', '-LE-', '-GE-')
);

--=================================================================================================
--=================================================================================================
--=================================================================================================
--= Manipulation intelligente des donn�es : Anomalies intercolonnes ===============================
--= Les D�pendances S�mantiques ======       (-DF- ; -EQ- ; -LE- ; -GE-)  =========================
--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================
-- MFB FFF +++

/*

D�veloppez les m�canismes (proc�dures et fonctions PL/SQL) qui permettent de v�rifier les 
d�pendances s�mantiques ( -DF- ; -EQ- ; -LE- ; -GE-) qui peuvent �ventuellement exister 
entre les colonnes d'une table telles que :

- les d�pendances fonctionnelles           -DF-
  Exemples : 
    Col_i -DF- Col_j                  The-LEFT-column determines functionally The-RIGHT-column
   (Col_p+Col_q+...) -DF- Col_k       The-LEFT-columns determine functionally The-RIGHT-column
  
- les d�pendances d'ordre (= �galit�)       -EQ-     
  Exemple : 
    Col_i -EQ- Col_j                  The left column is equal to the right column
	
- les d�pendances d'ordre (<= inf�riorit�)  -LE-     
  Exemple : 
    Col_i -LE- Col_j                  The left column is less than or equal to the right column
	
- les d�pendances d'ordre (>= sup�riorit�)  -GE-     
  Exemple : 
    Col_i -GE- Col_j                  The left column is greater than or equal to the right column

Remarque : 
La NON v�rification ou la v�rification de certaines de ces d�pendances s�mantiques
peut impliquer des anomalies dans la table !

*/
/*

D�veloppez le n�cessaire pour remplir la m�ta-table (les m�ta-donn�es) de nom DR_SemanticDependencies
Avec pour la colonne COL1 : p% �gal (1-X/Y)%
X=    SELECT SUM(NBROCC) FROM VERIFDF_VP WHERE NBROCC > 1;	
Y=    SELECT COUNT(*) FROM TABLACONTROLER ;	

*/

-- Testez vos Script sur tous les fichiers CSV 1, 2, 2, 4 et 5
-- Etablissez tous les rapports sur les donn�es (Les DR_...)
-- Validez votre projet iDQMS ......
-- BONNE ANNEE 2020 ; BONNE ANNEE 2020 ; BONNE ANNEE 2020

--=================================================================================================
--=================================================================================================
--=================================================================================================
--= Manipulation intelligente des donn�es : D�pendances Fonctionnelles   === DF ======== DEBUT ====
--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================
-- MFB FFF +++

-- Exemple de table (TABLACONTROLER) pour la DF
-- CREATION DE LA STRUCTURE DES DONNEES
DROP TABLE TABLACONTROLER ;
CREATE TABLE TABLACONTROLER 
(COL1 VARCHAR2(20), COL2 VARCHAR2(20), COL3 VARCHAR2(1), COL4 VARCHAR2(1), COL5 VARCHAR2(20));
-- INSERTION DES DONNEES
--  Cette table est issue d'une int�gration de donn�es non r�ussie !
INSERT INTO TABLACONTROLER VALUES ('EPINAY-SUR-SEINE', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('PARIS', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('VILLETANEUSE', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('EPINAY-SUR-SEINE', '', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('EPINAY SUR SEINE', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('PARIS', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('PARIS', '', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('PARIS', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('MARSEILLE', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('ORLY-VILLE', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('MARSEILLE', 'FRANC', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('PARYS', 'FR', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('EPINAY-SUR-SEINE', 'FRANCE', '1', '1', 'EUROPE');
INSERT INTO TABLACONTROLER VALUES ('PARIS', 'france', '1', '1', '');
INSERT INTO TABLACONTROLER VALUES ('Bruxelles', 'Belgique', '1', '1', 'europe');
INSERT INTO TABLACONTROLER VALUES ('MOSCOU', 'RUSSIE', '1', '1', 'ASIE');
INSERT INTO TABLACONTROLER VALUES ('ALGER', 'ALGERIE', '1', '1', 'AFRIQUE');
INSERT INTO TABLACONTROLER VALUES ('RABAT', 'MAROC', '1', '1', 'afrique');
INSERT INTO TABLACONTROLER VALUES ('TUNIS', 'TUNISIE', '1', '1', 'AFRIQUE');

COMMIT;
-- VISUALISATION DES DONNEES
SELECT * FROM TABLACONTROLER;
-- PRETRAITEMENT >> HOMOGENEISATION DES DONNEES : TOUT EN MAJUSCULE
UPDATE TABLACONTROLER SET COL1 = UPPER(COL1);
UPDATE TABLACONTROLER SET COL2 = UPPER(COL2);
UPDATE TABLACONTROLER SET COL5 = UPPER(COL5);
COMMIT;
-- VISUALISATION DES DONNEES AVEC DOUBLONS
SELECT * FROM TABLACONTROLER;

-- ====== Algorithme simplifi� pour v�rifier la DF entre 2 colonnes :

-- Eliminer les doubles et compter le nombre d'occurrences
-- SUPPRIMER LES DOUBLONS (COL1, COL2)
CREATE OR REPLACE VIEW LISTAVERIFIER_VP0 (COL1_CITY, COL2_COUNTRY)
AS SELECT (COL1, COL2) FROM TABLACONTROLER;
CREATE OR REPLACE VIEW LISTAVERIFIER_VP (COL1_CITY, COL2_COUNTRY)
AS SELECT DISTINCT * FROM LISTAVERIFIER_VP0;
-- VISUALISATION DES DONNEES SANS DOUBLON
SELECT * FROM LISTAVERIFIER_VP ;

CREATE OR REPLACE VIEW VERIFDF_VP (COL1_CITY, NBROCC) AS
SELECT COL1_VILLE, COUNT(*) FROM LISTAVERIFIER_VP GROUP BY COL1_VILLE ORDER BY COL1_VILLE;
-- VISUALISATION DU COMPTAGE DU NOMBRE D'OCCURRENCES POUR CHAQUE VALEUR DE COL1
SELECT * FROM VERIFDF_VP ;

-- Si le nombre d'occurrences maximal est sup�rieur � 1 Alors la DF n'est pas v�rifi�e !
-- CREATE OR REPLACE FUNCTION VerifDF ???
CREATE OR REPLACE FUNCTION VerifDF( p_COLONNE1 IN VARCHAR2, p_COLONNE2 IN VARCHAR2 )
RETURN VARCHAR2
IS
RESULT VARCHAR2(50);
MAXOC NUMBER(2);
BEGIN
  -- SELECT MAX(NBROCC) INTO NBRMAXOCC FROM VERIFDF_VP;	
  SELECT MAX(NBROCC) AS MAXOCCUR INTO NBRMAXOCC FROM VERIFDF_VP;	
  SELECT CASE WHEN NBRMAXOCC > 1 THEN 'FALSE' ELSE 'TRUE' END INTO RESULT FROM DUAL ;
  RETURN(RESULT);
END;
/
-- Tester la DF :  COL1 -DF- COL2
SELECT VerifDF(COL1, COL2) AS verificationDF FROM TABLACONTROLER;

--=================================================================================================
--=  Exemple de Rapport � �tablir pour les d�pendances s�mantiques entre les colonnes d'une table:

--DR_SemanticDependencies
--+--------------+---------------------+-------------+------------+
--+   LEFTCOL    + SemanticDependency  +   RIGHTCOL  + Percentage +
--+--------------+---------------------+-------------+------------+
--+  COL3        +   -EQ-              +  COL4       + 100 %      +
--+  COL1        +   -DF-              +  COL2       + p1 %       +
--+  COL1        +   -DF-              +  COL5       + p2 %       +
--+  COL2        +   -DF-              +  COL5       + p3 %       +
--+  COL1+COL2   +   -DF-              +  COL5       + p4 %       + -- Cette ligne peut �tre d�duite !
--+--------------+---------------------+-------------+------------+

/*

D�veloppez le n�cessaire pour remplir la m�ta-table (les m�ta-donn�es) de nom DR_SemanticDependencies
Avec pour la colonne COL1 : p% �gal (1-X/Y)%
X=    SELECT SUM(NBROCC) FROM VERIFDF_VP WHERE NBROCC > 1;	
Y=    SELECT COUNT(*) FROM TABLACONTROLER ;	

*/

-- Testez vos Scripts sur tous les fichiers CSV 1, 2, 2, 4 et 5
-- Etablissez tous les rapports sur les donn�es (Les DR_...)
-- Validez votre projet iDQMS ......
-- BONNE ANNEE 2020 ; BONNE ANNEE 2020 ; BONNE ANNEE 2020

--=================================================================================================
--=================================================================================================
--=================================================================================================
--= Manipulation intelligente des donn�es : D�pendances Fonctionnelles   === DF ======== FIN ======
--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================

