# Power BI Star Schema — Hands-On Practice

Sample retail dataset for practicing star-schema data modeling in Power BI.

## Files
- `Fact_Sales.csv` — sales transactions (fact table)
- `Dim_Product.csv` — product info
- `Dim_Customer.csv` — customer info
- `Dim_Store.csv` — store info
- `Dim_Date.csv` — calendar table

## What to do
1. Import all 5 CSVs into Power BI Desktop.
2. In Model view, connect each dimension's key to the matching key in `Fact_Sales` (one-to-many).
3. Mark `Dim_Date` as a Date Table.
4. Arrange tables in a star shape: `Fact_Sales` in the center, dimensions around it.
5. Build a quick visual to test the relationships.

## Skills practiced
Fact/dimension tables, primary/foreign keys, one-to-many relationships, star schema, date tables.
