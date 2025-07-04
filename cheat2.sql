SELECT * FROM ML.PREDICT(MODEL `[your project].[your dataset].product_review_classifie_boosted_tree_latest`, (SELECT
         order_items.id,
         TIMESTAMP_DIFF(CURRENT_DATE() , (DATE(order_items.created_at )), DAY) AS days_since_created,
         1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0)  AS order_items_item_gross_margin_percentage,
         order_items.sale_price - inventory_items.cost AS order_items_gross_margin,
         TRIM(products.brand)  AS products_brand,
         TRIM(products.category)  AS products_category,
         TRIM(products.department)  AS products_department,
         products.retail_price  AS products_retail_price,
         distribution_centers.name  AS distribution_centers_name
     FROM looker-private-demo.ecomm.order_items  AS order_items
     FULL OUTER JOIN looker-private-demo.ecomm.inventory_items  AS inventory_items ON inventory_items.id = order_items.inventory_item_id
     LEFT JOIN looker-private-demo.ecomm.products  AS products ON products.id = inventory_items.product_id
     LEFT JOIN looker-private-demo.ecomm.distribution_centers  AS distribution_centers ON distribution_centers.id = inventory_items.product_distribution_center_id
     ))

