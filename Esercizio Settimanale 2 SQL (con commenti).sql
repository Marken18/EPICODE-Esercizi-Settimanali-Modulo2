#esposto il risultato tra l'unione di "DimProduct" e "DimProductSubCategory" tramite le PK di entrambe e trasformando una delle due in FK
select * from dimproduct D
join dimproductsubcategory SUB on D.ProductSubcategoryKey = SUB.ProductSubcategoryKey
join dimproductsubcategory CAT on SUB.ProductSubcategoryKey = CAT.ProductCategoryKey
;

#esposto il risultato tra l'unione di "dimproduct" e "factresellersales" per tramite le PK dei Prodotti, Categorie e SottoCategorie
select *  from dimproduct D
join factresellersales F on D.ProductKey = F.ProductKey
;

#esposto il risultato dell'unione tra i prodotti e le fatture dei rivenditori per visualizzare i prodotti non venduti tramite i NULL degli ordini
select *  from dimproduct D
left join factresellersales F on D.ProductKey = F.ProductKey
where SalesOrderNumber is null 
and FinishedGoodsFlag = 1
;

#esposto l'elenco delle transazioni di vendita tramite l'unione delle due tabelle di prodotti e fatture con le loro PK e FK, indicando anche il nome del prodotto 
#scremando inoltre le colonne in più 
select SalesOrderNumber, SalesOrderLineNumber, OrderDate, F.ProductKey, D.EnglishProductName from factresellersales F 
left join dimproduct D on D.ProductKey = F.ProductKey
;


#Esposto l'elenco delle transazioni di vendita indicando le categorie e sottocategorie di ciascun prodotto venduto, 
#utilizzando più unioni con le tabelle prodotti,categorie,sottocategorie e fatture
select SalesOrderNumber, SalesOrderLineNumber, OrderDate, F.ProductKey, D.EnglishProductName, 
SUB.EnglishProductSubcategoryName, SUB.ProductSubcategoryKey, CAT.EnglishProductCategoryName
from factresellersales F 
left join dimproduct D on D.ProductKey = F.ProductKey
left join dimproductsubcategory SUB on D.ProductSubcategoryKey= SUB.ProductSubcategoryKey
left join dimproductcategory CAT on CAT.ProductCategoryKey = SUB.ProductCategoryKey
; 

#esposta l'intera tabella "DimReseller"
select * from dimreseller ; 


#Esposto l'elenco dei Reseller per nome e locazione geografica unendo più tabelle sfruttando le PK dei Territori 
select distinct R.ResellerName, R.ResellerKey, F.SalesTerritoryKey, ST.SalesTerritoryCountry, ST.SalesTerritoryRegion, ST.SalesTerritoryGroup from dimreseller R
left join factresellersales F on R.ResellerKey = F.ResellerKey
left join dimsalesterritory ST on F.SalesTerritoryKey = ST.SalesTerritoryKey
 ;
 
 
 #Esposto l'elenco dei Reseller per la loro PK unendo le tabelle dei Reseller e del Dimgeography per localizzare l'area geografica precisa
 select R.ResellerName, R.ResellerKey, G.City, G.EnglishCountryRegionName, G.StateProvinceName, G.GeographyKey from dimreseller R
 left join dimgeography G on G.GeographyKey = R.GeographyKey; 
 
 
#esposto l'elenco delle transazioni per le colonne indicate, ottenuto facendo più unioni con le tabelle che avessero relazioni tra le loro PK e FK
select R.SalesOrderNumber, R.SalesOrderLineNumber, R.OrderDate, R.UnitPrice, R.OrderQuantity, R.TotalProductCost, 
D.EnglishProductName, CAT.EnglishProductCategoryName, S.ResellerName, G.City, G.EnglishCountryRegionName, G.StateProvinceName
from factresellersales R
left join dimproduct D on D.ProductKey = R.ProductKey
left join dimproductsubcategory SUB on D.ProductSubcategoryKey= SUB.ProductSubcategoryKey
left join dimproductcategory CAT on CAT.ProductCategoryKey = SUB.ProductCategoryKey
left join dimreseller S on R.ResellerKey = S.ResellerKey
left join dimgeography G on G.GeographyKey = S.GeographyKey


;
 
 
 






