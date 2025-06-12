
#creazione DB Azienda
CREATE DATABASE Azienda;

#Mostrare DBS
show databases;


#uso DB Azienda
use azienda;

#creazione tabella Store con PK incrementale
CREATE TABLE Store (
    StoreID INT AUTO_INCREMENT PRIMARY KEY,
    StoreName VARCHAR(100),
    OpeningDate DATE
);


#creazione tabella Region senza PK incrementale
CREATE TABLE Region (
	RegionID INT PRIMARY KEY,
    Città VARCHAR(100),
    Regione VARCHAR(100),
    AreaGeografica VARCHAR(100));
    
    
#inserimento dati creati dalla dummy con PK singole
    INSERT INTO Region (RegionID, Città, Regione, AreaGeografica) VALUES
(1, 'Roma', 'Lazio', 'Centro'),
(2, 'Milano', 'Lombardia', 'Nord-Ovest'),
(3, 'Napoli', 'Campania', 'Sud'),
(4, 'Torino', 'Piemonte', 'Nord-Ovest'),
(5, 'Palermo', 'Sicilia', 'Sud'),
(6, 'Firenze', 'Toscana', 'Centro'),
(7, 'Bologna', 'Emilia-Romagna', 'Nord'),
(8, 'Venezia', 'Veneto', 'Nord-Est'),
(9, 'Cagliari', 'Sardegna', 'Sud'),
(10, 'Genova', 'Liguria', 'Nord-Ovest');


#inserimento della dummy creata considerando la PK incrementale
INSERT INTO Store (StoreName, OpeningDate) VALUES
('SuperMarket A', '2020-01-15'),
('SuperMarket B', '2019-07-10'),
('Store C', '2021-03-05'),
('Store D', '2018-11-20'),
('Market E', '2022-06-30'),
('Store F', '2020-09-12'),
('Shop G', '2017-02-25'),
('Bazaar H', '2019-12-01'),
('Outlet I', '2021-08-14'),
('Center J', '2018-05-22');


#visualizzazione tabella Region
select * from region;

#visualizzazione tabella Store
select * from Store;

#cancellati record con data inferire al 2020 dalla tabella Store
DELETE FROM Store
WHERE OpeningDate < "2020-01-01";


#cancellati record con Bologna come città
DELETE FROM Region
WHERE città = bologna;

#aggiornata la tabella Store 
update Store set Storename = "Market B" where StoreID = 6;

#aggiornata la tabella Region
update region set AreaGeografica = "Isole" where RegionID IN (5,9);

#disabilitata la modalità safe per gli aggiornamenti
SET SQL_SAFE_UPDATES = 0;

#abilitata la modalità safe
SET SQL_SAFE_UPDATES = 1;
