DROP TABLE Categorie;
DROP TABLE Reteta;
DROP TABLE Set_ingrediente;
DROP TABLE Ingredient;

--9.01
--a)
CREATE TABLE Categorie(
categ_id NUMBER(4),
tip VARCHAR2(50)
);
--b)
CREATE TABLE Reteta(
reteta_id NUMBER(4),
nume VARCHAR2(50),
descriere VARCHAR2(600),
categ_id NUMBER(4),
vegetariana VARCHAR2(1),
timp_preparare NUMBER(3),
portii NUMBER
);
--c)
CREATE TABLE Set_ingrediente(
reteta_id NUMBER(4),
ingred_id NUMBER(4),
cantitate NUMBER(4),
um VARCHAR2(10),
comentarii VARCHAR2(50)
);
--d)
CREATE TABLE Ingredient(
ingred_id NUMBER(4),
ingredient VARCHAR2(25)
);

ALTER TABLE Reteta
ADD CONSTRAINT vegetariana_chk CHECK(vegetariana='D' OR vegetariana='N');

ALTER TABLE Set_ingrediente
ADD CONSTRAINT um_chk CHECK(um='gr' OR um='ml' OR um='buc' OR um='lingura'
OR um='lingurita' OR um='cana');

--e)
ALTER TABLE Categorie
ADD CONSTRAINT categorie_id_pk PRIMARY KEY(categ_id);

ALTER TABLE Reteta
ADD CONSTRAINT reteta_id_pk PRIMARY KEY(reteta_id);

ALTER TABLE Ingredient
ADD CONSTRAINT ingredient_pk PRIMARY KEY(ingred_id);

ALTER TABLE Set_ingrediente
ADD CONSTRAINT reteta_ingredient_pk PRIMARY KEY(reteta_id,ingred_id);

ALTER TABLE Reteta
ADD CONSTRAINT reteta_categ_fk FOREIGN KEY(categ_id) REFERENCES Categorie(categ_id);




--f)
ALTER TABLE Reteta
ADD sursa VARCHAR(50);



INSERT INTO Categorie
VALUES(1,'MIC DEJUN');
INSERT INTO Categorie
VALUES(2,'FEL PRINCIPAL');
INSERT INTO Categorie
VALUES(3,'CINA');

INSERT INTO Reteta
VALUES(112,'Supa crema de ciuperci','Fierbeti ciupercile si morcovii in 2 litrii de apa cu sare. La final, mixati cu blenderul.',2,'D',20,3,NULL);

INSERT INTO Reteta
VALUES(101,'Ciorba de pui','Punem puiul taiat si legumele si sarea in apa si lasam sa fiarba 15 minute.',2,'N',15,4,'Chef Albert');

INSERT INTO Reteta
VALUES(102,'Mamaliga cu ciuperci si cu pui','Se taie si se pun ciupercile si puiul in tigaie.Se servesc cu  mamaliga.',2,'N',70,3,NULL);

INSERT INTO Reteta
VALUES(104,'Cartofi prajiti cu usturoi','Se adauga usturoiul si cartofii in ulei timp de 5-10 minute. Se pune sare.',3,'D',10,2,NULL);

INSERT INTO Reteta
VALUES(107,'Omleta cu cascaval','Bate ouale cu sare.Adauga cascaval. Prepara omleta, pe ambele parti timp de 10 minute.',1,'D',10,2,'Chef Mario');

INSERT INTO Reteta
VALUES(108,'Piept de pui la gratar','Taiati felii puiul, adaugati sare peste el. Pregatiti gratarul si rumeniti carnea.',3,'N',80,3,'Helena Rizo');


INSERT INTO Set_ingrediente
VALUES(112,200,700,'gr','spalati bine inainte');
INSERT INTO Set_ingrediente
VALUES(112,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(112,111,4,'lingura','plina');
INSERT INTO Set_ingrediente
VALUES(112,1,2,'buc',NULL);
INSERT INTO Set_ingrediente
VALUES(112,204,100,'gr','curatati bine de coaja');
INSERT INTO Set_ingrediente
VALUES(112,201,250,'gr','curatati bine de coaja');


INSERT INTO Set_ingrediente
VALUES(101,204,500,'gr','curatati bine de coaja');
INSERT INTO Set_ingrediente
VALUES(101,202,2,'buc','taiat felii mici');
INSERT INTO Set_ingrediente
VALUES(101,1,3,'buc',NULL);
INSERT INTO Set_ingrediente
VALUES(101,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(101,111,3,'lingura','plina');

INSERT INTO Set_ingrediente
VALUES(102,205,1,'cana',NULL);
INSERT INTO Set_ingrediente
VALUES(102,200,500,'gr','spalati bine inainte');
INSERT INTO Set_ingrediente
VALUES(102,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(102,202,2,'buc','taiat felii mici');
INSERT INTO Set_ingrediente
VALUES(102,111,1,'lingura','plina');

INSERT INTO Set_ingrediente
VALUES(104,201,250,'gr','curatati bine de coaja');
INSERT INTO Set_ingrediente
VALUES(104,1,4,'buc',NULL);
INSERT INTO Set_ingrediente
VALUES(104,111,1,'lingura','plina');

INSERT INTO Set_ingrediente
VALUES(107,209,5,'buc',NULL);
INSERT INTO Set_ingrediente
VALUES(107,214,200,'gr','ras');
INSERT INTO Set_ingrediente
VALUES(107,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(107,111,2,'lingura','plina');

INSERT INTO Set_ingrediente
VALUES(108,202,2,'buc','taiat felii mici');
INSERT INTO Set_ingrediente
VALUES(108,111,2,'lingura','plina');


INSERT INTO Ingredient
VALUES(200,'ciuperci');
INSERT INTO Ingredient
VALUES(201,'cartofi');
INSERT INTO Ingredient
VALUES(202,'pui');
INSERT INTO Ingredient
VALUES(203,'pastrav');
INSERT INTO Ingredient
VALUES(204,'morcovi');
INSERT INTO Ingredient
VALUES(205,'mamaliga');
INSERT INTO Ingredient
VALUES(206,'ceapa');
INSERT INTO Ingredient
VALUES(112,'smantana');
INSERT INTO Ingredient
VALUES(111,'sare');
INSERT INTO Ingredient
VALUES(1,'usturoi');
INSERT INTO Ingredient
VALUES(2,'spaghetti');
INSERT INTO Ingredient
VALUES(3,'gem');
INSERT INTO Ingredient
VALUES(209,'oua');
INSERT INTO Ingredient
VALUES(4,'lapte');
INSERT INTO Ingredient
VALUES(5,'unt');
INSERT INTO Ingredient
VALUES(210,'carne');
INSERT INTO Ingredient
VALUES(214,'cascaval');
​