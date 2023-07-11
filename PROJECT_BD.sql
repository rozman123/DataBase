USE master
GO

IF DB_ID('Internetowy serwis z Audiobookami') IS NULL
CREATE DATABASE [Internetowy serwis z Audiobookami]
GO
-------------------------------------
USE [Internetowy serwis z Audiobookami]

-----------------------------Tabele są usuwane w odwrotnej kolejności do tworzenia----------------------------------

IF OBJECT_ID('Oceny','U') IS NOT NULL
DROP TABLE Oceny

IF OBJECT_ID('Transakcje','U') IS NOT NULL
DROP TABLE Transakcje

IF OBJECT_ID('Gatunki','U') IS NOT NULL
DROP TABLE Gatunki

IF OBJECT_ID('Audiobooki','U') IS NOT NULL
DROP TABLE Audiobooki

IF OBJECT_ID('Users','U') IS NOT NULL
DROP TABLE Users
GO


--------------------------------Tworzenie tabel---------------------------------

IF OBJECT_ID('Users','U') IS NULL -- Użytkownicy zajerestrowani w systemie
CREATE TABLE Users
(
ID_użytkownika INT NOT NULL PRIMARY KEY, 
Imie VARCHAR(100) NOT NULL, 
Nazwisko VARCHAR(100) NOT NULL, 
[Data rejestracji] DATE NOT NULL, 
[Data urodzenia] DATE NOT NULL, 
[e-mail] VARCHAR(100) NOT NULL, 
[Karta kredytowa] VARCHAR(20) NOT NULL
)

IF OBJECT_ID('Audiobooki','U') IS NULL -- Dane Audiobookow
CREATE TABLE Audiobooki 
(
ID_audiobooku INT NOT NULL PRIMARY KEY,
Tytuł VARCHAR(255),
Autor VARCHAR(255),
Lektor VARCHAR(255),
Cena MONEY
)

IF OBJECT_ID('Gatunki','U') IS NULL -- Gatunki do jakiej należy książka
CREATE TABLE Gatunki 
(
ID_g INT NOT NULL PRIMARY KEY,
ID_a INT NOT NULL FOREIGN KEY REFERENCES Audiobooki,
Gatunek VARCHAR(100)
)

IF OBJECT_ID('Transakcje','U') IS NULL -- Rejestruje kupno audiobooków w serwisie przez użytkowników i w którym momęcie (tabela dynamiczna)
CREATE TABLE Transakcje 
(
ID_t INT NOT NULL PRIMARY KEY, 
[Data transakcji] DATE, 
ID_audiobook INT NOT NULL FOREIGN KEY REFERENCES Audiobooki, 
ID_uż INT NOT NULL FOREIGN KEY REFERENCES Users
)

IF OBJECT_ID('Oceny','U') IS NULL -- Ocena danego audiobooka w serwisie przez użytkowników i Komentarz (tabela dynamiczna)
CREATE TABLE Oceny 
(
ID_o INT NOT NULL PRIMARY KEY,
ID_audio INT NOT NULL FOREIGN KEY REFERENCES Audiobooki,  
ID_osoby INT NOT NULL FOREIGN KEY REFERENCES Users, 
Ocena INT,
Komentarz VARCHAR(255)
)
GO

----------------------Dodawanie wartości do tabel---------------------------------------

