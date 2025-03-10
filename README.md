# Database-project
This is a database project for managing a library, allowing the organization of books by genres, authors, and publishers, as well as managing readers and loans. The application adheres to strict rules for borrowing books and manages reader details, enforcing the uniqueness of email addresses and phone numbers.

The database is structured into seven main entities:

CARTE (BOOK): Stores information about available books (id_carte, title, genre, id_author, id_editura).

DETALII_CARTI (BOOK_DETAILS): Contains additional details about books (quantity, language, description, year_published, id_carte).

AUTOR (AUTHOR): Stores information about the authors of the books (id_author, name, nationality).

EDITURA (PUBLISHER): Stores information about the publishers from which the books come (id_editura, name, address, phone, email).

CITITOR (READER): Stores information about readers (id_cititor, name, surname).

DETALII_CITITORI (READER_DETAILS): Contains additional information about readers (phone, email, date_of_registration, id_cititor).

FISA_IMPRUMUT (LOAN_RECORD): Keeps track of loans (date_of_loan, date_of_return, id_cititor, id_carte).

The project also includes details about the structure and inter-relationship of the tables, the logical model, normalization of the tables (1NF, 2NF, 3NF), the relational model, and the constraints applied (PRIMARY KEY, FOREIGN KEY, UNIQUE KEY, NOT NULL, CHECK).
