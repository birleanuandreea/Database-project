//--------------VALIDARE CONSTRANGERI---------------------


//----------------Cititor------------------------

//--------testare PK pe id_cititor  ---->  unique constraint (BD018.CITITOR_PK) violated------
INSERT INTO cititor (id_cititor, nume, prenume)
VALUES (1001, 'Enache', 'Ana');

//------testare CK pe nume   -------->  check constraint (BD018.CITITOR_NUME_CK) violated
INSERT INTO cititor (nume, prenume)
VALUES ('enache','Maria');

//------testare NN pe nume    -------->    cannot insert NULL into ("BD018"."CITITOR"."NUME")
INSERT INTO cititor (prenume)
VALUES ('Maria');

//------testare CK pe prenume   -------->  check constraint (BD018.CITITOR_PRENUME_CK) violated
INSERT INTO cititor (nume, prenume)
VALUES ('Enache','maria');

//------testare NN pe prenume    -------->    cannot insert NULL into ("BD018"."CITITOR"."PRENUME")
INSERT INTO cititor (nume)
VALUES ('Enache');



//----------------Detalii_cititori-----------------

//------testare FK pe id_cititor cheie externa   ------>   integrity constraint (BD018.DETALII_CITITORI_CITITOR_FK) violated - parent key not found
INSERT INTO detalii_cititori (telefon, id_cititor)
VALUES ('0712131419', 1050);

//-------testare CK pe telefon    ------>    check constraint (BD018.DETALII_CITITORI_TELEFON_CK) violated
INSERT INTO detalii_cititori(telefon, id_cititor)
VALUES ('0712145', 1007);

//-------testare UK pe telefon    ------>    unique constraint (BD018.DETALII_CITITORI_TELEFON_UN) violated
INSERT INTO detalii_cititori(telefon, id_cititor)
VALUES ('0730005530', 1007);

//-------testare NN pe telefon    ------>     cannot insert NULL into ("BD018"."DETALII_CITITORI"."TELEFON")
INSERT INTO detalii_cititori(id_cititor)
VALUES (1007);

//------testare UK pe email   -------->  unique constraint (BD018.DETALII_CITITORI_EMAIL_UN) violated
INSERT INTO detalii_cititori(telefon, email, id_cititor)
VALUES ('0730005528', 'miha123@gmail.com', 1007);

//------testare CK pe email   -------->  check constraint (BD018.DETALII_CITITORI_EMAIL_CK) violated
INSERT INTO detalii_cititori(telefon, email, id_cititor)
VALUES ('0730005528', 'i_stoian@gmailcom', 1007);

// testare Trg_Detalii_cititori_data_inscriere     ---->    Data invalida: 09.12.2024 trebuie sa fie mai mica sau egala cu data curenta: 08.12.2024
INSERT INTO detalii_cititori(telefon, id_cititor, data_inscriere)
VALUES ('078912145', 1007, SYSDATE + 1);



//--------------Editura---------------------------

//--------testare PK pe id_editura  ----> unique constraint (BD018.EDITURA_PK) violated
INSERT INTO editura (id_editura, nume, adresa, telefon)
VALUES (2, 'Corint', 'Hapau 11', '0747116566');

//------testare CK pe nume   -------->  check constraint (BD018.EDITURA_NUME_CK) violated
INSERT INTO editura(nume, adresa, telefon)
VALUES ('corint', 'Inv. Holban 12', '0747116573');

//--------testare NN pe nume  ----->  cannot insert NULL into ("BD018"."EDITURA"."NUME")--
INSERT INTO editura (adresa, telefon)
VALUES ('Hapau 11', '0756781234');

//------testare CK pe adresa   -------->  check constraint (BD018.EDITURA_ADRESA_CK) violated
INSERT INTO editura(nume, adresa, telefon)
VALUES ('Corint', 'hapau 11', '0747116570');