INSERT INTO Users (ID_użytkownika, Imie, Nazwisko, [Data rejestracji], [Data urodzenia], [e-mail], [Karta kredytowa]) VALUES 
(0, 'Adam', 'Nowak', '2019-03-12', '1975-07-10', 'adam.nowak@gmail.com', '4567890123456789'),
(1, 'Julia', 'Kowalska', '2020-05-22', '1992-12-09', 'julia.kowalska@gmail.com', '9876543210987654'),
(2, 'Michał', 'Wiśniewski', '2017-06-06', '1978-09-25', 'michal.wisniewski@gmail.com', '3210987654321098'),
(3, 'Zuzanna', 'Dąbrowska', '2016-11-18', '1965-05-02', 'zuzanna.dabrowska@gmail.com', '7890123456789012'),
(4, 'Jan', 'Lewandowski', '2018-09-09', '1971-06-15', 'jan.lewandowski@gmail.com', '2345678901234567'),
(5, 'Maria', 'Wójcik', '2015-07-31', '1969-02-21', 'maria.wojcik@gmail.com', '8765432109876543'),
(6, 'Piotr', 'Kamiński', '2017-12-02', '1976-10-30', 'piotr.kaminski@gmail.com', '5432109876543210'),
(7, 'Aleksandra', 'Kowalczyk', '2022-04-14', '1985-11-09', 'aleksandra.kowalczyk@gmail.com', '9012345678901234'),
(8, 'Wojciech', 'Zieliński', '2019-10-19', '1974-09-14', 'wojciech.zielinski@gmail.com', '6789012345678901'),
(9, 'Natalia', 'Szymańska', '2016-05-27', '1980-04-23', 'natalia.szymanska@gmail.com', '3456789012345678'),
(10, 'Filip', 'Woźniak', '2021-02-05', '1972-12-31', 'filip.wozniak@gmail.com', '0123456789012345'),
(11, 'Amelia', 'Kaczmarek', '2017-09-08', '1963-05-19', 'amelia.kaczmarek@gmail.com', '7890123456789012'),
(12, 'Igor', 'Pawlak', '2018-11-11', '1979-03-28', 'igor.pawlak@gmail.com', '4567890123456789'),
(13, 'Hanna', 'Michalska', '2016-06-03', '1967-08-07', 'hanna.michalska@gmail.com', '9876543210987654'),
(14, 'Mateusz', 'Nowicki', '2020-05-22', '1973-01-03', 'mateusz.nowicki@gmail.com', '3210987654321098'),
(15, 'Oliwia', 'Jankowska', '2017-09-17', '1984-11-12', 'oliwia.jankowska@gmail.com', '7890123456789012'),
(16, 'Julia', 'Kowalczyk', '2018-09-14', '1976-02-19', 'julia.kowalczyk@gmail.com', '4567890123456789'),
(17, 'Adam', 'Nowak', '2020-03-25', '1981-11-05', 'adam.nowak@gmail.com', '9876543210987654'),
(18, 'Wiktoria', 'Jankowska', '2017-08-06', '1969-07-14', 'wiktoria.jankowska@gmail.com', '3210987654321098'),
(19, 'Filip', 'Wiśniewski', '2016-11-19', '1985-05-30', 'filip.wisniewski@gmail.com', '7890123456789012'),
(20, 'Oliwia', 'Kamińska', '2019-09-02', '1972-12-22', 'oliwia.kaminska@gmail.com', '2345678901234567'),
(21, 'Antoni', 'Kowalski', '2016-06-13', '1970-02-03', 'antoni.kowalski@gmail.com', '8765432109876543'),
(22, 'Hanna', 'Dąbrowska', '2022-10-25', '1983-09-11', 'hanna.dabrowska@gmail.com', '5432109876543210'),
(23, 'Michał', 'Pawlak', '2021-04-17', '1977-06-27', 'michal.pawlak@gmail.com', '9012345678901234'),
(24, 'Zofia', 'Lewandowska', '2018-08-09', '1974-03-09', 'zofia.lewandowska@gmail.com', '6789012345678901'),
(25, 'Piotr', 'Zieliński', '2017-02-22', '1986-05-18', 'piotr.zielinski@gmail.com', '3456789012345678'),
(26, 'Natalia', 'Michalska', '2020-07-05', '1968-11-01', 'natalia.michalska@gmail.com', '0123456789012345'),
(27, 'Amelia', 'Woźniak', '2019-12-28', '1975-08-13', 'amelia.wozniak@gmail.com', '4567890123456789'),
(28, 'Jan', 'Szymański', '2018-03-11', '1980-04-04', 'jan.szymanski@gmail.com', '9876543210987654'),
(29, 'Aleksandra', 'Kaczmarek', '2017-07-24', '1973-09-21', 'aleksandra.kaczmarek@gmail.com', '3210987654321098'),
(30, 'Wojciech', 'Nowicki', '2020-09-17', '1982-01-06', 'wojciech.nowicki@gmail.com', '7890123456789012'),
(31, 'Antoni', 'Kowalski', '2021-06-08', '1987-02-11', 'antoni.kowalski@gmail.com', '3456789012345678'),
(32, 'Hanna', 'Nowak', '2019-02-21', '1979-09-25', 'hanna.nowak@gmail.com', '0123456789012345'),
(33, 'Wiktoria', 'Jankowska', '2020-10-03', '1983-07-07', 'wiktoria.jankowska@gmail.com', '4567890123456789'),
(34, 'Filip', 'Wiśniewski', '2017-12-15', '1976-03-19', 'filip.wisniewski@gmail.com', '9876543210987654'),
(35, 'Oliwia', 'Kamińska', '2018-08-28', '1971-06-28', 'oliwia.kaminska@gmail.com', '3210987654321098'),
(36, 'Michał', 'Lewandowski', '2016-04-11', '1964-12-02', 'michal.lewandowski@gmail.com', '7890123456789012'),
(37, 'Zofia', 'Dąbrowska', '2021-09-23', '1980-09-14', 'zofia.dabrowska@gmail.com', '2345678901234567'),
(38, 'Adam', 'Pawlak', '2020-05-06', '1985-11-30', 'adam.pawlak@gmail.com', '8765432109876543'),
(39, 'Natalia', 'Zielińska', '2019-11-19', '1978-08-05', 'natalia.zielinska@gmail.com', '9012345678901234'),
(40, 'Amelia', 'Michalska', '2018-03-02', '1972-01-23', 'amelia.michalska@gmail.com', '6789012345678901'),
(41, 'Piotr', 'Woźniak', '2017-07-14', '1967-05-12', 'piotr.wozniak@gmail.com', '3456789012345678'),
(42, 'Julia', 'Szymańska', '2022-11-26', '1989-09-02', 'julia.szymanska@gmail.com', '0123456789012345'),
(43, 'Aleksandra', 'Kaczmarek', '2021-03-09', '1982-07-15', 'aleksandra.kaczmarek@gmail.com', '4567890123456789'),
(44, 'Wojciech', 'Nowicki', '2019-06-21', '1975-03-24', 'wojciech.nowicki@gmail.com', '9876543210987654'),
(45, 'Mateusz', 'Kowalski', '2018-08-12', '1973-10-18', 'mateusz.kowalski@gmail.com', '3210987654321098')
GO

