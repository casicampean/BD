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

ALTER TABLE Set_ingrediente
ADD CONSTRAINT reteta_id_fk FOREIGN KEY(reteta_id) REFERENCES Reteta(reteta_id);

ALTER TABLE Set_ingrediente
ADD CONSTRAINT ingred_id_fk FOREIGN KEY(ingred_id) REFERENCES Ingredient(ingred_id);



--f)
ALTER TABLE Reteta
ADD sursa VARCHAR(50);
--Verificare
DESCRIBE Categorie;
DESCRIBE Reteta;
DESCRIBE Set_ingrediente;
DESCRIBE Ingredient;

--9.02
--a)
ALTER TABLE Set_ingrediente
ADD CONSTRAINT cantitate_chk CHECK(cantitate > 0);
--Verificare
INSERT INTO Set_ingrediente
VALUES(299,200,-20,'gr','spalati bine inainte');
--b)
ALTER TABLE Reteta
ADD CONSTRAINT retata_chk CHECK((vegetariana='D' AND timp_preparare<30) OR vegetariana='N');
--Verificare
INSERT INTO Reteta
VALUES(299,'Cartofi prajiti cu usturoi','Se adauga usturoiul in ulei, 
si se caleste totul 1 minut. Se adauga cartofii, se prajesc 5-10 minute. 
La final se rade usturoi si se pune sare.',3,'D',50,2,NULL);



INSERT INTO Categorie
VALUES(1,'MIC DEJUN');
INSERT INTO Categorie
VALUES(2,'FEL PRINCIPAL');
INSERT INTO Categorie
VALUES(3,'CINA');
--Verificare
SELECT * FROM Categorie;
INSERT INTO Reteta
VALUES(112,'Supa crema de ciuperci','Fierbeti ciupercile cu cartofii si
morcovii timp de 20 de minute in 2 litrii de apa cu sare. Dupa ce au fiert 
legumele, mixati supa cu un blender si adaugati smantana dulce.',2,'D',20,3,NULL);

INSERT INTO Reteta
VALUES(101,'Ciorba de pui','Spalam pieptul de pui si il taiem cubulete. 
In ulei punem pieptul de pui si amestecam usor pana se albeste pe toate
 partile. Adaugam morcovul ras si punem sare. Il lasam 2-3 minute sa se inmoaie 
si stingem cu apa. Lasam sa fiarba, adaugam apa, mai dam cateva clocote 
si oprim focul.Se serveste la final cu smantana.',2,'N',15,4,'Chef Albert');

INSERT INTO Reteta
VALUES(102,'Mamaliga cu ciuperci si cu pui','Pieptul de pui se taie 
cubulete. Se pun ciupercile si puiul in tigaie timp de 5 minute. 
Se prepara mamaliga. Se servesc la final cu smantana.',2,'N',70,3,NULL);

INSERT INTO Reteta
VALUES(104,'Cartofi prajiti cu usturoi','Se adauga usturoiul in ulei, 
si se caleste totul 1 minut. Se adauga cartofii, se prajesc 5-10 minute. 
La final se rade usturoi si se pune sare.',3,'D',10,2,NULL);

INSERT INTO Reteta
VALUES(107,'Omleta cu cascaval','Bate ouale cu sare. Da pe razatoare cascavalul. 
Jumatate pune-l in ouale batute impreuna cu smantana, amesteca bine. Prepara omleta, 
pe ambele parti. Cand este aproape gata, pune in mijlocul ei restul 
de cascaval, mai las-o in tigaie pentru 2 minute, cate unul pe fiecare 
parte, pana ce se topeste cascavalul.',1,'D',10,2,'Chef Mario');

INSERT INTO Reteta
VALUES(108,'Piept de pui la gratar','Taiati felii puiul, adaugati sare peste
el. Pregatiti gratarul si rumniti carnea pana cand este gata.',3,'N',80,3,'Helena Rizo');
--Verificare
SELECT * FROM Reteta;

INSERT INTO Set_ingrediente
VALUES(112,200,700,'gr','spalati bine inainte');
INSERT INTO Set_ingrediente
VALUES(112,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(112,111,4,'lingurita',NULL);
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
VALUES(101,111,3,'lingura',NULL);

INSERT INTO Set_ingrediente
VALUES(102,205,1,'cana',NULL);
INSERT INTO Set_ingrediente
VALUES(102,200,500,'gr','spalati bine inainte');
INSERT INTO Set_ingrediente
VALUES(102,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(102,202,2,'buc','taiat felii mici');
INSERT INTO Set_ingrediente
VALUES(102,111,1,'lingura',NULL);

INSERT INTO Set_ingrediente
VALUES(104,201,250,'gr','curatati bine de coaja');
INSERT INTO Set_ingrediente
VALUES(104,1,4,'buc',NULL);
INSERT INTO Set_ingrediente
VALUES(104,111,1,'lingura',NULL);

INSERT INTO Set_ingrediente
VALUES(107,209,5,'buc',NULL);
INSERT INTO Set_ingrediente
VALUES(107,214,200,'gr','ras');
INSERT INTO Set_ingrediente
VALUES(107,112,250,'ml',NULL);
INSERT INTO Set_ingrediente
VALUES(107,111,2,'lingura',NULL);

INSERT INTO Set_ingrediente
VALUES(108,202,2,'buc','taiat felii mici');
INSERT INTO Set_ingrediente
VALUES(108,111,2,'lingura',NULL);
--Verificare
SELECT * FROM Set_ingrediente;

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
--Verificare
SELECT * FROM Ingredient;
--9.03
--a)
SELECT nume, descriere
FROM Reteta
WHERE vegetariana='N' AND timp_preparare BETWEEN 60 AND 120;

--b)
SELECT *
FROM Set_ingrediente
WHERE comentarii IS NULL;

--9.04
--a)
SELECT  DISTINCT '(' || s1.reteta_id || ', ' || s2.reteta_id || ')' AS "Retete"
FROM set_ingrediente s1 JOIN set_ingrediente s2
ON s1.reteta_id != s2.ingred_id
WHERE s1.ingred_id=1 AND s2.ingred_id=1 AND s1.reteta_id < s2.reteta_id;

--b)
SELECT nume, descriere
FROM reteta r
JOIN set_ingrediente s ON r.reteta_id=s.reteta_id
JOIN ingredient i ON s.ingred_id=i.ingred_id
WHERE i.ingredient='ciuperci';

--9.05
--a)
SELECT nume, descriere, timp_preparare
FROM Reteta
WHERE vegetariana='N' and
timp_preparare < ANY(SELECT timp_preparare 
FROM reteta WHERE vegetariana = 'D');

--b)
SELECT ingredient
FROM Ingredient
WHERE ingred_id IN
(SELECT ingred_id 
FROM Set_ingrediente
WHERE cantitate=(SELECT MAX(cantitate) 
FROM Set_ingrediente));

--9.06
--a)
SELECT MIN( timp_preparare) AS "Timp de preparare minim", 
MAX(timp_preparare) AS "Timp de preparare maxim"
FROM Reteta;

--b)
SELECT AVG(cantitate) AS "Cantitate medie usturoi"
FROM Set_ingrediente
WHERE ingred_id=(SELECT ingred_id FROM ingredient 
WHERE ingredient='usturoi');

--9.07
--a)
INSERT INTO Ingredient
VALUES(212,'muschi de vita');
INSERT INTO Ingredient
VALUES(213,'mustar Dijon');
INSERT INTO Reteta
VALUES(260,'Beef Stroganoff',NULL,2,'N',NULL,2,NULL);
INSERT INTO Set_ingrediente
VALUES(260,212,500,'gr',NULL);
INSERT INTO Set_ingrediente
VALUES(260,213,1,'lingura',NULL);
INSERT INTO Set_ingrediente
VALUES(260,112,250,'ml',NULL);
--Verificare
SELECT * 
FROM Ingredient;