//------testare NN pe adresa   --------> cannot insert NULL into ("BD018"."EDITURA"."ADRESA")
INSERT INTO editura(nume, telefon)
VALUES ('Corint', '0747116570');

//------testare UK pe adresa   --------> unique constraint (BD018.EDITURA_ADRESA_UN) violated
INSERT INTO editura(nume, adresa, telefon)
VALUES ('Corint', 'Strada Calea Victoriei 101A', '0747116570');

//------testare CK pe telefon   --------> check constraint (BD018.EDITURA_TELEFON_CK) violated
INSERT INTO editura(nume, adresa, telefon)
VALUES ('Corint', 'Hapau 101A', '0347116570');

//------testare NN pe telefon   --------> cannot insert NULL into ("BD018"."EDITURA"."TELEFON")
INSERT INTO editura(nume, adresa)
VALUES ('Corint', 'Hapau 101A');

//------testare UK pe telefon   --------> unique constraint (BD018.EDITURA_TELEFON_UN) violated
INSERT INTO editura(nume, adresa, telefon)
VALUES ('Corint', 'Hapau 101A', '0747116566');

//------testare UK pe email   -------->  unique constraint (BD018.EDITURA_EMAIL_UN) violated
INSERT INTO editura(nume, adresa, telefon, email)
VALUES ('Corint', 'Hapau 101A', '0747116590', 'editura_trei@email.com');

//------testare CK pe email   -------->  check constraint (BD018.EDITURA_EMAIL_CK) violated
INSERT INTO editura(nume, adresa, telefon, email)
VALUES ('Corint', 'Hapau 101A', '0747116590', 'editura_treiemail.com');



//-----------------AUTOR---------------

//--------testare PK pe id_autor  ---->  unique constraint (BD018.AUTOR_PK) violated
INSERT INTO autor (id_autor, nume)
VALUES (500, 'Ion Creanga');

//------testare CK pe nume   -------->  check constraint (BD018.AUTOR_NUME_CK) violated
INSERT INTO autor (nume)
VALUES ('ion creanga');

//------testare NN pe nume   -------->  cannot insert NULL into ("BD018"."AUTOR"."NUME")
INSERT INTO autor (nationalitate)
VALUES ('Romania');

//------testare CK pe nationalitate   -------->  check constraint (BD018.AUTOR_NATIONALITATE_CK) violated
INSERT INTO autor (nume, nationalitate)
VALUES ('Ion Creanga', 'romania');



//---------------Carte---------------------------

//--------testare PK pe id_carte  ---->  unique constraint (BD018.CARTE_PK) violated
INSERT INTO carte (id_carte, titlu, gen, id_autor, id_editura)
VALUES (103, 'Moarte pe Nill', 'Mister/Politist', 503, 3);

//------testare CK pe titlu   -------->  check constraint (BD018.CARTE_TITLU_CK) violated
INSERT INTO carte (titlu, gen, id_autor, id_editura)
VALUES ('moarte pe nill', 'Mister/Politist', 503, 3);

//------testare UK pe titlu   -------->  unique constraint (BD018.CARTE_TITLU_UN) violated
INSERT INTO carte (titlu, gen, id_autor, id_editura)
VALUES ('Orient express', 'Mister/Politist', 503, 3);

//------testare CK pe gen   -------->  check constraint (BD018.CARTE_GEN_CK) violated
INSERT INTO carte (titlu, gen, id_autor, id_editura)
VALUES ('Moarte pe Nill', 'Politist', 503, 3);

//------testare FK pe id_autor cheie externa   ------> integrity constraint (BD018.CARTE_AUTOR_FK) violated - parent key not found
INSERT INTO carte (titlu, gen, id_autor, id_editura)
VALUES ('Moarte pe Nill', 'Mister/Politist', 511, 3);

