#selezionare TUTTI i dati della tabella "dimproduct"
select * from dimproduct; 

#selezionare solo le colonne indicate dalla tabella "dimproduct", dato un alias FGF a FinishedGoodsFlag
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag as FGF from dimproduct;

#impostata una condizione in cui FGF è uguale a 1 per filtrare i risultati
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag as FGF 
from dimproduct 
where FinishedGoodsFlag = 1; 

#impostata una condizione in cui i dati della colonna ProductAlternateKey abbiano FR o BK come iniziali
select ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, FinishedGoodsFlag from dimproduct 
where ProductAlternateKey 
like "FR%"
or ProductAlternateKey 
like "BK%";

#impostato un campo calcolato che crea la colonna "MarkUp" come risultato della differenza tra "ListPrice" e "StandardCost", con le stesse condizioni di filtro
select ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost as MarkUp from dimproduct 
where ProductAlternateKey 
like "FR%"
or ProductAlternateKey 
like "BK%";

#impostate più condizioni con: un intervallo di valori di "ListPrice", un filtro in ProductAlternateKey e FGF = 1
select ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost as MarkUp from dimproduct 
where (ListPrice >1000 and ListPrice <2000) 
and  (ProductAlternateKey like "FR%" or ProductAlternateKey like "BK%")
and FinishedGoodsFlag = 1;


#impostato la visualizzazione di tutta la tabella "dimemployee" con condizione "SalesPersonFlag" = 1 
select * from dimemployee 
where  SalesPersonFlag = 1;


#impostato la visualizzazione di tutta la tabella "factresellersales"
select * from factresellersales; 


#impostato la visualizzazione della stessa tabella ma con la condizione di data crescente dal 01/01/2020 e solo determinati prodotti specifici
select * from factresellersales where (OrderDate >= "2020-01-01")
and (ProductKey in	(597,598,477,214));


#impostata la stessa visualizzazione di prima ma solo per determinate colonne con un campo calcolato creato dalla differenza di "SalesAmount" e "TotalProductCost"
select SalesOrderNumber, OrderDate, ProductKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount, SalesAmount - TotalProductCost as Profitto
from factresellersales where (OrderDate >= "2020-01-01")
and (ProductKey in	(597,598,477,214));