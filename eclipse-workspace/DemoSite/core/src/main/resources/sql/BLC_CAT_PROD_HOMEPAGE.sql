-- Updated the top selling price for Home page

UPDATE BLC_CATEGORY_PRODUCT_XREF SET PRODUCT_ID=10000004 WHERE CATEGORY_PRODUCT_ID=20;
UPDATE BLC_CATEGORY_PRODUCT_XREF SET PRODUCT_ID=10000012 WHERE CATEGORY_PRODUCT_ID=21;
UPDATE BLC_CATEGORY_PRODUCT_XREF SET PRODUCT_ID=10000024 WHERE CATEGORY_PRODUCT_ID=22;
UPDATE BLC_CATEGORY_PRODUCT_XREF SET PRODUCT_ID=10000036 WHERE CATEGORY_PRODUCT_ID=23;

--content title
UPDATE BLC_SC_FLD SET VALUE='Rent Your Stuffs - Best Sellers' where SC_FLD_ID=11;