//------testare FK pe id_editura cheie externa   ------> integrity constraint (BD018.CARTE_EDITURA_FK) violated - parent key not foun
INSERT INTO carte (titlu, gen, id_autor, id_editura)
VALUES ('Moarte pe Nill', 'Mister/Politist', 503, 10);



//--------------------Detalii_carti---------------------------

//-------testare CK pe cantitate  ------->  check constraint (BD018.DETALII_CARTI_CANTITATE_CK) violated
INSERT INTO detalii_carti (cantitate, limba, descriere, id_carte)
VALUES (25, 'romana', 'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
        100);
        
//-----tesatre CK pe cantitate din detalii_carti cu ajutorul trigger-ului  Trg_scadere_cantitate_imprumut  ----->   check constraint (BD018.DETALII_CARTI_CANTITATE_CK) violated
INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (100, 1004);
        
//-------testare NN pe cantitate  ------->  cannot insert NULL into ("BD018"."DETALII_CARTI"."CANTITATE")
INSERT INTO detalii_carti (limba, descriere, id_carte)
VALUES ('romana', 'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
        100);
        
//-------testare CK pe limba  ------->  check constraint (BD018.DETALII_CARTI_LIMBA_CK) violated
INSERT INTO detalii_carti (cantitate, limba, descriere, id_carte)
VALUES (15, 'japoneza', 'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
        100);

//-------testare NN pe limba  ------->  cannot insert NULL into ("BD018"."DETALII_CARTI"."LIMBA")
INSERT INTO detalii_carti (cantitate, descriere, id_carte)
VALUES (15, 'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
        100);

//-------testare NN pe descriere  ------->  cannot insert NULL into ("BD018"."DETALII_CARTI"."DESCRIERE")
INSERT INTO detalii_carti (cantitate, limba, id_carte)
VALUES (15, 'romana', 100);

//-------testare CK pe an_publicare  ------->  check constraint (BD018.DETALII_CARTI_AN_PUBLICARE_CK) violated
INSERT INTO detalii_carti (cantitate, limba, descriere, an_publicare, id_carte)
VALUES (15, 'romana', 'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
        1899, 100);
        
//-------testare FK pe id_carte cheie externa  ------->  integrity constraint (BD018.DETALII_CARTI_CARTE_FK) violated - parent key not found
INSERT INTO detalii_carti (cantitate, limba, descriere, an_publicare, id_carte)
VALUES (15, 'romana', 'Este un roman despre iubirea imposibila intre un tanar roman si Maitreyi, o tanara indiana, in contextul diferentelor culturale si traditionale din India.',
        2000, 120);    



//------------------Fisa_imprumut------------------------------

//-------testare FK pe id_carte cheie externa  ------->  integrity constraint (BD018.FISA_IMPRUMUT_CARTE_FK) violated - parent key not found
INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (120, 1002); 

//-------testare FK pe id_cititor cheie externa  ------->  integrity constraint (BD018.FISA_IMPRUMUT_CITITOR_FK) violated - parent key not found
INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (101, 1019);

// testare Trg_Fisa_imprumut_data_imprumut         ---->    Data imprumut: 03.12.2024 trebuie sa fie mai mare decat data de inscriere: 07.12.2024
INSERT INTO fisa_imprumut(id_carte, id_cititor, data_imprumut)
VALUES (104, 1001, SYSDATE - 5);

// testare Trg_Fisa_imprumut_data_returnare       ------>   Data invalida: 03.12.2024 trebuie sa fie mai mare decat data de imprumut: 07.12.2024
UPDATE fisa_imprumut
SET data_returnare = SYSDATE - 5
WHERE id_carte = 101
AND id_cititor = 1003;



// testare UK pe perechea (id_carte, id_cititor)  ----->   unique constraint (BD018.ID_CITITOR_CARTE_UK) violated
// Un cititor nu poate împrumuta din nou o carte pe care o deține deja
INSERT INTO fisa_imprumut(id_carte, id_cititor)
VALUES (102, 1001);