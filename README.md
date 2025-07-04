# Step by Step BQML Exercise in Looker

This guide will walk you through a BigQuery ML (BQML) exercise, from data preparation to model deployment in Looker.

## Pre-work

Before you begin, you'll need to upload your **CSV data directly into your BigQuery instance**.

### 1. Upload a CSV File to BigQuery

* Navigate to the **BigQuery UI** in your Google Cloud project.
* In the "Explorer" pane, select the **dataset** where you want to upload your data (or create a new dataset if you need to).
* Click on the **"CREATE TABLE"** button (you'll usually find this within the dataset details or by clicking the three dots next to the dataset name).
* In the "Create table" panel:
    * For "Source," choose **"Upload"** and then click **"Browse"** to select your local CSV file.
    * For "File format," select **"CSV."**
    * Under "Destination," make sure the correct "Project" and "Dataset" are selected, and give your new table a **"Table name"** (e.g., `reviews`).
    * For "Schema," you can choose **"Auto detect"** to let BigQuery figure out the schema from your CSV, or you can define it manually.

---

<img src="https://github.com/user-attachments/assets/14a3b019-ae4d-4127-bb8d-ece9cd10c7d6" width="400" alt="Description of your image" />

## Step 1 - Build a Simple SELECT to Query the Data to Train the Model





The initial data selection is straightforward. You will query the `input_data` table within your `reviews` dataset.

```sql
SELECT * FROM `your_project.reviews.input_data
```

### Step 2 - Build the Model

(Try it first, then feel free to check Cheat 1)

Check the documentation and pick any additional option that might make your tree better, or, keep it with the default options and improve it later

```sql
CREATE OR REPLACE MODEL
 `[your project].[dataset to store the model].product_review_classifie_boosted_tree_latest`
OPTIONS
 (model_type='BOOSTED_TREE_CLASSIFIER',
  input_label_cols=['reviews_sql_good_feedback'],
  -- Add any additional config
  auto_class_weights=TRUE
 ) AS
SELECT [...] ### paste here your query
```

**TIP 1:** Use the Schedule feature in BigQuery so you can re-run the training often, or, create a process in Looker.

**TIP 2:** Copy the project + dataset + model to your clipboard/somewhere handy

### Step 3 - Check the Model

Use SQL query to check how good your model is. One way to go with it is to paste the results in Gemini or other LLM and ask it to evaluate the model for you.
<img width="1039" alt="image" src="https://github.com/user-attachments/assets/c8939036-77b9-4194-a660-3a0c635c8c0b" />

```sql
SELECT * FROM ML.EVALUATE(MODEL `[YOUR PROJECT].[DATASET].[MODEL NAME]`)
```

In the case of the Boosted tree, we will keep an special eye to the ROC which tells us the precision of our model. In our case of two labels (Yes and No), a random guess would be a 0.5 ROC.
Additionally, check what are the factors influencing the model the most by checking feature importance
```sql
SELECT * FROM ML.FEATURE_IMPORTANCE(MODEL `[YOUR PROJECT].[DATASET].[MODEL NAME]`)
```

### Step 4 - Query the Model

(Cheat 2)

By visiting the model you will see the required columns to get the model working.

Now to query the model, you need to first query your data with a select query that contains exactly those columns. If one of them isn't available, you can use null values but the columns need to be there.

Now it is time to move it into Looker:

Start by building a derived table. One option is to copy paste the code we just generated into SQL Runner. One other option is to save the query as a view in BigQuery. We will use the derived table option for now.


### Step 6 - Query the Data

Finally, query from the Explore the view and list the customers we want to contact based on the risk of them producing a bad review.

### Step 7 - BONUS - Add persistence to your derived Table
