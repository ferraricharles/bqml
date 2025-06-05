# Welcome to the BQML Training for Looker Experts 

Hello there, thank you for participating in our training, all the artifacts produced during the training as well as the instructions on how to do it by yourself will be later added here.

## Pre Work

Before our session there are some pre-requirements that would allow us to dive straight into the content.

This training assumes that you already have 

Please complete the bellow activities (it takes between 15 - 30 minutes)

1 - Upload the reviews_with_comments file to your bigquery, notice that, this should be in the same region as your ecomm dataset, the documentation is available here: https://cloud.google.com/bigquery/docs/batch-loading-data#loading_data_from_local_files

2 - Upload the views and the dashboard to the regarding folder, remember to rename the datasets in each view and to add the joins to the model

3 - (optional) Add this dimension to your order_items to speed up the queries

    dimension: days_since_sold {
      description: "Days since the order item was sold"
      label: "Days Since Sold"
      sql: TIMESTAMP_DIFF(${created_raw},CURRENT_TIMESTAMP(), DAY) ;;
    }

4 - Test it, go to your shared folders and check if there is a dashboard called "Reviews".
