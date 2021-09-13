view: location {
  sql_table_name: @{SCHEMA_NAME}.location ;;
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

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: address_1 {
    group_label: "Address"
    type: string
    sql: ${TABLE}.address_1 ;;
  }

  dimension: address_2 {
    group_label: "Address"
    type: string
    sql: ${TABLE}.address_2 ;;
  }

  dimension: city {
    group_label: "Address"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: legacy {
    type: yesno
    sql: ${TABLE}.legacy ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, order.count]
  }
}
