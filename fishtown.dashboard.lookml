- dashboard: sales_summary
  title: Shopify Fishtown
  layout: grid
  width: 800
  rows:
    - elements: [total_orders, total_revenue, total_customers]
      height: 200
    - elements: [items_per_order, avg_order_value, avg_customer_value]
      height: 200
    - elements: [sales_and_orders_over_time, avg_order_value_over_time]
      height: 300
    - elements: [new_vs_repeat_over_time,new_vs_repeat_pie, new_vs_repeat_stats]
      height: 300
    - elements: [top_products_units, top_products_gross]
      height: 300

  show_applied_filters: true
  filters:
  - name: date_range
    title: 'Date Range'
    type: field_filter
    explore: orders
    field: order.created_month
    default_value: '12 months ago for 12 months'
  - name: shop_name
    title: 'Shop Name'
    type: field_filter
    explore: orders
    field: location.name
  - name: new_or_repeat
    title: 'New or Repeating Users'
    type: field_filter
    explore: orders
    field: customer.new_vs_repeat
    default_value: 'new'

  elements:

  - name: total_orders
    title: Total Orders This Month
    model: shopify
    explore: orders
    type: single_value
    fields: [order.created_month, order.count]
    fill_fields: [order.created_month]
    filters:
      order.created_month: 12 months
      location.name: ''
      customer.new_vs_repeat: new
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${order.count}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${order.count} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    hidden_fields: [last_month]
    comparison_label: month-over-month



  - name: total_revenue
    title: Total Revenue
    type: single_value
    model: shopify
    explore: orders
    dimensions: [order.created_month]
    fill_fields: [order.created_month]
    measures: [order.total_revenue]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${order.total_revenue}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${order.total_revenue} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [order.created_month desc]
    limit: '500'
    column_limit: '50'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    hidden_fields: [last_month]
    comparison_label: month-over-month
#     listen:
#       date_range: order.processed_month
#       shop_name: location.name
#       new_or_repeat: customer.new_vs_repeat

  - name:  total_customers
    title: Total Customers
    type: single_value
    model: shopify
    explore: orders
    dimensions: [order.created_month]
    fill_fields: [order.created_month]
    measures: [customer.count]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${customer.count}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${customer.count} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [order.created_month desc]
    limit: '500'
    column_limit: '50'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    hidden_fields: [last_month]
    comparison_label: month-over-month
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat

  - name: items_per_order
    title: Avg Items per Order
    model: shopify
    explore: orders
    type: single_value
    dimensions: [order.created_month]
    fill_fields: [order.created_month]
    measures: [order_line.count_items, order.count]
    dynamic_fields:
    - table_calculation: avg_items
      label: avg_items
      expression: ${order_line.count_items}/${order.count}
      value_format:
      value_format_name: decimal_2
    - table_calculation: last_month
      label: last_month
      expression: offset(${avg_items}, 1)
      value_format:
      value_format_name: decimal_2
    - table_calculation: wow_change
      label: wow_change
      expression: "(${avg_items} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [order.created_month desc]
    limit: '500'
    column_limit: '50'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    hidden_fields: [order_line.count_items, order.count, last_month]
    comparison_label: month-over-month
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat

  - name: avg_order_value
    title: Avg Order Value
    type: single_value
    model: shopify
    explore: orders
    dimensions: [order.created_month]
    fill_fields: [order.created_month]
    measures: [order.avg_order_value]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${order.avg_order_value}, 1)
      value_format:
      value_format_name: usd
    - table_calculation: wow_change
      label: wow_change
      expression: "(${order.avg_order_value} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: usd
    sorts: [order.created_month desc]
    limit: '500'
    column_limit: '50'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    hidden_fields: [last_month]
    comparison_label: month-over-month
    listen:
    date_range: order.created_month
