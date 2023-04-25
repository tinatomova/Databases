USE master
GO
if exists (select * from sysdatabases where name='museum')
DROP DATABASE museum
GO

CREATE DATABASE museum
GO
USE museum
GO

----- Tables -----
CREATE TABLE MUSEUM (
 NAME VARCHAR(100) NOT NULL ,
 ADDRESS VARCHAR(100) NOT NULL ,
 WEBSITE VARCHAR(50) NOT NULL ,
 ESTABLISHED INT NOT NULL ,
 TYPE VARCHAR(20) NOT NULL ,
 EMPLOYEE INT
);

CREATE TABLE EXHIBITION (
 NAME VARCHAR(100) NOT NULL ,
 MUSEUM_NAME VARCHAR(100) NOT NULL ,
 FLOOR INT ,
 AUDITORIUM VARCHAR(4) NOT NULL ,
 EXHIBIT_COUNT INT
);

CREATE TABLE EXHIBIT (
 ID INT IDENTITY(1,1) NOT NULL ,
 NAME VARCHAR(100) NOT NULL ,
 MUSEUM_NAME VARCHAR(100) NOT NULL ,
 EXHIBITION_NAME VARCHAR(100) NOT NULL ,
 YEAR INT ,
 AGE CHAR(2) ,
 CONDITION INT ,
 COUNTRY VARCHAR(20) NOT NULL 
);

CREATE TABLE EMPLOYEE (
 ID INT IDENTITY(1,1) NOT NULL ,
 NAME VARCHAR(50) NOT NULL ,
 MUSEUM_NAME VARCHAR(100) NOT NULL ,
 POSITION VARCHAR(50) NOT NULL ,
 TELEPHONE CHAR(10) NOT NULL ,
 SALARY INT
);

CREATE TABLE ITEM (
ID INT IDENTITY(1,1) NOT NULL,
 MUSEUM_NAME VARCHAR(100) NOT NULL ,
 COUNT INT ,
 PRICE FLOAT,
 TYPE VARCHAR(20) NOT NULL 
);

CREATE TABLE VISITORS (
 DATE VARCHAR(7) NOT NULL ,
 MUSEUM_NAME VARCHAR(100) NOT NULL ,
 VISITORS_COUNT INT
);

----- Constraints -----
ALTER TABLE MUSEUM ADD	CONSTRAINT PK_MUSEUM PRIMARY KEY(NAME);
ALTER TABLE EXHIBITION ADD	CONSTRAINT PK_EXHIBITION PRIMARY KEY(NAME, MUSEUM_NAME);
ALTER TABLE EXHIBITION ADD CONSTRAINT FK_EXHIBITION FOREIGN KEY(MUSEUM_NAME) REFERENCES MUSEUM(NAME);
ALTER TABLE EXHIBIT ADD	CONSTRAINT PK_EXHIBIT PRIMARY KEY(ID);
ALTER TABLE EXHIBIT ADD CONSTRAINT FK_EXHIBIT_EXHIBITION FOREIGN KEY(EXHIBITION_NAME, MUSEUM_NAME) REFERENCES EXHIBITION(NAME, MUSEUM_NAME);

