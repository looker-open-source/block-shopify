view: top_15 {
  view_label: "Top 15s"
  derived_table: {
    explore_source: order {
      column: units { field: order_line.count_items }
      column: product_tag { field: product_tag.value }
      derived_column: rank { sql: RANK() OVER (ORDER BY units DESC) ;;}
      bind_all_filters: yes
      sort: { field: units desc: yes}
      limit: 15
    }
  }
  dimension: units {}
  dimension: product_tag {}
  dimension: rank {}
  dimension: item_name_ranked {
    group_label: "Simple Example"
    order_by_field: rank
    type: string
    sql: ${rank} || ') ' || ${product_tag} ;;
  }
}