INSERT INTO Audiobooki (ID_audiobooku,Tytuł,Autor,Lektor,Cena) VALUES 
(0, 'Władca Pierścieni', 'J.R.R. Tolkien', 'Jan Kowalski', 14.99),
(1, 'Harry Potter i Kamień Filozoficzny', 'J.K. Rowling', 'Anna Nowak', 12.99),
(2, 'Złodziejka Książek', 'Markus Zusak', 'Piotr Lewandowski', 9.99),
(3, 'Metro 2033', 'Dmitry Glukhovsky', 'Magdalena Wiśniewska', 8.50),
(4, 'Hobbit, czyli tam i z powrotem', 'J.R.R. Tolkien', 'Michał Kowalczyk', 11.99),
(5, 'Duma i uprzedzenie', 'Jane Austen', 'Weronika Kamińska', 7.99),
(6, 'Morderstwo w Orient Expressie', 'Agatha Christie', 'Adam Pawlak', 9.50),
(7, 'Wiedźmin: Ostatnie życzenie', 'Andrzej Sapkowski', 'Julia Woźniak', 15.99),
(8, 'Dziewczyna z pociągu', 'Paula Hawkins', 'Piotr Kowalski', 10.99),
(9, 'Dziennik cwaniaczka', 'Jeff Kinney', 'Oliwia Michalska', 7.50), 
(10, 'Pieśń Lodu i Ognia', 'George R.R. Martin', 'Michał Nowicki', 19.99),
(11, '1984', 'George Orwell', 'Anna Kamińska', 8.99),
(12, 'Władca much', 'William Golding', 'Piotr Lewandowski', 11.50),
(13, 'To', 'Stephen King', 'Magdalena Kowalczyk', 13.99),
(14, 'Niezgodna', 'Veronica Roth', 'Adam Pawlak', 9.99),
(15, 'Harry Potter i więzień Azkabanu', 'J.K. Rowling', 'Julia Jankowska', 12.50),
(16, 'Zanim się pojawiłeś', 'Jojo Moyes', 'Filip Kamiński', 10.99),
(17, 'Wielkie nadzieje', 'Charles Dickens', 'Natalia Szymańska', 8.50),
(18, 'Męska rzecz', 'Chimamanda Ngozi Adichie', 'Wojciech Pawlak', 14.50),
(19, 'Gra o tron', 'George R.R. Martin', 'Zofia Nowak', 16.99),
(20, 'Mistrz i Małgorzata', 'Michaił Bułhakow', 'Jan Kowalski', 14.99),
(21, 'Stary człowiek i morze', 'Ernest Hemingway', 'Anna Nowak', 12.99),
(22, 'Opowieści z Narnii', 'C.S. Lewis', 'Piotr Lewandowski', 9.99),
(23, 'Zbrodnia i kara', 'Fiodor Dostojewski', 'Magdalena Wiśniewska', 8.50),
(24, 'Bestiario', 'Julio Cortázar', 'Michał Kowalczyk', 11.99),
(25, 'Przebudzenie', 'Kate Chopin', 'Weronika Kamińska', 7.99),
(26, 'Duma i uprzedzenie', 'Jane Austen', 'Adam Pawlak', 9.50),
(27, 'W pustyni i w puszczy', 'Henryk Sienkiewicz', 'Julia Woźniak', 15.99),
(28, 'Władca Pierścieni', 'J.R.R. Tolkien', 'Piotr Kowalski', 10.99),
(29, 'Harry Potter i Kamień Filozoficzny', 'J.K. Rowling', 'Oliwia Michalska', 7.50),
(30, 'Lśnienie', 'Stephen King', 'Michał Nowicki', 19.99),
(31, 'Zapach Kobiety', 'Giovanni Arpino', 'Anna Kamińska', 8.99),
(32, 'Małe życie', 'Hanya Yanagihara', 'Piotr Lewandowski', 11.50),
(33, 'Piękna i Bestia', 'Jeanne-Marie Leprince de Beaumont', 'Magdalena Kowalczyk', 13.99),
(34, 'Hobbit, czyli tam i z powrotem', 'J.R.R. Tolkien', 'Adam Pawlak', 9.99),
(35, '1984', 'George Orwell', 'Julia Jankowska', 12.50),
(36, 'Księga dżungli', 'Rudyard Kipling', 'Filip Kamiński', 10.99),
(37, 'Zamek', 'Franz Kafka', 'Natalia Szymańska', 8.50),
(38, 'Wichrowe Wzgórza', 'Emily Brontë', 'Wojciech Pawlak', 14.50),
(39, 'Mały Książę', 'Antoine de Saint-Exupéry', 'Zofia Nowak', 16.99),
(40, 'Dżuma', 'Albert Camus', 'Karolina Nowakowska', 9.99),
(41, 'Boso, ale w ostrogach', 'Stanisław Grzesiuk', 'Tomasz Nowicki', 8.50),
(42, 'Chłopi', 'Władysław Reymont', 'Alicja Pawlak', 14.50),
(43, 'Sklepy cynamonowe', 'Bruno Schulz', 'Filip Nowicki', 13.99),
(44, 'Pan Tadeusz', 'Adam Mickiewicz', 'Natalia Kowalczyk', 12.99),
(45, 'Lalka', 'Bolesław Prus', 'Katarzyna Wiśniewska', 11.99),
(46, 'Opowieści z Ziemiomorza', 'Ursula K. Le Guin', 'Michał Kowalczyk', 10.99),
(47, 'Republika Złodziej', 'Scott Lynch', 'Anna Nowak', 9.99),
(48, 'Czerwony smok', 'Thomas Harris', 'Piotr Lewandowski', 8.99),
(49, 'Ojciec chrzestny', 'Mario Puzo', 'Magdalena Kamińska', 7.99),
(50, 'Zabójstwo Rogera Ackroyda', 'Agatha Christie', 'Adam Pawlak', 15.99)
GO
 
