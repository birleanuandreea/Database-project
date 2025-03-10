
//--------------Implementare USE-CASE-uri----------------------------------

// 1. Imprumutul de carti

SAVEPOINT A;

// Verificare daca cititorul exista pe baza telefonului
SELECT c.nume, c.prenume, dc.telefon
FROM Cititor c
JOIN Detalii_cititori dc ON c.id_cititor = dc.id_cititor
WHERE dc.telefon = '0712309067';

// Daca cititorul nu exista, il adaugam
// Inserare cititor
INSERT INTO Cititor (nume, prenume)
VALUES ('Enache', 'Ionut');

// Inserare detalii cititor, obtinem id_cititor imediat dupa inserare
INSERT INTO Detalii_cititori (telefon, id_cititor)
VALUES ('0712309067', 
    (SELECT id_cititor 
     FROM Cititor 
     WHERE nume = 'Enache' AND prenume = 'Ionut' 
     ORDER BY id_cititor DESC FETCH FIRST 1 ROW ONLY)
);

// Cititorul vrea sa împrumute o carte de aventura
SELECT c.titlu AS "Carti de aventura"
FROM Carte c
WHERE c.gen = 'Aventura';

// Cititorul a ales "O calatorie spre centrul Pamantului"
// Inserare împrumut
INSERT INTO Fisa_imprumut (id_cititor, id_carte)
VALUES (
    (SELECT id_cititor 
     FROM Detalii_cititori 
     WHERE telefon = '0712309067'),
    (SELECT id_carte 
     FROM Carte 
     WHERE titlu = 'Ocolul Pamantului in 80 de zile')
);


// Afisare date despre imprumutul cititorului
SELECT c.nume, c.prenume, ca.titlu, fi.data_imprumut
FROM Cititor c
JOIN Fisa_imprumut fi ON c.id_cititor = fi.id_cititor
JOIN Carte ca ON ca.id_carte = fi.id_carte
JOIN Detalii_cititori dc ON dc.id_cititor = c.id_cititor
WHERE dc.telefon = '0712309067';

// Confirmarea tranzactiei
COMMIT;



// 2. Returnarea de carti imprumutate

SAVEPOINT B;

// Verificare daca cititorul exista pe baza telefonului
SELECT c.nume, c.prenume, dc.telefon
FROM Cititor c
JOIN Detalii_cititori dc ON c.id_cititor = dc.id_cititor
WHERE telefon = '0753680329';

// Validarea daca exista un imprumut pentru cititor pe cartea pe care vrea sa o returneze
SELECT fi.id_cititor, fi.id_carte, fi.data_imprumut, fi.data_returnare
FROM Fisa_imprumut fi
JOIN Carte ca ON fi.id_carte = ca.id_carte
JOIN Cititor c ON fi.id_cititor = c.id_cititor
JOIN Detalii_cititori dc ON c.id_cititor = dc.id_cititor
WHERE dc.telefon = '0753680329'
  AND ca.titlu = 'Pride and Prejudice';

// Se completeaza data_returnare pentru cititor si pentru cartea pe care vrea sa o returneze
UPDATE Fisa_imprumut
SET data_returnare = SYSDATE 
WHERE id_cititor = (
    SELECT c.id_cititor
    FROM Cititor c
    JOIN Detalii_cititori dc ON c.id_cititor = dc.id_cititor
    WHERE dc.telefon = '0753680329' 
)
AND id_carte = (
    SELECT ca.id_carte
    FROM Carte ca
    WHERE ca.titlu = 'Pride and Prejudice'
);

// Afisare date despre returul cititorului
SELECT c.nume, c.prenume, ca.titlu, fi.data_imprumut, fi.data_returnare
FROM Cititor c
JOIN Fisa_imprumut fi ON c.id_cititor = fi.id_cititor
JOIN Carte ca ON ca.id_carte = fi.id_carte
JOIN Detalii_cititori dc ON dc.id_cititor = c.id_cititor
WHERE dc.telefon = '0753680329'
AND ca.titlu = 'Pride and Prejudice';

// Confirmarea tranzactiei
COMMIT;



// 3. Actualizarea informatiilor unui cititor 

SAVEPOINT C;

// Verificare daca cititorul exista
SELECT c.nume, c.prenume, dc.telefon, dc.email
FROM Cititor c
JOIN Detalii_cititori dc ON c.id_cititor = dc.id_cititor
WHERE dc.telefon = '0747116566';

// Actualizare informatii de contact pentru cititor
UPDATE Detalii_cititori
SET telefon = '0765432110', email = 'popescu.an@newmail.com'
WHERE id_cititor = (
    SELECT id_cititor 
    FROM Cititor 
    WHERE nume = 'Popescu' AND prenume = 'Andrei'
);

// Confirmarea tranzactiei
COMMIT;

// Afisare informatii actualizate
SELECT c.nume, c.prenume, dc.telefon, dc.email
FROM Cititor c
JOIN Detalii_cititori dc ON c.id_cititor = dc.id_cititor
WHERE c.nume = 'Popescu' AND c.prenume = 'Andrei';



// 4. Raport lunar: Cele mai imprumutate carti

// Generare raportul pentru cartile imprumutate in ultima luna
SELECT ca.titlu, COUNT(fi.id_carte) AS numar_imprumuturi
FROM Fisa_imprumut fi
JOIN Carte ca ON ca.id_carte = fi.id_carte
WHERE fi.data_imprumut >= ADD_MONTHS(SYSDATE, -1)
GROUP BY ca.titlu
ORDER BY numar_imprumuturi DESC;
