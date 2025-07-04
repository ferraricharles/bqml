
view: reviews_probs {
  derived_table: {
    // Your LookML code here
  }

  measure: count {
    type: count
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: predicted {
    type: string
    sql: ${TABLE}.
predicted_reviews_sql_good_feedback;;
  }

  dimension: predicted_reviews_sql_good_feedback {
    hidden: yes
    type: string
    sql: ${TABLE}.predicted_reviews_sql_good_feedback ;;
  }

  dimension: predicted_reviews_sql_good_feedback_probs {
    hidden: yes
    type: string
    sql: ${TABLE}.predicted_reviews_sql_good_feedback_probs ;;
  }

}

view: model_querying__predicted_reviews_sql_good_feedback_probs {

  dimension: label {
    type: string
    sql: label ;;
  }
  dimension: model_querying__predicted_reviews_sql_good_feedback_probs {
    type: string
    hidden: yes
    sql: model_querying__predicted_reviews_sql_good_feedback_probs ;;
  }
  dimension: prob {
    type: number
    sql: prob ;;
  }
  measure: probability_yes  {
    filters: [label: "Yes"]
    type: median
    sql: ${prob};;
  }
  measure: probability_no  {
    filters: [label: "No"]
    type: median
    sql: ${prob}   ;;
  }

}
