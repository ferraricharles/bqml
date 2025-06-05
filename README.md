# Welcome to the BQML Training for Looker Experts

Hello! Thank you for participating in our training. All artifacts and instructions from this session will be added here soon.

---

## Pre-Work

To ensure we can dive directly into the content during our session, please complete the following pre-requisites.



### 0. $\triangle$ Important Pre-requisite: E-commerce Dataset and Project

Skip this step if you have already the default demo project (aka Business Pulse)

In your Argolis Instance if you haven't yet, you can use the [Sample Project](https://cloud.google.com/looker/docs/looker-core-sample-project) (recommended)

This training requires the **e-comm dataset** to be ready to use in your Looker instance. If you haven't installed it yet, you can find a version with the e-commerce dataset pre-configured here: [https://github.com/ferraricharles/bqml_with_ecomm](https://github.com/ferraricharles/bqml_with_ecomm). 



Pleae complete the activities below, which should take approximately **15-30 minutes**.

### 1.  **Upload [`reviews_with_comments.json`](https://github.com/ferraricharles/bqml/blob/main/reviews_with_comments.json) to BigQuery**:
   * Upload this file to your BigQuery instance.
   * **$\triangle$ Critical Note:** Ensure this dataset is in the **same region** as your e-commerce dataset.
   * Refer to the official documentation for guidance on batch loading data: [https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files](https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files)
      
### 3.  **Upload [Views and Dashboard](https://github.com/ferraricharles/bqml/tree/main/lookml) to your Looker Instance**:
   * Upload the provided views and dashboard to their respective folders.
   * Remember to **rename the datasets** within each view and **add the necessary joins** to your model.

### 4.  **(Optional) Add `days_since_sold` Dimension**:
   * To potentially speed up your queries, consider adding this dimension to your `order_items` view:

    ```lookml
    dimension: days_since_sold {
      description: "Days since the order item was sold"
      label: "Days Since Sold"
      sql: TIMESTAMP_DIFF(${created_raw},CURRENT_TIMESTAMP(), DAY) ;;
    }
    ```

### 5.  **Verify Installation**:
   * Navigate to your shared folders and confirm that a dashboard named **"Reviews"** is present. The exact number of reviews displayed may vary depending on your e-commerce dataset version.

   <img width="1021" alt="image" src="https://github.com/user-attachments/assets/1043b4c2-2fe8-4883-9ed4-a93c760f95d0" />
