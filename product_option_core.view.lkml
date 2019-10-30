include: "//@{CONFIG_PROJECT_NAME}/product_option.view"

view: product_option {
  extends: [product_option_config]
}

view: product_option_core {
  sql_table_name: @{CONNECTION_NAME}.product_option ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: values {
    type: string
    sql: ${TABLE}.values ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, product.id]
  }
}