INSERT INTO Gatunki (ID_g,ID_a,Gatunek) VALUES 
(0, 0, 'Fantasy'),
(1, 0, 'Przygodowy'),
(2, 0, 'Saga'),
(3, 0, 'Epicka fantasy'),
(4, 0, 'Romans dworski'),
(5, 0, 'Heroic fantasy'),
(6, 1, 'Fantasy'),
(7, 1, 'Przygodowy'),
(8, 1, 'Młodzieżowa'),
(9, 1, 'Dreszczowiec'),
(10, 2, 'Powieść'),
(11, 2, 'Młodzieżowa'),
(12, 2, 'Fikcja historyczna'),
(13, 2, 'Bildungsroman'),
(14, 3, 'Science Fiction'),
(15, 3, 'Powieść'),
(16, 3, 'Postapo'),
(17, 4, 'Fantasy'),
(18, 4, 'Powieść'),
(19, 4, 'Epopeja'),
(20, 4, 'Epicka fantasy'),
(21, 5, 'Romans'),
(22, 5, 'Powieść'),
(23, 6, 'Kryminał'),
(24, 6, 'Powieść'),
(25, 6, 'Fikcja'),
(26, 7, 'Fantasy'),
(27, 7, 'Powieść'),
(28, 7, 'Epicka fantasy'),
(29, 8, 'Thriller'),
(30, 8, 'Powieść'),
(31, 8, 'Dreszczowiec'),
(32, 8, 'Kryminał'),
(33, 8, 'Psychologiczna'),
(34, 9, 'Dla dzieci'),
(35, 10, 'Fantasy'),
(36, 10, 'Epicka fantasy'),
(37, 11, 'Science Fiction'),
(38, 11, 'Fantastyka socjologiczna'),
(39, 11, 'Powieść'),
(40, 11, 'Dystopijna'),
(41, 11, 'Fikcja polityczna'),
(42, 12, 'Dramat'),
(43, 12, 'Powieść'),
(44, 12, 'Alegoria'),
(45, 12, 'Młodzieżowa'),
(46, 13, 'Horror')
GO
INSERT INTO Gatunki (ID_g,ID_a,Gatunek) VALUES 
(47, 13, 'Powieść'),
(48, 13, 'Dreszczowiec'),
(49, 13, 'Dark fantasy'),
(50, 13, 'Historia o dorastaniu'),
(51, 13, 'Fikcja polityczna'),
(52, 14, 'Science Fiction'),
(53, 14, 'Powieść'),
(54, 14, 'Młodzieżowa'),
(55, 14, 'Romans'),
(56, 14, 'Dystopia'),
(57, 15, 'Fantasy'),
(58, 15, 'Fantasy'),
(59, 15, 'Przygodowy'),
(60, 15, 'Młodzieżowa'),
(61, 15, 'Dreszczowiec'),
(62, 16, 'Romans'),
(63, 16, 'Fikcja'),
(64, 17, 'Klasyczna literatura'),
(65, 17, 'Powieść'),
(66, 17, 'Bildungsroman'),
(67, 17, 'Fikcja gotycka'),
(68, 17, 'Powieść graficzna'),
(69, 17, 'Fikcja autobiograficzna'),
(70, 18, 'Dramat'),
(71, 19, 'Fantasy'),
(72, 19, 'Epicka fantasy'),
(73, 20, 'Fantaqstyka'),
(74, 20, 'Fikcja'),
(75, 20, 'Okultyzm'),
(76, 20, 'Romans'),
(77, 20, 'Satyra'),
(78, 20, 'Low Fantasy'),
(79, 20, 'Powieść'),
(80, 20, 'Farsa'),
(81, 21, 'Powieść'),
(82, 21, 'Alegoria'),
(83, 21, 'Bildungsroman'),
(84, 21, 'Powieść marynistyczna'),
(85, 22, 'Fantasy'),
(86, 22, 'Epicka fantasy'),
(87, 23, 'Klasyczna literatura'),
(88, 23, 'Powieść'),
(89, 23, 'Psychologiczna'),
(90, 23, 'Kryminalna')
GO
INSERT INTO Gatunki (ID_g,ID_a,Gatunek) VALUES 
(91, 23, 'Filozoficzna'),
(92, 24, 'Opowiadanie'),
(93, 24, 'Fikcja'),
(94, 24, 'Zbiór opowiadań'),
(95, 25, 'Dramat'),
(96, 25, 'Powieść'),
(97, 25, 'Nowela'),
(98, 25, 'Publikacja encyklopedyczna'),
(99, 25, 'Psychologiczna'),
(100, 25, 'Proza feministyczna'),
(101, 26, 'Romans'),
(102, 26, 'Powieść'),
(103, 27, 'Przygodowa'),
(104, 27, 'Powieść'),
(105, 27, 'Młodzieżowa'),
(106, 28, 'Fantasy'),
(107, 28, 'Przygodowy'),
(108, 28, 'Saga'),
(109, 28, 'Epicka fantasy'),
(110, 28, 'Romans dworski'),
(111, 28, 'Heroic fantasy'),
(112, 29, 'Fantasy'),
(113, 29, 'Przygodowy'),
(114, 29, 'Młodzieżowa'),
(115, 29, 'Dreszczowiec'),
(116, 30, 'Horror'),
(117, 30, 'Powieść'),
(118, 30, 'Fikcja gotycka'),
(119, 30, 'Psychologiczny'),
(120, 30, 'Okultystyczna'),
(121, 31, 'Powieść'),
(122, 31, 'Fikcja'),
(123, 31, 'Kryminał'),
(124, 32, 'Powieść'),
(125, 33, 'Dla dzieci'),
(126, 34, 'Fantasy'),
(127, 34, 'Przygodowy'),
(128, 34, 'Saga'),
(129, 34, 'Epicka fantasy'),
(130, 34, 'Romans dworski'),
(131, 34, 'Heroic fantasy'),
(132, 35, 'Science Fiction'),
(133, 35, 'Fantastyka socjologiczna'),
(134, 35, 'Powieść'),
(135, 35, 'Dystopijna'),
(136, 35, 'Fikcja polityczna'),
(137, 36, 'Przygodowa'),
(138, 36, 'Fikcja'),
(139, 36, 'Dla dzieci'),
(140, 37, 'Klasyczna literatura'),
(141, 37, 'Powieść'),
(142, 37, 'Komedia'),
(143, 37, 'Dystopijna'),
(144, 37, 'Filozoficzna'),
(145, 37, 'Literatura absurdu'),
(146, 37, 'Fikcja polityczna'),
(147, 38, 'Romans'),
(148, 38, 'Tragedia')
GO
INSERT INTO Gatunki (ID_g,ID_a,Gatunek) VALUES 
(149, 38, 'Fikcja'),
(150, 39, 'Dla dzieci'),
(151, 40, 'Powieść'),
(152, 40, 'Filozoficzna'),
(153, 41, 'Autobiografia'),
(154, 42, 'Klasyczna literatura'),
(155, 42, 'Powieść'),
(156, 42, 'Dramat'),
(157, 43, 'Proza'),
(158, 44, 'Klasyczna literatura'),
(159, 45, 'Klasyczna literatura'),
(160, 45, 'Powieść'),
(161, 45, 'Fikcja'),
(162, 45, 'Powieść społeczno-obyczajowa'),
(163, 46, 'Fantasy'),
(164, 46, 'Horror'),
(165, 47, 'Fantasy'),
(166, 47, 'Powieść'),
(167, 47, 'Epicka fantasy'),
(168, 47, 'Powieść łotrzykowska'),
(169, 47, 'Przygodowa'),
(170, 48, 'Thriller'),
(171, 48, 'Dreszczowiec'),
(172, 48, 'Horror'),
(173, 48, 'Kryminał'),
(174, 48, 'Fikcja'),
(175, 48, 'Psychologiczny'),
(176, 49, 'Kryminał'),
(177, 49, 'Dreszczowiec'),
(178, 49, 'Fikcja'),
(179, 50, 'Kryminał'),
(180, 50, 'Powieść detektywistyczna'),
(181, 50, 'Fikcja')
GO

