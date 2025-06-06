
HEY THIS IS JUST AN EXAMPLE

explore: order_items {
  label: "(1) Orders, Items and Users"
  view_name: order_items

  join: reviews_with_comments {
    relationship: one_to_one
    sql_on: ${reviews_with_comments.order_item_id} =  ${order_items.id};;
  }

  # Keep this commented until we get to use it
  # join: reviews_probs {
  #   relationship: one_to_one
  #   sql_on: ${reviews_probs.id} = ${order_items.id} ;;
  # }

}