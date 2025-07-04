
CREATE OR REPLACE MODEL
-- TODO: REPLACE WITH YOUR OWN PROJECT AND DATASET
 `charles-looker.reviews.product_review_classifie_boosted_tree_latest`
OPTIONS
 (model_type='BOOSTED_TREE_CLASSIFIER',
  input_label_cols=['reviews_sql_good_feedback'],  
  auto_class_weights=FALSE
 ) AS
SELECT * from `charles-looker.reviews.input_data`