INSERT INTO Transakcje (ID_t,[Data transakcji], ID_audiobook, ID_uż) VALUES
(0, '2015-07-04', 2, 1),
(1, '2016-09-07', 7, 45),
(2, '2016-02-23', 9, 43),
(3, '2016-09-27', 13, 43),
(4, '2017-01-25', 14, 45),
(5, '2017-03-06', 16, 6),
(6, '2017-06-02', 18, 36),
(7, '2021-04-01', 19, 42),
(8, '2020-03-12', 20, 9),
(9, '2015-08-21', 21, 39),
(10, '2018-07-25', 22, 11),
(11, '2018-05-23', 23, 36),
(12, '2019-05-30', 24, 41),
(13, '2019-11-01', 25, 29),
(14, '2019-09-11', 26, 39),
(15, '2019-02-14', 27, 16),
(16, '2018-12-14', 28, 40),
(17, '2023-04-12', 29, 18),
(18, '2021-02-16', 30, 19),
(19, '2023-04-12', 31, 38),
(20, '2018-07-25', 32, 21),
(21, '2020-08-05', 33, 35),
(22, '2020-03-20', 34, 23),
(23, '2018-05-23', 35, 40),
(24, '2017-06-02', 36, 44),
(25, '2017-03-06', 37, 26),
(26, '2022-06-29', 38, 27),
(27, '2020-03-12', 41, 44),
(28, '2022-08-17', 44, 29),
(29, '2021-04-01', 45, 30),
(30, '2020-03-05', 13, 35),
(31, '2020-04-19', 25, 5),
(32, '2020-05-29', 42, 19),
(33, '2020-07-11', 19, 15),
(34, '2020-08-22', 47, 9),
(35, '2020-10-07', 16, 36),
(36, '2020-11-18', 34, 20),
(37, '2020-12-30', 1, 22),
(38, '2021-02-11', 26, 8),
(39, '2021-03-23', 43, 26),
(40, '2021-05-05', 20, 3),
(41, '2021-06-18', 48, 11),
(42, '2021-07-30', 17, 30),
(43, '2021-10-09', 36, 23),
(44, '2021-10-22', 3, 7),
(45, '2021-12-04', 31, 17),
(46, '2022-01-15', 49, 12),
(47, '2022-02-27', 18, 31),
(48, '2022-04-09', 37, 4),
(49, '2022-05-21', 4, 27),
(50, '2022-07-02', 32, 16)
GO
INSERT INTO Transakcje (ID_t,[Data transakcji], ID_audiobook, ID_uż) VALUES
(51, '2022-08-15', 50, 1),
(52, '2022-09-26', 21, 33),
(53, '2022-11-08', 38, 2),
(54, '2022-12-20', 5, 10),
(55, '2023-02-01', 33, 18),
(56, '2023-03-14', 50, 28),
(57, '2023-04-25', 22, 14),
(58, '2023-06-07', 39, 25),
(59, '2023-07-19', 6, 13),
(60, '2023-08-31', 23, 24),
(61, '2015-07-15', 3, 33),
(62, '2015-10-03', 13, 41),
(63, '2016-02-21', 42, 26),
(64, '2016-06-10', 18, 11),
(65, '2016-09-28', 37, 19),
(66, '2017-01-15', 10, 6),
(67, '2017-05-03', 46, 16),
(68, '2017-08-21', 32, 36),
(69, '2017-12-10', 27, 13),
(70, '2018-03-28', 2, 22),
(71, '2018-07-15', 31, 29),
(72, '2018-11-03', 23, 39),
(73, '2019-02-21', 17, 15),
(74, '2019-06-10', 43, 25),
(75, '2019-09-28', 26, 9),
(76, '2020-01-15', 38, 4),
(77, '2020-05-03', 8, 23),
(78, '2020-08-21', 19, 2),
(79, '2020-12-10', 14, 21),
(80, '2021-03-28', 27, 31),
(81, '2021-07-15', 11, 40),
(82, '2021-11-03', 30, 20),
(83, '2022-02-21', 6, 12),
(84, '2022-06-10', 44, 30),
(85, '2022-09-28', 21, 37),
(86, '2023-01-15', 39, 17),
(87, '2023-03-05', 28, 28),
(88, '2023-08-21', 41, 5),
(89, '2023-05-10', 35, 14),
(90, '2023-03-28', 20, 3)
GO

