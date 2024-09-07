SELECT SUM(ExtendedPrice) AS OrderItemSum, AVG(ExtendedPrice) AS OrderItemAvg, MIN(ExtendedPrice) AS OrderItemMin, MAX(ExtendedPrice) AS OrderItemMax
FROM cape_codd.ORDER_ITEM;