SELECT * 
FROM Reteta
WHERE reteta_id=260;

SELECT * 
FROM Set_ingrediente
WHERE reteta_id=260;


--b)
SELECT * 
FROM Ingredient;

DELETE FROM Ingredient
WHERE ingred_id NOT IN(SELECT ingred_id FROM set_ingrediente);
--Verificare
SELECT * 
FROM Ingredient;
--c)
--Verificare
UPDATE Set_ingrediente
SET um='lingurita'
WHERE ingred_id=111 AND reteta_id=112;

SELECT *
FROM Set_ingrediente
WHERE ingred_id=111 AND reteta_id=112;

UPDATE Set_ingrediente
SET um='lingura'
WHERE ingred_id=111 AND reteta_id=112;

--Verificare
SELECT *
FROM Set_ingrediente
WHERE ingred_id=111 AND reteta_id=112;

--9.08
--a)
CREATE OR REPLACE TRIGGER set_ingrediente_um_trigg
  BEFORE INSERT ON set_ingrediente
  FOR EACH ROW
BEGIN
  IF :NEW.um='lingura' AND :NEW.cantitate < 5 THEN
   :NEW.um:='lingurita';
   :NEW.cantitate:=:NEW.cantitate*2;
  END IF;
END;
--Verificare trigger 
INSERT INTO Set_ingrediente
VALUES(108,112,3,'lingura',NULL);