INSERT INTO Oceny (ID_o,ID_audio,  ID_osoby, Ocena,Komentarz) VALUES 
(0, 2, 1, 9, 'Świetny audiobook!'),
(1, 7, 45, 8, 'Bardzo dobra historia.'),
(2, 9, 43, 3, 'Słaba jakość dźwięku.'),
(3, 13, 43, NULL, NULL),
(4, 14, 45, 7, 'Dobry audiobook.'),
(5, 16, 6, 10, 'Jeden z najlepszych audiobooków, jakie słyszałem!'),
(6, 18, 36, 9, 'Bardzo polecam.'),
(7, 19, 42, 6, NULL),
(8, 20, 9, 7, 'Warto posłuchać.'),
(9, 21, 39, 7, NULL),
(10, 22, 11, 10, 'Niesamowity audiobook!'),
(11, 23, 36, 8, 'Przyjemne słuchanie.'),
(12, 24, 41, 7, 'Nieźle wykonany.'),
(13, 25, 29, NULL, NULL),
(14, 26, 39, 10, 'Zdecydowanie polecam!'),
(15, 27, 16, 8, 'Wciągająca historia.'),
(16, 28, 40, 8, 'Jakość wykonania na wysokim poziomie.'),
(17, 29, 18, 6, NULL),
(18, 30, 19, 7, 'Znakomity audiobook.'),
(19, 31, 38, 7, 'Całkiem niezły.'),
(20, 32, 21, 8, 'Solidna lektura.'),
(21, 33, 35, NULL, NULL),
(22, 34, 23, 7, 'Dobry audiobook!'),
(23, 35, 40, 9, 'Świetny audiobook!'),
(24, 36, 44, NULL, NULL),
(25, 37, 26, 5, 'Może być'),
(26, 38, 27, 9, 'Zdecydowanie polecam!'),
(27, 41, 44, 6, 'OK'),
(28, 44, 29, 8, NULL),
(29, 45, 30, 6, 'OK'),
(30, 13, 35, 9, 'Świetny audiobook!'),
(31, 25, 5, 8, 'Bardzo dobre.'),
(32, 42, 19, 9, 'Świetny audiobook!'),
(33, 19, 15, 8, NULL),
(34, 47, 9, 7, NULL),
(35, 16, 36, 9, NULL),
(36, 34, 20, 8, 'Dobrze się słucha.'),
(37, 1, 22, 9, NULL),
(38, 26, 8, 9, NULL),
(39, 43, 26, 10, 'Jeden z moich ulubionych audiobooków!'),
(40, 20, 3, 5, 'Nie zachwycił mnie.'),
(41, 48, 11, 9, 'Bardzo polecam.'),
(42, 17, 30, 7, 'Interesujący temat.'),
(43, 36, 23, NULL, NULL),
(44, 3, 7, 9, 'Wspaniała lektura.'),
(45, 31, 17, 8, 'Przyjemnie się słuchało.'),
(46, 49, 12, 9, 'Godny polecenia.'),
(47, 18, 31, 7, 'OK.'),
(48, 37, 4, 7, NULL),
(49, 4, 27, 9, 'Niezłe.'),
(50, 32, 16, 9,NULL)
GO
INSERT INTO Oceny (ID_o,ID_audio,  ID_osoby, Ocena,Komentarz) VALUES 
(51, 50, 1, 9, 'Świetny audiobook!'),
(52, 21, 33, 8, 'Wciągająca opowieść.'),
(53, 38, 2, 9, NULL),
(54, 5, 10, 5, 'Niezbyt imponujący.'),
(55, 33, 18, 8, NULL),
(56, 50, 28, 9, 'Naprawdę polecam.'),
(57, 22, 14, 7, 'Przyzwoity audiobook.'),
(58, 39, 25, 6, NULL),
(59, 6, 13, 5, 'Nieco przeciętny.'),
(61, 3, 33, 6, NULL),
(62, 13, 41, 7, NULL),
(63, 42, 26, 9, 'Jeden z moich ulubionych.'),
(64, 18, 11, 8, NULL),
(65, 37, 19, 8, 'Warto posłuchać.'),
(66, 10, 6, 9, 'Niesamowity audiobook!'),
(67, 46, 16, 9, 'Wspaniała lektura.'),
(68, 32, 36, 9, 'Świetnie się słucha.'),
(69, 27, 13, 9, NULL),
(70, 2, 22, 8, 'Całkiem przyjemne.'),
(71, 31, 29, 8, 'Dobry audiobook.'),
(72, 23, 39, 8, 'Przyjemne słuchanie.'),
(73, 17, 15, 7, 'Dobre.'),
(74, 43, 25, 9, 'Zachwycający audiobook.'),
(75, 26, 9, 6, 'Może być'),
(76, 38, 4, 6, NULL),
(77, 8, 23, 9, 'Wspaniała historia.'),
(78, 19, 2, 4, NULL),
(79, 14, 21, 8, 'Ciekawy pomysł.'),
(80, 27, 31, NULL, NULL),
(81, 11, 40, NULL, NULL),
(82, 30, 20, NULL, NULL),
(83, 6, 12, 8, 'Przyjemnie się słuchało.'),
(84, 44, 30, 9, 'Bardzo ciekawy.'),
(85, 21, 37, NULL, NULL),
(86, 39, 17, 8, 'Ciekawe nagranie.'),
(87, 28, 28, 9, 'Jeden z najlepszych audiobooków, jakie słyszałem!'),
(88, 41, 5, NULL, NULL),
(89, 35, 14, 8, 'Solidna lektura.'),
(90, 20, 3, 8, 'Warto przesłuchać.'),
(91, 5, 9, 4, 'Słaba jakość audiobooka :('),
(92, 5, 9, 1, 'Audiobook nagrywany tosterem 0.0')
GO
----------------------------------------------------------------------
------------------ Widoki---------------------------------------------
----------------------------------------------------------------------

