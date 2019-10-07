connection: "@{CONNECTION_NAME}"

# include all views in this project
include: "views/*.view.lkml"
# include: "explores/*.explore.lkml"
# include all the dashboards
include: "*.dashboard"

explore: orders_core {
  hidden: yes
  extension: required
}


explore: orders {

  view_name: "order"
  extends: [orders_config]
  extension: required
  # ORDER
  join: order_line {
    sql_on: ${order_line.order_id} = ${order.id};;
    relationship: one_to_many
  }

  join: order_tag {
    sql_on: ${order_tag.order_id} = ${order.id};;
    relationship: many_to_one
  }

  join: location {
    sql_on: ${location.id} = ${order.location_id} ;;
    relationship: many_to_one
  }

  # PRODUCT
  join: product {
    sql_on: ${product.id} = ${order_line.product_id} ;;
    relationship: one_to_one
  }

  join: collect {
    sql_on: ${collect.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: collection {
    sql_on: ${collection.id} = ${collect.collection_id} ;;
    relationship: many_to_one
  }

  join: product_option {
    sql_on: ${product_option.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: product_tag {
    sql_on: ${product_tag.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: product_variant {
    sql_on: ${product_variant.id} = ${order_line.variant_id} ;;
    relationship: many_to_one
  }

  # CUSTOMER
  join: customer {
    sql_on: ${customer.id} = ${order.customer_id} ;;
    relationship: many_to_one
  }

  join: customer_address {
    sql_on: ${customer_address.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: customer_tag {
    sql_on: ${customer_tag.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

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
