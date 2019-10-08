view: top_15_categories {
  view_label: "Top 15"
  derived_table: {
    explore_source: orders {
      column: units { field: order_line.count }
      column: product_tag { field: product_tag.value }
      # column: created_date { field: order.created_date }
      derived_column: rank { sql: RANK() OVER (ORDER BY units DESC) ;;}
      bind_all_filters: yes
      sort: { field: units desc: yes}
      # timezone: "query_timezone"
      limit: 15
    }
  }
  dimension: product_tag { group_label: "Simple Example"  }
  dimension: rank { type: number group_label: "Simple Example" }
  dimension: item_name_ranked {
    group_label: "Simple Example"
    order_by_field: rank
    type: string
    sql: ${rank} || ') ' || ${product_tag} ;;
  }
}