#     listen:
#       date_range: order.created_month
#       shop_name: shops.shop_name
#       new_or_repeat: order.new_vs_repeat

  - name: avg_customer_value
    title: Avg Customer Value
    model: shopify
    explore: orders
    type: single_value
    dimensions: [order.created_month]
    fill_fields: [order.created_month]
    measures: [order.total_revenue, customer.count]
    dynamic_fields:
    - table_calculation: avg_customer_value
      label: avg_customer_value
      expression: ${order.total_revenue}/${customer.count}
      value_format:
      value_format_name: usd
    - table_calculation: last_month
      label: last_month
      expression: offset(${avg_customer_value}, 1)
      value_format:
      value_format_name: usd
    - table_calculation: wow_change
      label: wow_change
      expression: "(${avg_customer_value} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [order.created_month desc]
    limit: '500'
    column_limit: '50'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    hidden_fields: [order.total_revenue, customer.count, last_month]
    comparison_label: month-over-month
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat

  - name: sales_and_orders_over_time
    title: Sales & Orders Over Time
    model: shopify
    explore: orders
    type: looker_line
    fields: [order.created_month, order.total_revenue, order.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Gross Sales Total, __FILE: shopify/fishtown.dashboard.lookml,
            __LINE_NUM: 438}], __FILE: shopify/fishtown.dashboard.lookml, __LINE_NUM: 436},
      {label: !!null '', maxValue: !!null '', minValue: !!null '', orientation: right,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.count,
            name: Orders, __FILE: shopify/fishtown.dashboard.lookml, __LINE_NUM: 442}],
        __FILE: shopify/fishtown.dashboard.lookml, __LINE_NUM: 439}]
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat


  - name: avg_order_value_over_time
    title: Avg Order Value Over Time
    model: shopify
    explore: orders
    type: looker_line
    fields: [order.created_month, order.total_revenue, order.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    dynamic_fields:
    - table_calculation: avg_order_value
      label: Avg Order Value
      expression: "${order.total_revenue}/${order.count}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    hidden_fields: [order.count, order.total_revenue]
    series_colors:
    avg_order_value: "#1C2260"
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat

  - name: top_products_units
    title: Top Products by Units Sold
    model: shopify
    explore: orders
    type: looker_bar
    fields: [order_line.count_items, product.title]
    filters:
      order_line.product_id: NOT NULL
    sorts: [order_line.count_items desc]
    limit: 20
    column_limit: 15
    dynamic_fields:
    - table_calculation: yesno
      label: yes/no
      expression: row()<=10
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    series_colors:
      order_line.count_items: "#EEC200"
    hidden_series: []
    x_axis_label: Product ID
    hidden_points_if_no: [yesno]
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat

  - name: top_products_gross
    title: Top Products by Gross Sale
    model: shopify
    explore: orders
    type: looker_bar
    fields: [order_line.total_lifetime_revenue, product.title]
    filters:
      order_line.product_id: NOT NULL
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 20
    column_limit: 15
    dynamic_fields:
    - table_calculation: yesno
      label: yes/no
      expression: row()<=10
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    series_colors:
      order_line.total_lifetime_revenue: "#EEC200"
    hidden_series: []
    x_axis_label: Product ID
    hidden_points_if_no: [yesno]
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat

  - name: new_vs_repeat_pie
    title: New vs Repeat Customers
    model: shopify
    explore: orders
    type: looker_pie
    fields: [customer.new_vs_repeat, customer.count]
    sorts: [customer.new_vs_repeat desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    series_colors:
      repeat: "#EEC200"
      new: "#007ACE"
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name

  - name: new_vs_repeat_over_time
    title: New vs Repeat Customer Count Over Time
    model: shopify
    explore: orders
    type: looker_line
    fields: [order.count, order.created_month, customer.new_vs_repeat]
    pivots: [customer.new_vs_repeat]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc, customer.new_vs_repeat]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    series_types: {}
    series_colors:
     new - order.count: "#EEC200"
     repeat - order.count: "#007ACE"
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name

  - name: new_vs_repeat_stats
    title: New vs Repeat Customer Stats
    model: shopify
    explore: orders
    type: looker_column
    fields: [order.avg_order_value, customer.new_vs_repeat, order.count, order_line.count_items]
    sorts: [order.avg_order_value desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: avg_order_items
      label: Avg Order Items
      expression: "${order_line.count_items}/${order.count}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: ['palette: Looker Classic']
    smoothedBars: false
    orientation: automatic
    groupBars: true
    showLegend: true
    series_colors:
      order.avg_order_value: "#EEC200"
      avg_order_items: "#007ACE"
    x_axis_label: New vs Repeat
    y_axes: [{label: '',
              maxValue: !!null '',
              minValue: !!null '',
              orientation: left,
              showLabels: true,
              showValues: true,
              tickDensity: default,
              tickDensityCustom: 5,
              type: linear,
              unpinAxis: false,
              valueFormat: !!null '',
              series: [{id: order.avg_order_value,
                        name: Avg Order Value}]
              },
              {label: !!null '',
               maxValue: !!null '',
               minValue: !!null '',
               orientation: right,
              showLabels: true,
              showValues: true,
              tickDensity: default,
              tickDensityCustom: 5,
              type: linear,
              unpinAxis: false,
              valueFormat: !!null '',
              series: [{id: avg_order_items, name: Avg Order Items}]
              }]
    hidden_fields: [order_line.count_items, order.count]
#     listen:
#       date_range: orders.processed_month
#       shop_name: shops.shop_name
#       new_or_repeat: orders.new_vs_repeat