ALTER TABLE EMPLOYEE ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY(ID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE FOREIGN KEY(MUSEUM_NAME) REFERENCES MUSEUM(NAME);
ALTER TABLE ITEM ADD	CONSTRAINT PK_ITEM PRIMARY KEY(ID, MUSEUM_NAME);
ALTER TABLE ITEM ADD CONSTRAINT FK_ITEM FOREIGN KEY(MUSEUM_NAME) REFERENCES MUSEUM(NAME);
ALTER TABLE VISITORS ADD	CONSTRAINT PK_VISITORS PRIMARY KEY(DATE, MUSEUM_NAME);
ALTER TABLE VISITORS ADD CONSTRAINT FK_VISITORS FOREIGN KEY(MUSEUM_NAME) REFERENCES MUSEUM(NAME);

CREATE INDEX IDX_EXHIBIT
ON EXIBIT (MUSEUM_NAME, EXHIBITION_NAME);

CREATE INDEX IDX_EMPLOYEE
ON EMPLOYEE (POSITION);

----- MUSEUM -----
INSERT INTO MUSEUM
  VALUES ('Louvre', 'Musee du Louvre, 75001 Paris', 'www.louvre.fr', 1793, 'art, historic', 2200);
INSERT INTO MUSEUM
  VALUES ('British Museum', 'Great Russell Street, London', 'www.britishmuseum.org', 1753, 'art, historic', 1000);
INSERT INTO MUSEUM
  VALUES ('Metropolitan Museum of Art', '1000 Fifth Avenue New York', 'www.metmuseum.org', 1870, 'art', 1600);
INSERT INTO MUSEUM
  VALUES ('Hermitage Museum', '34 Palace Embankment, Dvortsovy Municipal Okrug, Central District, Saint Petersburg', 'www.hermitagemuseum.org', 1764, 'art', 444);

----- EXHIBITION -----
INSERT INTO EXHIBITION
   VALUES ('Egyptian antiquities', 'Louvre', 0, '102B', 50000)
INSERT INTO EXHIBITION
   VALUES ('Greek, Etruscan, and Roman', 'Louvre', 1, '65C', 40000)
INSERT INTO EXHIBITION
   VALUES ('Painting', 'Louvre', 2, '306A', 6000)
INSERT INTO EXHIBITION
   VALUES ('Islamic art', 'Louvre', 0, '72B', 7500)

INSERT INTO EXHIBITION
   VALUES ('Department of Egypt and Sudan', 'British Museum', 3, '50', 100000)
INSERT INTO EXHIBITION
   VALUES ('Department of Greece and Rome', 'British Museum', 1, '4', 100000)
INSERT INTO EXHIBITION
   VALUES ('Department of Prints and Drawings', 'British Museum', 3, '50', 50000)

INSERT INTO EXHIBITION
   VALUES ('Arts of Africa, Oceania, and the Americas', 'Metropolitan Museum of Art', 1, '96A', 11000)
INSERT INTO EXHIBITION
   VALUES ('Asian art', 'Metropolitan Museum of Art', 2, '6', 35000)
INSERT INTO EXHIBITION
   VALUES ('Costume Institute', 'Metropolitan Museum of Art', 0, '20', 35000)

INSERT INTO EXHIBITION
   VALUES ('Russian art', 'Hermitage Museum', 1, '10', 5000)
INSERT INTO EXHIBITION
   VALUES ('French Neoclassical, Impressionist, and post-Impressionist art', 'Hermitage Museum', 4, '50B', 4000)
INSERT INTO EXHIBITION
   VALUES ('Modern and German Romantic', 'Hermitage Museum', 3, '32C',6000)


----- EXHIBIT -----
INSERT INTO EXHIBIT
   VALUES ('The Gebel el-Arak Knife', 'Louvre', 'Egyptian antiquities', 3300, 'BC', 4, 'Ancient Egypt')
INSERT INTO EXHIBIT
   VALUES ('The Seated Scribe', 'Louvre', 'Egyptian antiquities', 2613, 'BC', 2, 'Ancient Egypt')
INSERT INTO EXHIBIT
   VALUES ('The Great Sphinx of Tanis', 'Louvre', 'Egyptian antiquities', 2600, 'BC', 3, 'Ancient Egypt')
INSERT INTO EXHIBIT
   VALUES ('Akhenaten and Nefertiti', 'Louvre', 'Egyptian antiquities', 1345, 'BC', 4, 'Ancient Egypt')

INSERT INTO EXHIBIT
   VALUES ('Cycladic head of a woman', 'Louvre', 'Greek, Etruscan, and Roman', 2700, 'BC', 2, 'Ancient Greece')
INSERT INTO EXHIBIT
   VALUES ('Volute krater that depicts Actaeons death', 'Louvre', 'Greek, Etruscan, and Roman', 450, 'BC', 2, 'Ancient Greece')
INSERT INTO EXHIBIT
   VALUES ('The Winged Victory of Samothrace', 'Louvre', 'Greek, Etruscan, and Roman', 200, 'BC', 4, 'Ancient Greece')
INSERT INTO EXHIBIT
   VALUES (' Venus de Milo', 'Louvre', 'Greek, Etruscan, and Roman', 130, 'BC', 3, 'Ancient Greece')

INSERT INTO EXHIBIT
   VALUES ('"Mona Lisa" by Leonardo da Vinci', 'Louvre', 'Painting', 1503, 'AD', 1, 'Italy')
INSERT INTO EXHIBIT
   VALUES ('"Oath of the Horatii" by Jacques-Louis David', 'Louvre', 'Painting', 1784, 'AD', 2, 'France')
INSERT INTO EXHIBIT
   VALUES ('"Diana after the Bath" by Francois Boucher', 'Louvre', 'Painting', 1742, 'AD', 1, 'France')
INSERT INTO EXHIBIT
   VALUES ('"Spring" by Giuseppe Arcimboldo', 'Louvre', 'Painting', 1573, 'AD', 2, 'Italy')

INSERT INTO EXHIBIT
   VALUES ('The Pyxis of al-Mughira', 'Louvre', 'Islamic art', 968, 'AD', 1, 'Spain')
INSERT INTO EXHIBIT
   VALUES ('Iranian tile with bismillah', 'Louvre', 'Islamic art', 1300, 'AD', 2, 'Iraq')
INSERT INTO EXHIBIT
   VALUES ('The Baptistere de Saint Louis by Muhammad ibn al-Zayn', 'Louvre', 'Islamic art', 1320, 'AD', 3, 'Egypt')

INSERT INTO EXHIBIT
   VALUES ('"Pond in a Garden" from the Tomb of Nebamun', 'British Museum', 'Department of Egypt and Sudan', 1350, 'BC', 5, 'Ancient Egypt')
INSERT INTO EXHIBIT
   VALUES ('Rosetta Stone', 'British Museum', 'Department of Egypt and Sudan', 196, 'BC', 3, 'Ancient Egypt')
INSERT INTO EXHIBIT
   VALUES ('Colossal red granite statue of Amenhotep III', 'British Museum', 'Department of Egypt and Sudan', 1350, 'BC', 2, 'Ancient Egypt')

INSERT INTO EXHIBIT
   VALUES ('Reconstruction of the Nereid Monument', 'British Museum', 'Department of Greece and Rome', 390, 'BC', 4, 'Ancient Greece')
INSERT INTO EXHIBIT
   VALUES ('Parthenon marbles from the Acropolis of Athens', 'British Museum', 'Department of Greece and Rome', 447, 'BC', 5, 'Ancient Greece')
INSERT INTO EXHIBIT
   VALUES ('Mausoleum at Halicarnassus', 'British Museum', 'Department of Greece and Rome', 450, 'BC', 2, 'Ancient Greece')

INSERT INTO EXHIBIT
   VALUES ('Rogier van der Weyden - Portrait of a Young Woman', 'British Museum', 'Department of Prints and Drawings', 1440, 'AD', 4, 'Netherlands')
INSERT INTO EXHIBIT
   VALUES ('Francisco de Zurbar?n - Head of a monk', 'British Museum', 'Department of Prints and Drawings', 1625, 'AD', 2, 'Spain')
INSERT INTO EXHIBIT
   VALUES ('Hans Holbein the Younger - Portrait of Anne Boleyn', 'British Museum', 'Department of Prints and Drawings', 1536, 'AD', 3, 'Germany')
INSERT INTO EXHIBIT
   VALUES ('Albrecht D?rer - Drawing of a walrus', 'British Museum', 'Department of Prints and Drawings', 1521, 'AD', 2, 'Germany')
INSERT INTO EXHIBIT
   VALUES ('Vincent van Gogh - Man Digging in the Orchard', 'British Museum', 'Department of Prints and Drawings', 1883, 'AD', 1, 'Netherlands')

INSERT INTO EXHIBIT
   VALUES ('Benin ivory mask', 'Metropolitan Museum of Art', 'Arts of Africa, Oceania, and the Americas', 1500, 'AD', 2, 'Nigeria')

INSERT INTO EXHIBIT
   VALUES ('Lord Neminatha', 'Metropolitan Museum of Art', 'Asian art', 600, 'AD', 2, 'India')
INSERT INTO EXHIBIT
   VALUES ('Bronze Chola Statue of Nataraja', 'Metropolitan Museum of Art', 'Asian art', 1000, 'AD', 1, 'India')
INSERT INTO EXHIBIT
   VALUES ('Vishnu', 'Metropolitan Museum of Art', 'Asian art', 950, 'AD', 2, 'India')
INSERT INTO EXHIBIT
   VALUES ('Celestial dancer (Apsara)', 'Metropolitan Museum of Art', 'Asian art', 1100, 'AD', 4, 'India')

INSERT INTO EXHIBIT
   VALUES ('Robe ? la fran?aise', 'Metropolitan Museum of Art', 'Costume Institute', 1740, 'AD', 3, 'France')
INSERT INTO EXHIBIT
   VALUES ('A Givenchy dragon gown', 'Metropolitan Museum of Art', 'Costume Institute', 2015, 'AD', 1, 'France')
INSERT INTO EXHIBIT
   VALUES ('Rainbow cape by Christopher Bailey', 'Metropolitan Museum of Art', 'Costume Institute', 2019, 'AD', 1, 'Britain')
INSERT INTO EXHIBIT
   VALUES ('Comme des Gar?ons dress', 'Metropolitan Museum of Art', 'Costume Institute', 2017, 'AD', 1, 'France')

INSERT INTO EXHIBIT
   VALUES ('Caricature: Russian Peasant beating German Soldiers', 'Hermitage Museum', 'Russian art', 1914, 'AD', 1, 'Russia')
INSERT INTO EXHIBIT
   VALUES ('The Russian Embassy in Constantinople', 'Hermitage Museum', 'Russian art', 1700, 'AD', 2, 'Russia')
INSERT INTO EXHIBIT
   VALUES ('Portrait of Konstantin D. Kavelin (1818-1885)', 'Hermitage Museum', 'Russian art', 1886, 'AD', 1, 'Russia')
INSERT INTO EXHIBIT
   VALUES ('Brooch Decorated with a Scene from a Russian Fairi Tale', 'Hermitage Museum', 'Russian art', 1960, 'AD', 2, 'Russia')
INSERT INTO EXHIBIT
   VALUES ('The Image of the Musketeer of the Russian Guard Infantry', 'Hermitage Museum', 'Russian art', 1818, 'AD', 3, 'Russia')
INSERT INTO EXHIBIT
   VALUES ('Sarafan', 'Hermitage Museum', 'Russian art', 1850, 'AD', 1, 'Russia')

INSERT INTO EXHIBIT
   VALUES ('Garden at Bordighera, Impression of Morning by Claude Monet', 'Hermitage Museum', 'French Neoclassical, Impressionist, and post-Impressionist art', 1884, 'AD', 2, 'France')
INSERT INTO EXHIBIT
   VALUES ('Arena at Arles by Van Gogh', 'Hermitage Museum', 'French Neoclassical, Impressionist, and post-Impressionist art', 1890, 'AD', 1, 'France')
INSERT INTO EXHIBIT
   VALUES ('In the Garden by Renoir', 'Hermitage Museum', 'French Neoclassical, Impressionist, and post-Impressionist art', 1885, 'AD', 1, 'France')
INSERT INTO EXHIBIT
   VALUES ('Landscape at Beaulieu by Renoir', 'Hermitage Museum', 'French Neoclassical, Impressionist, and post-Impressionist art', 1899, 'AD', 2, 'France')

INSERT INTO EXHIBIT
   VALUES ('Portrait of Nikolay Borisovich Yusupov by Italian Vincenzo Petrocelli', 'Hermitage Museum', 'Modern and German Romantic', 1851, 'AD', 1, 'Italy')
INSERT INTO EXHIBIT
   VALUES ('Boar Hunt', 'Hermitage Museum', 'Modern and German Romantic', 1700, 'AD', 2, 'Germany')
INSERT INTO EXHIBIT
   VALUES ('Rebecca and Eliezer', 'Hermitage Museum', 'Modern and German Romantic', 1700, 'AD', 1, 'Germany')
INSERT INTO EXHIBIT
   VALUES ('Old Man Counting on His Fingers', 'Hermitage Museum', 'Modern and German Romantic', 1700, 'AD', 1, 'Germany')


----- EMPLOYEE -----
INSERT INTO EMPLOYEE
   VALUES ('Jean-Luc Martinez', 'Louvre', 'Director', 3396321478, 11630)
INSERT INTO EMPLOYEE
   VALUES ('Marie-Laure de Rochebrune', 'Louvre', 'Curator', 3387954623, 5320)
INSERT INTO EMPLOYEE
   VALUES ('Adel Ziane', 'Louvre', 'Spokesman', 3389562314, 3950)
INSERT INTO EMPLOYEE
   VALUES ('Laurence des Cars', 'Louvre', 'Curator', 3365789546, 5320)
INSERT INTO EMPLOYEE
   VALUES ('Guillaume Faroult', 'Louvre', 'Curator', 3365498253, 5320)

INSERT INTO EMPLOYEE
   VALUES ('Hartwig Fischer', 'British Museum', 'Director', 4496356478, 18660)
INSERT INTO EMPLOYEE
   VALUES ('George Osborne', 'British Museum', 'Chair', 4496321479, 9600)
INSERT INTO EMPLOYEE
   VALUES ('Irving Finkel', 'British Museum', 'Curator', 4495124863, 3260)
INSERT INTO EMPLOYEE
   VALUES ('Ian Jenkins', 'British Museum', 'Curator', 4475326842, 3260)
INSERT INTO EMPLOYEE
   VALUES ('Jago Cooper', 'British Museum', 'Curator', 4496321495, 3260)

INSERT INTO EMPLOYEE
   VALUES ('Daniel Weiss', 'Metropolitan Museum of Art', 'President', 2129568742, 22600)
INSERT INTO EMPLOYEE
   VALUES ('Max Hollein', 'Metropolitan Museum of Art', 'Director', 2124568721, 17480)
INSERT INTO EMPLOYEE
   VALUES ('Anna Wintour', 'Metropolitan Museum of Art', 'Board member', 2123964854, 11700)
INSERT INTO EMPLOYEE
   VALUES ('Candace Beinecke', 'Metropolitan Museum of Art', 'Chair', 2125496852, 8960)
INSERT INTO EMPLOYEE
   VALUES ('Tony James', 'Metropolitan Museum of Art', 'Chair', 2123475832, 8960)
INSERT INTO EMPLOYEE
   VALUES ('Sharon Cott', 'Metropolitan Museum of Art', 'Senior Vice President', 2126486215, 15410)
INSERT INTO EMPLOYEE
   VALUES ('Patricia Norby', 'Metropolitan Museum of Art', 'Curator', 2123697895, 6920)
INSERT INTO EMPLOYEE
   VALUES ('Denise Murrell', 'Metropolitan Museum of Art', 'Curator', 2121476543, 6920)
INSERT INTO EMPLOYEE
   VALUES ('Carmen Bambach', 'Metropolitan Museum of Art', 'Curator', 2129631593, 6920)

INSERT INTO EMPLOYEE
   VALUES ('Mikhail Piotrovsky', 'Hermitage Museum', 'Director', 7986598326, 8500)
INSERT INTO EMPLOYEE
   VALUES ('Thierry Morel', 'Hermitage Museum', 'Curator', 7785842157, 3200)
INSERT INTO EMPLOYEE
   VALUES ('Torkom Demirjian', 'Hermitage Museum', 'Chair', 7969689325, 5000)

----- ITEM -----
INSERT INTO ITEM
   VALUES ('Louvre', 10000, 5, 'audio guide')
INSERT INTO ITEM
   VALUES ('Louvre', NULL, 20, 'ticket')
INSERT INTO ITEM
   VALUES ('Louvre', 1000000, 4, 'souvenir')
INSERT INTO ITEM
   VALUES ('Louvre', 250000, 2, 'map')

INSERT INTO ITEM
   VALUES ('British Museum', NULL, 22, 'skip the line ticket')
INSERT INTO ITEM
   VALUES ('British Museum', NULL, 18, 'ticket')
INSERT INTO ITEM
   VALUES ('British Museum', 950000, 3, 'souvenir')
INSERT INTO ITEM
   VALUES ('British Museum', 8000, 7, 'audio guide')

INSERT INTO ITEM
   VALUES ('Metropolitan Museum of Art', 12000, 5, 'audio guide')
INSERT INTO ITEM
   VALUES ('Metropolitan Museum of Art', NULL, 25, 'ticket')
INSERT INTO ITEM
   VALUES ('Metropolitan Museum of Art', 900000, 7, 'souvenir')


INSERT INTO ITEM
   VALUES ('Hermitage Museum', NULL, 15, 'adult ticket')
INSERT INTO ITEM
   VALUES ('Hermitage Museum', 750000, 5, 'souvenir')
INSERT INTO ITEM
   VALUES ('Hermitage Museum', 100000, 1, 'postcard')
INSERT INTO ITEM
   VALUES ('Hermitage Museum', NULL, 12, 'student ticket')


----- VISITORS -----
INSERT INTO VISITORS
   VALUES ('2022-01', 'Louvre', 833951)
INSERT INTO VISITORS
   VALUES ('2022-02', 'Louvre', 860881)
INSERT INTO VISITORS
   VALUES ('2022-03', 'Louvre', 810784)
INSERT INTO VISITORS
   VALUES ('2022-04', 'Louvre', 856321)
INSERT INTO VISITORS
   VALUES ('2022-05', 'Louvre', 875221)

INSERT INTO VISITORS
   VALUES ('2022-01', 'British Museum', 522685)
INSERT INTO VISITORS
   VALUES ('2022-02', 'British Museum', 496333)
INSERT INTO VISITORS
   VALUES ('2022-03', 'British Museum', 501698)
INSERT INTO VISITORS
   VALUES ('2022-04', 'British Museum', 499625)
INSERT INTO VISITORS
   VALUES ('2022-05', 'British Museum', 510987)

INSERT INTO VISITORS
   VALUES ('2022-01', 'Metropolitan Museum of Art', 583147)
INSERT INTO VISITORS
   VALUES ('2022-02', 'Metropolitan Museum of Art', 503987)
INSERT INTO VISITORS
   VALUES ('2022-03', 'Metropolitan Museum of Art', 489698)
INSERT INTO VISITORS
   VALUES ('2022-04', 'Metropolitan Museum of Art', 526987)
INSERT INTO VISITORS
   VALUES ('2022-05', 'Metropolitan Museum of Art', 596874)

INSERT INTO VISITORS
   VALUES ('2022-01', 'Hermitage Museum', 350879)
INSERT INTO VISITORS
   VALUES ('2022-02', 'Hermitage Museum', 325698)
INSERT INTO VISITORS
   VALUES ('2022-03', 'Hermitage Museum', 334751)
INSERT INTO VISITORS
   VALUES ('2022-04', 'Hermitage Museum', 368521)
INSERT INTO VISITORS
   VALUES ('2022-05', 'Hermitage Museum', 396587)

