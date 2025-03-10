//-----------VIZUALIZARE DATE TABELE----------------


//--------Carti cu stoc insuficient pentru imprumut pentru a identifica necesitatea reinnoirii stocului
SELECT c.titlu, dc.cantitate
FROM carte c 
JOIN detalii_carti dc ON c.id_carte = dc.id_carte
WHERE dc.cantitate < 2;


//-----------Identificarea genurilor literare si numarului de carti din fiecare gen
SELECT gen, COUNT(*) AS numar_carti
FROM carte
GROUP BY gen
ORDER BY gen;


//--------Indentificarea cititorilor care au imprumutat aceeasi carte de mai multe ori
SELECT id_cititor, id_carte, COUNT(*) AS numar_imprumuturi
FROM fisa_imprumut
GROUP BY id_cititor, id_carte
HAVING COUNT(*) > 1;


//----------Cititori care nu au facut inca niciun imprumut
SELECT c.nume, c.prenume
FROM cititor c
LEFT JOIN fisa_imprumut f ON c.id_cititor = f.id_cititor
WHERE f.id_cititor IS NULL;


//----------Carti care nu au fost niciodata imprumutate
SELECT c.titlu
FROM carte c
LEFT JOIN fisa_imprumut fi ON c.id_carte = fi.id_carte
WHERE fi.id_carte IS NULL;


//-----------Edituri cu cele mai multe carti in biblioteca
SELECT e.nume AS editura, COUNT(c.id_carte) AS numar_carti
FROM editura e
JOIN carte c ON e.id_editura = c.id_editura
GROUP BY e.nume
ORDER BY numar_carti DESC;


//--------------Top pentru cele mai imprumutate carti---------
SELECT c.titlu, COUNT(f.id_carte) AS numar_imprumuturi
FROM carte c
JOIN fisa_imprumut f ON c.id_carte = f.id_carte
GROUP BY c.titlu
ORDER BY numar_imprumuturi DESC;


//--------Top cititori cu cele mai multe imprumuturi-------------------------
SELECT ci.nume, ci.prenume, COUNT(fi.id_carte) AS numar_imprumuturi
FROM cititor ci
JOIN fisa_imprumut fi ON ci.id_cititor = fi.id_cititor
GROUP BY ci.nume, ci.prenume
ORDER BY numar_imprumuturi DESC;


//-------Fiecare carte trebuie sa fie asociata cu un singur autor, cu un singur gen si provine de la o singura editura-----------
SELECT c.titlu, c.gen, a.nume AS AUTOR, e.nume AS EDITURA
FROM carte c
JOIN autor a ON c.id_autor = a.id_autor
JOIN editura e ON c.id_editura = e.id_editura;


//-----------------Cititori care s-au inscris in ziua imprumutului----------------
SELECT ci.nume, ci.prenume, fi.data_imprumut, dc.data_inscriere
FROM fisa_imprumut fi
JOIN cititor ci ON fi.id_cititor = ci.id_cititor
JOIN detalii_cititori dc ON ci.id_cititor = dc.id_cititor
WHERE TRUNC(fi.data_imprumut) = TRUNC(dc.data_inscriere);


//-------Exista autori care au mai multe carti scrise in biblioteca-----------
SELECT a.nume, COUNT(c.titlu) AS numar_carti
FROM autor a
JOIN carte c ON a.id_autor = c.id_autor
GROUP BY a.nume
HAVING COUNT(c.titlu) >= 2;


//---------Fiecare cititor trebuie sa aiba un numar de telefon si o adresa de email unice salvate in tabela de detalii, evitand inregistrarile duplicate
SELECT c.nume, c.prenume, d.email, d.telefon
FROM cititor c JOIN detalii_cititori d
ON c.id_cititor = d.id_cititor;


//------- Pentru a evita supraincarcarea tabelei carte, detaliile suplimentare despre carti sunt gestionate intr-o tabela distincta  
SELECT c.titlu, c.gen, d.limba, d.an_publicare, d.descriere
FROM carte c JOIN detalii_carti d
ON c.id_carte = d.id_carte;


//----------Imprumuturile de carti ale cititorilor sunt retinute in fise create la fiecare imprumut de carte 
SELECT c.titlu, cit.nume, cit.prenume, f.data_imprumut, f.data_returnare
FROM fisa_imprumut f
JOIN carte c ON c.id_carte = f.id_carte
JOIN cititor cit ON f.id_cititor = cit.id_cititor;


//---------Un cititor poate imprumuta o carte daca este deja inscris sau daca se inscrie in aceeasi zi in care vrea sa imprumute o carte
SELECT c.nume, c.prenume, d.data_inscriere, f.data_imprumut
FROM cititor c
JOIN detalii_cititori d ON c.id_cititor = d.id_cititor
JOIN fisa_imprumut f ON c.id_cititor = f.id_cititor;
