
//--------------INSERARI DATE IN TABELE--------------


//--------------TABELA AUTOR-----------------
INSERT INTO autor (nume, nationalitate)
VALUES ('Nicolae Iorga', 'Romania');
update autor set id_autor = 500 where nume = 'Nicolae Iorga';

INSERT INTO autor (nume, nationalitate)
VALUES ('Jane Austen', 'Marea Britanie');

INSERT INTO autor(nume, nationalitate)
VALUES ('Mark Manson', 'America');

INSERT INTO autor(nume, nationalitate)
VALUES ('Agatha Christie', 'Marea Britanie');

INSERT INTO autor(nume, nationalitate)
VALUES ('Mircea Eliade', 'Romania');

INSERT INTO autor(nume, nationalitate)
VALUES ('Jules Verne', 'Franta');

SELECT * FROM autor;


//--------------TABELA EDITURA------------
INSERT INTO editura(nume, adresa, telefon, email)
VALUES ('Litera', 'Strada Moeciu 7A', '0713196393', 'litera_contact@gmail.com');

INSERT INTO editura(nume, adresa, telefon, email)
VALUES ('Trei', 'Strada Calea Victoriei 101A', '0728049211', 'editura_trei@email.com');

INSERT INTO editura(nume, adresa, telefon) 
VALUES ('Humanitas', 'Piata Presei Libere 12', '0747116566');

INSERT INTO editura(nume, adresa, telefon) 
VALUES ('Corint', 'Bd. Ghica Tei 81', '0747113000');

INSERT INTO editura(nume, adresa, telefon) 
VALUES ('Polirom', 'Strada Traian 1', '0712116566');

INSERT INTO editura(nume, adresa, telefon) 
VALUES ('Letras', 'Emil Isac 23', '0710116566');
    
SELECT * FROM editura;
 


//---------TABELA CITITOR si TABELA DETALII CITITORI-------------
INSERT INTO cititor(nume, prenume)
VALUES ('Birleanu', 'Andreea');
INSERT INTO detalii_cititori(telefon, email, id_cititor, data_inscriere)
VALUES ('0730005530', 'a_birleanu14@gmail.com', 1000, SYSDATE - 15);


INSERT INTO cititor(nume, prenume)
VALUES ('Coca', 'Mihai');
INSERT INTO detalii_cititori(telefon, email, id_cititor)
VALUES ('0734568832', 'cocamihai@gmail.com', 1001);


INSERT INTO cititor(nume, prenume)
VALUES ('Popescu', 'Andrei');
INSERT INTO detalii_cititori(telefon, email, id_cititor)
VALUES ('0747116566', 'a_popescu@gmail.com', 1002);

    
INSERT INTO cititor(nume, prenume)
VALUES ('Ursuleanu', 'Maria');
INSERT INTO detalii_cititori(telefon, email, id_cititor)
VALUES ('0754675423', 'maria_urs@gmail.com', 1003);


INSERT INTO cititor(nume, prenume)
VALUES ('Murgoci', 'Mihaela');
INSERT INTO detalii_cititori(telefon, email, id_cititor)
VALUES ('0712131415', 'miha123@gmail.com', 1004);


INSERT INTO cititor(nume, prenume)
VALUES ('Puravet', 'Adina');
INSERT INTO detalii_cititori(telefon, email, id_cititor, data_inscriere)
VALUES ('0723537890', 'adina_puravet@gmail.com', 1005, SYSDATE - 5);


INSERT INTO cititor(nume, prenume)
VALUES ('Stefan', 'Gabriela Iuliana');
INSERT INTO detalii_cititori(telefon, email, id_cititor, data_inscriere)
VALUES ('0753680329', 'iuliana_st@gmail.com', 1006, SYSDATE - 20);


INSERT INTO cititor(nume, prenume)
VALUES ('Stoian', 'Ionut');


SELECT * FROM cititor;
SELECT * FROM detalii_cititori;


// TRANZACTIE    ---->    INREGISTRARE CITITOR

// inserare date in tabela Cititor
INSERT INTO cititor(nume, prenume)
VALUES ('Oancea', 'Maria');

// obtinere id_cititor pentru Oancea Maria
SELECT id_cititor, nume, prenume
FROM Cititor
WHERE nume = 'Oancea' AND prenume = 'Maria';

// inserare date suplimentare in tabela Detalii_cititori
INSERT INTO detalii_cititori(telefon, email,id_cititor)
VALUES ('0754260793', 'o_maria@gmail.com', 1010);