--Widok 1
IF OBJECT_ID('Najczęściej kupowane audiobooki','V') IS NOT NULL
DROP VIEW [Najczęściej kupowane audiobooki]
GO

CREATE VIEW [Najczęściej kupowane audiobooki] AS 
(
SELECT COUNT(Transakcje.ID_audiobook) AS [Liczba kupionych],
Transakcje.ID_audiobook ,Audiobooki.Tytuł,Audiobooki.Autor,Audiobooki.Lektor FROM Transakcje INNER JOIN Audiobooki ON 
Transakcje.ID_audiobook=Audiobooki.ID_audiobooku GROUP BY Transakcje.ID_audiobook,Audiobooki.Tytuł,Audiobooki.Autor,Audiobooki.Lektor
)
GO


--Widok 2a
IF OBJECT_ID('Pomoc dla Widoku 2','V') IS NOT NULL
DROP VIEW [Pomoc dla Widoku 2]
GO

CREATE VIEW [Pomoc dla Widoku 2] AS 
(
SELECT Transakcje.ID_audiobook, Gatunki.Gatunek FROM Transakcje INNER JOIN Gatunki ON 
Transakcje.ID_audiobook=Gatunki.ID_a
)
GO

-- [Pomoc dla Widoku 2]
SELECT * FROM [Pomoc dla Widoku 2]


--Widok 2
IF OBJECT_ID('Najczęściej kupowane Gatunki','V') IS NOT NULL
DROP VIEW [Najczęściej kupowane Gatunki]
GO

CREATE VIEW [Najczęściej kupowane Gatunki] AS 
(
SELECT COUNT([Pomoc dla Widoku 2].Gatunek) AS [Liczba Gatunków należących do kupionych Audiobooków], 
Gatunki.Gatunek FROM [Pomoc dla Widoku 2] INNER JOIN Gatunki ON 
[Pomoc dla Widoku 2].ID_audiobook=Gatunki.ID_a GROUP BY Gatunki.Gatunek 
)
GO

--Widok 3a
IF OBJECT_ID('Pomoc dla Widoku 3','V') IS NOT NULL
DROP VIEW [Pomoc dla Widoku 3]
GO

CREATE VIEW [Pomoc dla Widoku 3] AS 
(
SELECT Transakcje.ID_audiobook, Audiobooki.Lektor FROM Transakcje INNER JOIN Audiobooki ON 
Transakcje.ID_audiobook=Audiobooki.ID_audiobooku
)
GO

-- [Pomoc dla Widoku 3]
SELECT * FROM [Pomoc dla Widoku 3]


--Widok 3
IF OBJECT_ID('Najchętniej słuchany Lektor','V') IS NOT NULL
DROP VIEW [Najchętniej słuchany Lektor]
GO

CREATE VIEW [Najchętniej słuchany Lektor] AS 
(
SELECT COUNT([Pomoc dla Widoku 3].Lektor) AS [Ilość kupionych audiobooków z udziałem lektora],[Pomoc dla Widoku 3].Lektor FROM [Pomoc dla Widoku 3] 
GROUP BY [Pomoc dla Widoku 3].Lektor
)
GO

--Widok pomocniczy do procedury
IF OBJECT_ID('Pomoc dla Procedury','V') IS NOT NULL
DROP VIEW [Pomoc dla Procedury]
GO

CREATE VIEW [Pomoc dla Procedury] AS 
(
SELECT Transakcje.ID_t, Transakcje.ID_audiobook, Transakcje.ID_uż,  Users.Imie, Users.Nazwisko 
FROM Users INNER JOIN Transakcje ON Users.ID_użytkownika=Transakcje.ID_uż
)
GO

-----------------------------------------------------------------
---Procedury-----------------------------------------------------
-----------------------------------------------------------------
IF OBJECT_ID('Audiobuki konkretnego Lektora','P') IS NOT NULL
DROP PROCEDURE [Audiobuki konkretnego Lektora]
GO

