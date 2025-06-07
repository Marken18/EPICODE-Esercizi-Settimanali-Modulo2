#esposta la tabella "dimproduct" per vedere il suo contenuto
select * from dimproduct;

#esposte le colonne della tabella "dimproduct" per vedere le loro caratteristiche, in questo caso ProductKey è una PK, infatti non ha valori nulli
show columns from dimproduct;

#esposte le colonne "SalesOrderNumber" e "SalesOrderLineNumber" in modo tale che facessero vedere se avessero valori nulli o ripetuti, sia per inclusione ed esclusione
select distinct SalesOrderNumber, SalesOrderLineNumber from factsales where SalesOrderNumber or SalesOrderLineNumber  is null;
select distinct SalesOrderNumber, SalesOrderLineNumber from factsales where SalesOrderNumber or SalesOrderLineNumber  is not null;

#esposto il conteggio degli ordini tramile "SalesOrderLineNumber" a partire dal 1 Gennaio 2020
select count(SalesOrderLineNumber) from factsales where OrderDate >= "2020-01-01";


#esposto i totali dei fatturati dei prodotti per prezzo, quantità e prezzo medio. Selezionato prima le colonne che vogliamo vedere dalla tabella con i risultati desiderati,
#poi fatto l'unione delle due tabelle per associare i dati tramite i nomi con le Key dei prodotti, successivamente imposta la condizione della data che 
#doveva riguardare solo giorni dal 01 Gennaio 2020 e infire si sono raggrupati i totali per nome e key prodotti
Select R.ProductKey, P.EnglishProductName,
sum(SalesAmount) as TotalSales,
sum(OrderQuantity) as TotalQuantity,
AVG(UnitPrice) as AveragePrice
from factresellersales R 
join dimproduct P on R.ProductKey = P.ProductKey
where R.OrderDate >="2020-01-01"
group by P.ProductKey, P.EnglishProductName;


#esposto il totale fatturato delle Categorie prodotti per valore e quantità, facendo più unioni per matchare le PK delle categorie e infine raggrupando per i nomi 
#delle categorie
Select CAT.ProductCategoryKey, CAT.EnglishProductCategoryName,
sum(SalesAmount) as TotalSales,
sum(OrderQuantity) as TotalQuantity
from factresellersales R 
join dimproduct P on R.ProductKey = P.ProductKey
join dimproductsubcategory SUB on P.ProductSubcategoryKey= SUB.ProductSubcategoryKey
join dimproductcategory CAT on SUB.ProductCategoryKey = CAT.ProductCategoryKey
group by CAT.ProductCategoryKey, CAT.EnglishProductCategoryName;


#esposto il totale del fatturato in valore per ogni città dal 01 Gennaio 2020, mettendo la condizione che fosse più di 60000
Select G.City,
SUM(SalesAmount) as TotalSales from factresellersales R 
join dimgeography G on G.SalesTerritoryKey = R.SalesTerritoryKey
where R.OrderDate >="2020-01-01" 
group by G.SalesTerritoryKey, R.SalesTerritoryKey
having TotalSales > 60000;




 
 
