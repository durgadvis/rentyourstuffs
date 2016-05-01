--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype.   Implementers can change this file
-- to load their initial catalog.
--

--variables for use


-- Custom store navigation (default template uses these for the header navigation)
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE, DISPLAY_TEMPLATE) VALUES (2001,'Home','Home','/',CURRENT_TIMESTAMP, 'layout/home');
--INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (2002,'Hot Sauces','Hot Sauces','/hot-sauces',CURRENT_TIMESTAMP);
--INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (2003,'Merchandise','Merchandise','/merchandise',CURRENT_TIMESTAMP);
--INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (2004,'Clearance','Clearance','/clearance',CURRENT_TIMESTAMP);

--INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (2007,'Mens','Mens','/mens',CURRENT_TIMESTAMP);
--INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (2008,'Womens','Womens','/womens',CURRENT_TIMESTAMP);

--custom for rent your stuff- Level 0 -main category
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1000,'Books','Books','/books',CURRENT_TIMESTAMP);
--custom for rent your stuff-Level 1 sub-category
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1100,'Fiction And Non-Fiction','Fiction and Non-Fiction','/fiction-nonfiction',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1200,'Academic and professional','Academic and professional','/academic-professional',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1300,'History and Politics','History and Politics','/history-politics',CURRENT_TIMESTAMP);  
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1400,'Children Books','Children Books','/children-books',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1500,'Fashion and Life style','Fashion and Life style','/fashion-life-style',CURRENT_TIMESTAMP);

----custom for rent your stuff-Level 2 sub-category
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1110,'Comics','Comics','/comics',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1120,'Literature and Fiction','Literature and Fiction','/literature-fiction',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1130,'Drama','Drama','/drama',CURRENT_TIMESTAMP);

INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1210,'Medical','Medical','/medical',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1220,'MBA','MBA','/mba',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1230,'Commerce','Commerce','/commerce',CURRENT_TIMESTAMP);  
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1240,'Journalism','Journalism','/journalism',CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,ACTIVE_START_DATE) VALUES (1250,'Engineering','Engineering','/engineering',CURRENT_TIMESTAMP);


-- Builds the category hierarchy (simple in this case) - Merchandise --> Mens/Womens
--INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER, DEFAULT_REFERENCE) VALUES (8,2007,2003,1,TRUE);
--INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER, DEFAULT_REFERENCE) VALUES (9,2008,2003,2,TRUE);

--custom for rent your stuff - mapping between Level 1 and Level 0
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER, DEFAULT_REFERENCE) VALUES (100,1100,1000,1,TRUE);
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1200,1000,2,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1300,1000,3,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1400,1000,4,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1500,1000,5,true FROM BLC_CATEGORY_XREF;

--custom for rent your stuff - mapping between Level 2 and Level 1

INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1110,1100,1,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1120,1100,2,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1130,1100,3,true FROM BLC_CATEGORY_XREF;

INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1210,1200,1,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1220,1200,2,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1230,1200,3,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1240,1200,4,true FROM BLC_CATEGORY_XREF;
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID,DISPLAY_ORDER,DEFAULT_REFERENCE ) SELECT MAX( CATEGORY_XREF_ID )+1,1250,1200,5,true FROM BLC_CATEGORY_XREF;


-- Add in any applicable search facets for the given category
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (1, 'PRODUCT', 'manufacturer', 'mfg', TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (2, 'PRODUCT', 'productAttributes(heatRange).value', 'heatRange', FALSE, 'i');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (3, 'PRODUCT', 'defaultSku.retailPrice', 'price', FALSE, 'p');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE, FACET_FIELD_TYPE) VALUES (4, 'PRODUCT', 'defaultSku.name', 'name', TRUE, TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (5, 'PRODUCT', 'model', 'model', TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE) VALUES (6, 'PRODUCT', 'defaultSku.description', 'desc', TRUE, TRUE);
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE) VALUES (7, 'PRODUCT', 'defaultSku.longDescription', 'ldesc', TRUE, TRUE);
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, FRIENDLY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (8, 'PRODUCT', 'productOptionValuesMap(COLOR)', 'Color', 'color', TRUE, 'ss');
--custom for rent your stuff
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (100, 'PRODUCT', 'productAttributes(ISBN).value', 'ISBN', TRUE, 'l');

INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (1, 't');
-- Note that we are don't search on heat range
-- Note that we are don't search on price
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (4, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (5, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (6, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (7, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (8, 'ss');

--custom for rent your stuff
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (100, 'l');

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (1, 1, 'Manufacturer', FALSE, TRUE, 0);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (1, 1000, 1, 1);

--INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (2, 2, 'Heat Range', FALSE, TRUE, 0);
--INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (2, 2002, 2, 2);

--INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (4, 8, 'Color', TRUE, TRUE, 0);
--INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (4,2003, 4, 1);

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (3, 3, 'Price', TRUE, TRUE, 1);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (5, 1000, 3, 3);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (6, 1100, 3, 3);			
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (7, 1200, 3, 3);

INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (1, 3, 0, 5);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (2, 3, 5, 10);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (3, 3, 10, 15);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (4, 3, 15, null);

------------------------------------------------------------------------------------------------------------------
-- Inserting products manually involves five steps which are outlined below.   Typically, products are loaded 
-- up front in the project and then managed via the Broadleaf Commerce admin.   
--
-- Loading through this script is a convenient way to get started when prototyping and can be useful in development
-- as a way to share data-setup without requiring a shared DB connection. 
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 1:  Create the products
-- =============================================
-- In this step, we are also populating the manufacturer for the product
------------------------------------------------------------------------------------------------------------------


--custom for rent your stuff



-- Merchandise (products with options)

--INSERT INTO BLC_PRODUCT (PRODUCT_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (600,'/merchandise/heat_clinic_mascot_womens','The Heat Clinic',FALSE);

-- Bundles
--INSERT INTO BLC_PRODUCT_BUNDLE (AUTO_BUNDLE,BUNDLE_PROMOTABLE,ITEMS_PROMOTABLE,PRICING_MODEL,BUNDLE_PRIORITY,PRODUCT_ID) VALUES (false,false,false,'BUNDLE',99,993);



------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 2:  Create "default" SKUs
-- =============================================
-- The Broadleaf Commerce product model is setup such that every product has a default SKU.   For many products,
-- a product only has one SKU.    SKUs hold the pricing information for the product and are the actual entity
-- that is added to the cart.    Inventory, Pricing, and Fulfillment concerns are done at the SKU level
------------------------------------------------------------------------------------------------------------------

--INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (16,16,'Scotch Bonnet Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,'Y','Y',CURRENT_TIMESTAMP);

--custom for rent your stuff



--bundle1 Skus
--INSERT INTO BLC_SKU_BUNDLE_ITEM (SKU_BUNDLE_ITEM_ID,ITEM_SALE_PRICE,QUANTITY,PRODUCT_BUNDLE_ID,SKU_ID) VALUES (-101,null,1,992,2);

---bundle2 Skus
--INSERT INTO BLC_SKU_BUNDLE_ITEM (SKU_BUNDLE_ITEM_ID,ITEM_SALE_PRICE,QUANTITY,PRODUCT_BUNDLE_ID,SKU_ID) VALUES (-103,null,1,993,2);

------------------------------------------------------------------------------------------------------------------
-- Give some of the SKUs a sale price
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (19,19,'Roasted Red Pepper & Chipotle Hot Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.09,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Some SKUs (such as merchandise) may be product options based on one product. For example, there may be a 
-- "Men's Hand drawn Heat Clinic Shirt" product that has up to 12 SKUs showing the options of 
-- Red/Black/Silver, and Small/Medium/Large/X-Large
------------------------------------------------------------------------------------------------------------------

--INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED,USE_IN_SKU_GENERATION,VALIDATION_TYPE,VALIDATION_STRING,ERROR_MESSAGE,ERROR_CODE) VALUES (3, 'TEXT', 'NAME', 'Personalized Name', FALSE,FALSE,'REGEX','[a-zA-Z ]{0,30}','Name must be less than 30 characters, with only letters and spaces','INVALID_NAME');

--INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (14, 'XL', 4, 2);

--INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (600,600,'Heat Clinic Mascot (Women''s)','Don''t you just love our mascot? Get your very own shirt today!',15.99,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Update the DEFAULT_SKU_ID on the products
------------------------------------------------------------------------------------------------------------------

--UPDATE BLC_PRODUCT SET DEFAULT_SKU_ID = 600 WHERE PRODUCT_ID = 600;

--custom for rent your stuff
--UPDATE BLC_PRODUCT SET DEFAULT_SKU_ID = 1000 WHERE PRODUCT_ID = 1000;

------------------------------------------------------------------------------------------------------------------
-- Create non-default SKUs for some merchandise. In this case, we're stating that all XL shirts are $1.00 more
-- All other combinations have no special properties, but we must create them so we can track inventory on a 
-- per-SKU level. Generally, either you have only a default SKU or SKUs for all permutations of product options
------------------------------------------------------------------------------------------------------------------

--INSERT INTO BLC_SKU (SKU_ID,ADDL_PRODUCT_ID,DISCOUNTABLE_FLAG,ACTIVE_START_DATE,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,URL_KEY) VALUES (633,600,'Y',CURRENT_TIMESTAMP,'Heat Clinic Mascot (Women''s)','Don''t you just love our mascot? Get your very own shirt today!',15.99,'Y','/silver_l');

------------------------------------------------------------------------------------------------------------------
-- Associate the appropriate option values for the skus
------------------------------------------------------------------------------------------------------------------


--INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_OPTION_VALUE_XREF_ID, SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (143, 634, 3), (144, 634, 14);

------------------------------------------------------------------------------------------------------------------
-- Add some heat levels to all the products
------------------------------------------------------------------------------------------------------------------

--INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (19, 19, 'heatRange', 1);

--custom for rent your stuff
--INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (1000, 1000, 'ISBN', 9781400079155);

------------------------------------------------------------------------------------------------------------------
-- Add some heat levels to all the hot sauce skus
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_SKU_ATTRIBUTE (SKU_ATTR_ID, SKU_ID, NAME, VALUE) VALUES (19, 19, 'heatRange', 1);


--custom for rent your stuff
--INSERT INTO BLC_SKU_ATTRIBUTE (SKU_ATTR_ID, SKU_ID, NAME, VALUE) VALUES (1000,1000, 'ISBN', 9781400079155);

------------------------------------------------------------------------------------------------------------------
-- Associate the merchandise products with their appropriate available product options
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_XREF_ID, PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (13, 3, 100);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 3:  Create Category/Product Mapping
-- ========================================================
-- Add all hot-sauce items to the hot-sauce category
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER, DEFAULT_REFERENCE) VALUES (19,19,2002,19,TRUE);


--custom for rent your stuff
--INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER, DEFAULT_REFERENCE) VALUES (1000,1000,1110,20,TRUE);

-- home page items
--INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (23,12,2001,4);

-- clearance items
--INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (28,18,2004,5);

-- merchandise items
--INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER, DEFAULT_REFERENCE) VALUES (34,600,2003,6,TRUE);

-- Submenu merchandise items
--INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (40,600,2008,3);


------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 4:  Media Items used by products
-- ========================================================
------------------------------------------------------------------------------------------------------------------

--INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (60003,'/cmsstatic/img/merch/heat_clinic_mascot_womens_silver.jpg','Heat Clinic Mascot Women''s Silver','primary', 'Silver');


------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5:  Mapping for product to media
-- ========================================================
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_SKU_MEDIA_MAP (SKU_MEDIA_ID, BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (-41,600,60003,'alt2');

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5: Asset Items (media)
-- ========================================================
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (60003,'image/jpg','FILESYSTEM','/img/merch/heat_clinic_mascot_womens_silver.jpg','Heat Clinic Mascot Women''s Silver');





------------------------------------------------------------------------------------------------------------------
-- End of Catalog load
-- ========================================================
------------------------------------------------------------------------------------------------------------------

INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (1, '/googlePerm', 'http://www.google.com', 'REDIRECT_PERM');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (2, '/googleTemp', 'http://www.google.com', 'REDIRECT_TEMP');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (3, '/insanity', '/hot-sauces/insanity_sauce', 'FORWARD');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (4, '/jalepeno', '/hot-sauces/hurtin_jalepeno_hot_sauce', 'REDIRECT_TEMP');

INSERT INTO BLC_SEARCH_INTERCEPT(SEARCH_REDIRECT_ID, PRIORITY,SEARCH_TERM, URL) VALUES (1,1, 'insanity', '/hot-sauces/insanity_sauce');
INSERT INTO BLC_SEARCH_INTERCEPT(SEARCH_REDIRECT_ID,PRIORITY, SEARCH_TERM, URL,ACTIVE_START_DATE,ACTIVE_END_DATE) VALUES (2,-10, 'new york', '/search?q=pace picante','1992-10-15 14:28:36','1999-10-15 21:28:36');

-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-- RELATED PRODUCT - DATA (featured products for right-hand side display)
-----------------------------------------------------------------------------------------------------------------------------------
-- Adding to merchandise category
--INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (5, 1, 2003, 4);

-- Adding to hot-sauces category
--INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, sequence, CATEGORY_ID, PRODUCT_ID)  VALUES (8, 1, 2002, 500);
--INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (9, 2, 2002, 200);
--INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (10, 3, 2002, 300);

-- Adding a 20% off sale to Merchandise category to fit the Shirts Special Homepage Banner
--INSERT INTO BLC_OFFER (OFFER_ID, APPLIES_TO_RULES, OFFER_NAME, START_DATE, END_DATE, OFFER_TYPE, OFFER_DISCOUNT_TYPE, OFFER_VALUE, OFFER_DELIVERY_TYPE, STACKABLE, COMBINABLE_WITH_OTHER_OFFERS, OFFER_PRIORITY, APPLY_OFFER_TO_MARKED_ITEMS, APPLY_TO_SALE_PRICE, USES, MAX_USES) VALUES (1,NULL, 'Shirts Special',CURRENT_DATE,'2020-01-01 00:00:00','ORDER_ITEM','PERCENT_OFF',20,'AUTOMATIC',TRUE,TRUE,10,FALSE,FALSE,0,0);

--INSERT INTO BLC_OFFER_ITEM_CRITERIA (OFFER_ITEM_CRITERIA_ID, ORDER_ITEM_MATCH_RULE, QUANTITY) VALUES (1, 'MVEL.eval("toUpperCase()",discreteOrderItem.category.name)==MVEL.eval("toUpperCase()","merchandise")', 1);

--INSERT INTO BLC_TAR_CRIT_OFFER_XREF (OFFER_TAR_CRIT_ID, OFFER_ITEM_CRITERIA_ID, OFFER_ID) VALUES (-100, 1, 1);

-- Sample fulfillment option
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (1, 'Standard', '5 - 7 Days', FALSE, 'PHYSICAL_SHIP');
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (2, 'Priority', '3 - 5 Days', FALSE, 'PHYSICAL_SHIP');
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (3, 'Express', '1 - 2 Days', FALSE, 'PHYSICAL_SHIP');

INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (1, 10.00);
INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (2, 15.00);
INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (3, 20.00);


--custom for rent your stuff

INSERT INTO  RYS_RENT_TERMS (RENT_TERM_ID, RENT_TERM, TERM_PERCENTAGE) VALUES(100, 30,15);
INSERT INTO  RYS_RENT_TERMS (RENT_TERM_ID, RENT_TERM, TERM_PERCENTAGE) VALUES(101, 45,20);
INSERT INTO  RYS_RENT_TERMS (RENT_TERM_ID, RENT_TERM, TERM_PERCENTAGE) VALUES(102, 60,30);
INSERT INTO  RYS_RENT_TERMS (RENT_TERM_ID, RENT_TERM, TERM_PERCENTAGE) VALUES(103, 90,40);
INSERT INTO  RYS_RENT_TERMS (RENT_TERM_ID, RENT_TERM, TERM_PERCENTAGE) VALUES(104, 120,50);