CREATE PROCEDURE [Audiobuki konkretnego Lektora] (@Lektor VARCHAR(255) OUTPUT ) AS
BEGIN 
IF NOT EXISTS (SELECT * FROM Audiobooki WHERE Lektor=@Lektor)
RAISERROR (N'Błądny Lektor: %s',16,1,@Lektor)
BEGIN TRY
SELECT * FROM Audiobooki WHERE Lektor=@Lektor
END TRY
BEGIN CATCH
SELECT
ErrorProcedure = ERROR_PROCEDURE(),
ErrorLine = ERROR_LINE(),
ErrorNumber = ERROR_NUMBER(),
ErrorMessage = ERROR_MESSAGE()
END CATCH
END
GO

IF OBJECT_ID('Audiobuki Kupione przez użytkownika','P') IS NOT NULL
DROP PROCEDURE [Audiobuki Kupione przez użytkownika]
GO

CREATE PROCEDURE [Audiobuki Kupione przez użytkownika] (@ID INT OUTPUT ) AS
BEGIN 
IF NOT EXISTS (SELECT ID_audiobooku, Tytuł,ID_uż,Imie,Nazwisko FROM [Pomoc dla Procedury] 
LEFT JOIN Audiobooki ON [Pomoc dla Procedury].ID_audiobook=Audiobooki.ID_audiobooku 
WHERE ID_uż=@ID)
RAISERROR (N'Niema użytkownika o ID: %d. Lub Niczego nie kupił!!!',16,1,@ID)
BEGIN TRY
(SELECT ID_audiobooku, Tytuł,ID_uż,Imie,Nazwisko FROM [Pomoc dla Procedury] 
INNER JOIN Audiobooki ON [Pomoc dla Procedury].ID_audiobook=Audiobooki.ID_audiobooku 
WHERE ID_uż=@ID)
END TRY
BEGIN CATCH
SELECT
ErrorProcedure = ERROR_PROCEDURE(),
ErrorLine = ERROR_LINE(),
ErrorNumber = ERROR_NUMBER(),
ErrorMessage = ERROR_MESSAGE()
END CATCH
END
GO

IF OBJECT_ID('Audiobuki-Ocena','P') IS NOT NULL
DROP PROCEDURE [Audiobuki-Ocena]
GO

CREATE PROCEDURE [Audiobuki-Ocena] (@Ocena INT OUTPUT ) AS
BEGIN 
IF NOT EXISTS (SELECT ID_audiobooku, Tytuł,Autor,Lektor,Ocena FROM Oceny
INNER JOIN Audiobooki ON Oceny.ID_audio=Audiobooki.ID_audiobooku 
WHERE Ocena = @Ocena)
RAISERROR (N'Błędna ocena lub brak audiobooków ocenie: %d !!!',16,1,@Ocena)
BEGIN TRY
(SELECT ID_audiobooku, Tytuł,Autor,Lektor,Ocena FROM Oceny
INNER JOIN Audiobooki ON Oceny.ID_audio=Audiobooki.ID_audiobooku 
WHERE Ocena = @Ocena)
END TRY
BEGIN CATCH
SELECT
ErrorProcedure = ERROR_PROCEDURE(),
ErrorLine = ERROR_LINE(),
ErrorNumber = ERROR_NUMBER(),
ErrorMessage = ERROR_MESSAGE()
END CATCH
END
GO

-----------------------------------------------------------------
---Wyświetlanie raportów-----------------------------------------
-----------------------------------------------------------------

-- Raport 1
SELECT * FROM [Najczęściej kupowane audiobooki]
ORDER BY [Liczba kupionych]  DESC 

-- Raport 2
SELECT * FROM [Najczęściej kupowane Gatunki]
ORDER BY [Najczęściej kupowane Gatunki].[Liczba Gatunków należących do kupionych Audiobooków] DESC


-- Raport 3
SELECT * FROM [Najchętniej słuchany Lektor]
ORDER BY [Ilość kupionych audiobooków z udziałem lektora] DESC



-- Raport 4
DECLARE @Lektor_parametr VARCHAR(100)
SET @Lektor_parametr='Michał Kowalczyk'
BEGIN TRY
EXEC [Audiobuki konkretnego Lektora] @Lektor_parametr
END TRY
BEGIN CATCH
DECLARE @ErrorMessage VARCHAR(255) = ERROR_MESSAGE()   
DECLARE @ErrorSeverity INT = ERROR_SEVERITY()          
DECLARE @ErrorState INT = ERROR_STATE()
PRINT 'Wystąpił błąd!!! ' + @ErrorMessage
END CATCH
GO

-- Raport 5
DECLARE @ID_parametr INT
SET @ID_parametr=33
BEGIN TRY
EXEC [Audiobuki Kupione przez użytkownika] @ID_parametr
END TRY
BEGIN CATCH
DECLARE @ErrorMessage VARCHAR(255) = ERROR_MESSAGE()  
DECLARE @ErrorSeverity INT = ERROR_SEVERITY()         
DECLARE @ErrorState INT = ERROR_STATE()
PRINT 'Wystąpił błąd!!! ' + @ErrorMessage
END CATCH
GO



-- Raport 6
DECLARE @Ocena_parametr INT
SET @Ocena_parametr=6
BEGIN TRY
EXEC [Audiobuki-Ocena] @Ocena_parametr
END TRY
BEGIN CATCH
DECLARE @ErrorMessage VARCHAR(255) = ERROR_MESSAGE()   
DECLARE @ErrorSeverity INT = ERROR_SEVERITY()          
DECLARE @ErrorState INT = ERROR_STATE()
PRINT 'Wystąpił błąd!!! ' + @ErrorMessage
END CATCH
GO

----Koniec Usunięcie Bazy------------------

USE master
GO

IF DB_ID('Internetowy serwis z Audiobookami') IS NOT NULL
DROP DATABASE [Internetowy serwis z Audiobookami]
GO