// confirmarea tranzactiei
COMMIT;

    
//-------TABELA CARTE si TABELA DETALII CARTI-------------
INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('Maitreyi', 'Literatura clasica', 1, 504);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (2, 'romana',
            'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
            2015,
            100);
            

INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('Arta subtila a nepasarii', 'Dezvoltare personala', 2, 502);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (5, 'romana',
            'Este o carte incurajeaza sa ne concentam pe lucrurile care conteaza cu adevarat, renuntand la presiunea de a fi mereu fericiti si perfecti.',
            2017,
            101);
            

INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('O calatorie spre centrul Pamantului', 'Aventura', 3, 505);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (3, 'romana',
            'Urmareste aventurile profesorului Lidenbrock ai ale nepotului sau, Axel, care descopera o cale subterana spre centrul Pamantului.',
            2011,
            102);
            

INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('Ocolul Pamantului in 80 de zile', 'Aventura', 3, 505);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (2, 'franceza',
            'Spune povestea aventurii lui Phileas Fogg, un gentleman englez, care pariaza ca poate inconjura lumea in 80 de zile.',
            2005,
            103);
            

INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('Orient express', 'Mister/Politist', 2, 503);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (10, 'romana',
            'Este un roman de mister in care detectivul Hercule Poirot investigheaza un crima comisa intr-un tren de lux.',
            2020,
            104);
            

INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('Pride and Prejudice', 'Roman de dragoste', 1, 501);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (8, 'engleza',
            'Este un roman clasic ce exploreaza viata si relatiile sociale ale familiei Bennet.',
            2021,
            105);
            

INSERT INTO carte(titlu, gen, id_editura, id_autor)
VALUES ('Istoria vietii bizantine', 'Istorie', 1, 500);
INSERT INTO detalii_carti(cantitate, limba, descriere, an_publicare, id_carte)
VALUES (5, 'romana',
            'Este o lucrare monumentala in care autorul exploreaza istoria Imperiului Bizantin.',
            2018,
            106);

COMMIT;

SELECT * FROM carte;
SELECT * FROM detalii_carti;


//------------FISA IMPRUMUT-----------------
INSERT INTO fisa_imprumut(id_carte, id_cititor, data_imprumut)
VALUES (100, 1000, SYSDATE - 5);

SELECT cantitate FROM detalii_carti WHERE id_carte = 100;   // 2 -> 1


INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (101, 1002);

SELECT cantitate FROM detalii_carti WHERE id_carte = 101;   // 5 -> 4


INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (101, 1003);

SELECT cantitate FROM detalii_carti WHERE id_carte = 101;   // 5 -> 4 -> 3


INSERT INTO fisa_imprumut(id_carte, id_cititor, data_imprumut)
VALUES (105, 1006, SYSDATE - 10);

SELECT cantitate FROM detalii_carti WHERE id_carte = 105;   // 8 -> 7


INSERT INTO fisa_imprumut(id_carte, id_cititor, data_imprumut)
VALUES (104, 1005, SYSDATE - 2);

SELECT cantitate FROM detalii_carti WHERE id_carte = 104;   // 10 -> 9


INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (102, 1001);

SELECT cantitate FROM detalii_carti WHERE id_carte = 102;   // 3 -> 2

INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (104, 1000);

SELECT cantitate FROM detalii_carti WHERE id_carte = 104;   // 9 -> 8


// nu exista niciun imprumut activ cu aceasta combinatie (1002, 101), deci cititorul cu id-ul 1002 poate imprumuta din nou cartea cu id-ul 101 )
INSERT INTO fisa_imprumut (id_cititor, id_carte)
SELECT 1002, 101
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1
    FROM fisa_imprumut fi
    WHERE fi.id_cititor = 1002
      AND fi.id_carte = 101
      AND fi.data_returnare IS NULL
);
  


//-----------Returnare carti-------------

UPDATE fisa_imprumut
SET data_returnare = SYSDATE + 1
WHERE id_carte = 101
AND id_cititor = 1002;

UPDATE fisa_imprumut
SET data_returnare = SYSDATE + 1
WHERE id_carte = 100
AND id_cititor = 1000;

SELECT cantitate FROM detalii_carti WHERE id_carte = 101;   // 3 -> 4


SELECT * FROM fisa_imprumut;

COMMIT;
