connection: "looker_app"

# include all views in this project
include: "views/*.view.lkml"

# include all the dashboards
# include: "dashboards/*.dashboard"

explore: orders {

  view_name: "order"
  join: order_line {
    sql_on: ${order_line.order_id} = ${order.id};;
    relationship: one_to_one
  }
#   join: customers {
#     sql_on: ${customers.id} = ${orders.customer_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: customer_order_facts {
#     view_label: "Customers"
#     sql_on: ${customers._id} = ${customer_order_facts.customer_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }


}

# explore:  checkouts {
# }
# explore:  transactions {
# }
# explore:  products {
# }

#Large Dollars Amount format
named_value_format: largeamount {
  value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
}
