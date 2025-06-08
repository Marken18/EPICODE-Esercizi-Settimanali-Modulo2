#creata vista col nome "product"
create view product as Select  P.ProductKey, P.ProductSubcategoryKey, CAT.ProductCategoryKey, P.EnglishProductName, CAT.EnglishProductCategoryName,  SUB.EnglishProductSubcategoryName
from dimproduct P 
join dimproductsubcategory SUB on P.ProductSubcategoryKey= SUB.ProductSubcategoryKey
join dimproductcategory CAT on SUB.ProductCategoryKey = CAT.ProductCategoryKey
group by CAT.ProductCategoryKey, CAT.EnglishProductCategoryName, 
P.ProductKey, P.EnglishProductName, SUB.EnglishProductSubcategoryName, SUB.ProductSubcategoryKey;


#creata vista col nome "reseller"
create view reseller as select RP.GeographyKey, RP.ResellerKey, RP.ResellerName, G.City, G.EnglishCountryRegionName
from dimreseller RP 
join dimgeography G on G.GeographyKey = RP.GeographyKey
group by RP.ResellerName, G.City, G.EnglishCountryRegionName, RP.ResellerKey, RP.GeographyKey;


#creata Vista col nome "sales"
create view sales as select P.ProductKey, S.ResellerKey, S.SalesTerritoryKey, S.OrderDate, S.SalesOrderNumber, S.SalesOrderLineNumber, S.OrderQuantity, S.SalesAmount, (S.SalesAmount - TotalProductCost) as Profit
from factresellersales S
join dimproduct P on S.ProductKey = P.ProductKey
group by S.SalesOrderNumber, S.SalesOrderLineNumber, S.OrderQuantity, S.SalesAmount, S.OrderDate, S.SalesTerritoryKey, P.ProductKey, S.ResellerKey, Profit;


#query per vedere le viste create
select * from sales;
select * from reseller;
select * from product;


