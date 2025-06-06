# Welcome to the BQML Training for Looker Experts

Hello! Thank you for participating in our training. All artifacts and instructions from this session will be added here soon.

---

## Pre-Work

To ensure we can dive directly into the content during our session, please complete the following pre-requisites.



### 0. $\triangle$ Important Pre-requisite: E-commerce Dataset and Project

Skip this step if you have already the default demo project (aka Business Pulse)

In your Argolis Instance if you haven't yet, you can use the [Sample Project](https://cloud.google.com/looker/docs/looker-core-sample-project) (recommended)

This training requires the **e-comm dataset** to be ready to use in your Looker instance. If you haven't installed it yet, you can find a version with the e-commerce dataset pre-configured here: [https://github.com/ferraricharles/bqml_with_ecomm](https://github.com/ferraricharles/bqml_with_ecomm). 



Please complete the activities below, which should take approximately **15-30 minutes**.

### 1.  **Upload [`reviews_with_comments.json`](https://github.com/ferraricharles/bqml/blob/main/reviews_with_comments.json) to BigQuery**:
   * Upload this file to your BigQuery instance.
   * **$\triangle$ Critical Note:** Ensure this dataset is in the **same region** as your e-commerce dataset. If you are using 
_looker-private-demo.ecomm_ dataset, add the file to the region US (multiregion)
   * Refer to the official documentation for guidance on batch loading data: [https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files](https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files)

#### How to
A - From your bigquery dataset (1), select create table (2)

<img width="500" alt="image" src="https://github.com/user-attachments/assets/ad5303d0-ea39-4af7-8eb5-2bd74baacae8" />

B - To upload the file, make sure to select Upload in the "Create table from" (1), Pick JSON format (2) and to instruct Bigquery to auto detect the schema.

<img width="500" alt="image" src="https://github.com/user-attachments/assets/fe54274a-7f71-49f6-b33e-3b46bfb8f122" />

      
### 3.  **Upload [Views and Dashboard](https://github.com/ferraricharles/bqml/tree/main/lookml) to your Looker Instance**:
   * Upload the provided views and dashboard to their respective folders.
   * Remember to **rename the datasets** within each view and [**copy the necessary joins**](https://github.com/ferraricharles/bqml/blob/main/lookml/thejoins.model.lookml) to your model. Note that the join of rates is a one-to-one with order_items.

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

   <img width="500" alt="image" src="https://github.com/user-attachments/assets/1043b4c2-2fe8-4883-9ed4-a93c760f95d0" />


A new warning will show up in your code, that's because of the view we haven't yet joined and we will do during the workshop


![image](https://github.com/user-attachments/assets/e0a43851-c649-458b-bec6-6f8fb52cffd2)


