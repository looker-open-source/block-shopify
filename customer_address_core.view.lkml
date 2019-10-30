include: "//@{CONFIG_PROJECT_NAME}/customer_address.view"

view: customer_address {
  extends: [customer_address_config]
}

view: customer_address_core {
  sql_table_name: @{CONNECTION_NAME}.customer_address ;;
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

  dimension: company {
    group_label: "Address"
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_code {
    group_label: "Address"
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
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

  dimension: province_code {
    type: string
    sql: ${TABLE}.province_code ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      name,
      first_name,
      customer.last_name,
      customer.id,
      customer.first_name
    ]
  }
}
