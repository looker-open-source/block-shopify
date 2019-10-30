include: "//@{CONFIG_PROJECT_NAME}/product_tag.view"

view: product_tag {
  extends: [product_tag_config]
}

view: product_tag_core {
  sql_table_name: @{CONNECTION_NAME}.product_tag ;;

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

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [product.id]
  }
}