SELECT * 
FROM Set_ingrediente
WHERE reteta_id=108 AND ingred_id=112;

--b)

CREATE OR REPLACE TRIGGER reteta_vegetariana_trigg
BEFORE UPDATE OF vegetariana ON reteta
FOR EACH ROW
DECLARE
v_ingredient Ingredient.ingredient%TYPE;
v_este_vegetariana NUMBER(1):=0;
v_total_ingrediente NUMBER(1):=0;
BEGIN
  DECLARE
  CURSOR ingred_id_cur IS
  SELECT ingred_id 
  FROM set_ingrediente
  WHERE reteta_id=:NEW.reteta_id;
BEGIN
   FOR ingred_rec IN ingred_id_cur
   LOOP
     SELECT ingredient INTO v_ingredient 
     FROM Ingredient
     WHERE ingred_id=ingred_rec.ingred_id;
     IF v_ingredient IN ('pui','muschide vita') AND :NEW.vegetariana='D' THEN
       RAISE_APPLICATION_ERROR(-20000,'Reteta contine carne');
     ELSE 
       IF v_ingredient NOT IN ('pui','muschide vita') AND :NEW.vegetariana='N' THEN
         v_este_vegetariana:=v_este_vegetariana+1;
       END IF;	
     END IF;
     v_total_ingrediente:=v_total_ingrediente+1;
   END LOOP;
   IF v_este_vegetariana = v_total_ingrediente THEN
   RAISE_APPLICATION_ERROR(-20000,'Reteta nu contine carne');
   END IF;
END;
END;


--Verificare trigger
INSERT INTO Reteta
VALUES(224,'Placinta cu pui','Se prepara aluatul. Se amesteca puiul cu legumele. Se pune 
la cuptor totul',2,'N',20,3,NULL);

INSERT INTO Set_ingrediente
VALUES(224,202,2,'buc','taiat felii mici');

INSERT INTO Set_ingrediente
VALUES(224,111,2,'lingura',NULL);

UPDATE reteta
SET vegetariana='D'
WHERE reteta_id=224;

DELETE FROM Set_ingrediente
WHERE reteta_id=224 AND ingred_id=202;

UPDATE reteta
SET vegetariana='D'
WHERE reteta_id=224;

UPDATE reteta
SET vegetariana='N'
WHERE reteta_id=224;

--c)
CREATE VIEW Retete_NonVegetariene AS
SELECT tip,r.reteta_id,descriere,timp_preparare,portii,ingredient,cantitate,um,comentarii
FROM Categorie c, Reteta r, Set_ingrediente s, Ingredient i
WHERE r.vegetariana='N' AND
c.categ_id=r.categ_id AND
s.reteta_id=r.reteta_id AND
i.ingred_id=s.ingred_id;


CREATE OR REPLACE TRIGGER insert_set_ingred_trigg
INSTEAD OF INSERT ON Retete_NonVegetariene
DECLARE
v_ingred_id Set_ingrediente.ingred_id%TYPE;
BEGIN
  SELECT ingred_id INTO v_ingred_id FROM Ingredient WHERE ingredient=:NEW.ingredient;
  INSERT INTO Set_ingrediente(reteta_id,ingred_id,cantitate,um,comentarii)
  VALUES(:NEW.reteta_id,v_ingred_id,:NEW.cantitate,:NEW.um,:NEW.comentarii);
END;
--Verificare trigger
INSERT INTO Ingredient
VALUES(25,'piper');
INSERT INTO Retete_NonVegetariene(reteta_id,ingredient,cantitate,um,comentarii)
VALUES (101, 'piper',10,'gr','comentarii');

SELECT * 
FROM Set_ingrediente
WHERE ingred_id=25;



