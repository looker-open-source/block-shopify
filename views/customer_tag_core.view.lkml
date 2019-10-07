include: "//@{CONFIG_PROJECT_NAME}/customer_tag.view"

view: customer_tag {
  extends: [customer_tag_config]
}

view: customer_tag_core {
  sql_table_name: shopify_for_looker.customer_tag ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [customer.last_name, customer.id, customer.first_name]
  }
}
