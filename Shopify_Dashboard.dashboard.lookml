- dashboard: shopify_dashboard
  title: Shopify Dashboard
  layout: newspaper
  elements:
  - title: Total Orders This Month
    name: Total Orders This Month
    model: block_shopify
    explore: order
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
    dynamic_fields: [{table_calculation: last_month, label: last_month, expression: 'offset(${order.count},
          1)', value_format: !!null '', value_format_name: decimal_0}, {table_calculation: wow_change,
        label: wow_change, expression: "(${order.count} - ${last_month}) / ${last_month}",
        value_format: !!null '', value_format_name: percent_0}]
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
    listen: {}
    row: 6
    col: 0
    width: 6
    height: 4
  - title: Total Revenue
    name: Total Revenue
    model: block_shopify
    explore: order
    type: single_value
    fields: [order.created_month, order.total_revenue]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: last_month, label: last_month, expression: 'offset(${order.total_revenue},
          1)', value_format: !!null '', value_format_name: decimal_0}, {table_calculation: wow_change,
        label: wow_change, expression: "(${order.total_revenue} - ${last_month}) /\
          \ ${last_month}", value_format: !!null '', value_format_name: percent_0}]
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
    listen: {}
    row: 2
    col: 0
    width: 6
    height: 4
  - title: Avg Items per Order
    name: Avg Items per Order
    model: block_shopify
    explore: order
    type: single_value
    fields: [order.created_month, order_line.count_items, order.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: avg_items, label: avg_items, expression: "${order_line.count_items}/${order.count}",
        value_format: !!null '', value_format_name: decimal_2}, {table_calculation: last_month,
        label: last_month, expression: 'offset(${avg_items}, 1)', value_format: !!null '',
        value_format_name: decimal_2}, {table_calculation: wow_change, label: wow_change,
        expression: "(${avg_items} - ${last_month}) / ${last_month}", value_format: !!null '',
        value_format_name: percent_0}]
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
    listen: {}
    row: 14
    col: 0
    width: 6
    height: 4
  - title: Avg Order Value
    name: Avg Order Value
    model: block_shopify
    explore: order
    type: single_value
    fields: [order.created_month, order.avg_order_value]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: last_month, label: last_month, expression: 'offset(${order.avg_order_value},
          1)', value_format: !!null '', value_format_name: usd}, {table_calculation: wow_change,
        label: wow_change, expression: "(${order.avg_order_value} - ${last_month})\
          \ / ${last_month}", value_format: !!null '', value_format_name: usd}]
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
    date_range: order.created_month
    listen: {}
    row: 10
    col: 0
    width: 6
    height: 4
  - title: Avg Customer Value
    name: Avg Customer Value
    model: block_shopify
    explore: order
    type: single_value
    fields: [order.created_month, order.total_revenue, customer.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: avg_customer_value, label: avg_customer_value,
        expression: "${order.total_revenue}/${customer.count}", value_format: !!null '',
        value_format_name: usd}, {table_calculation: last_month, label: last_month,
        expression: 'offset(${avg_customer_value}, 1)', value_format: !!null '', value_format_name: usd},
      {table_calculation: wow_change, label: wow_change, expression: "(${avg_customer_value}\
          \ - ${last_month}) / ${last_month}", value_format: !!null '', value_format_name: percent_0}]
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
    listen: {}
    row: 34
    col: 0
    width: 7
    height: 4
  - title: Sales & Orders Over Time
    name: Sales & Orders Over Time
    model: block_shopify
    explore: order
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
            name: Gross Sales Total, __FILE: block-shopify/fishtown.dashboard.lookml,
            __LINE_NUM: 444}], __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 442},
      {label: !!null '', maxValue: !!null '', minValue: !!null '', orientation: right,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.count,
            name: Orders, __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 449}],
        __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 447}]
    listen: {}
    row: 2
    col: 6
    width: 18
    height: 8
  - title: Avg Order Value Over Time
    name: Avg Order Value Over Time
    model: block_shopify
    explore: order
    type: looker_line
    fields: [order.created_month, order.total_revenue, order.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: avg_order_value, label: Avg Order Value,
        expression: "${order.total_revenue}/${order.count}", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    stacking: ''
    hidden_fields: [order.count, order.total_revenue]
    series_colors:
    avg_order_value: "#1C2260"
    listen: {}
    row: 10
    col: 6
    width: 18
    height: 4
  - title: Top Products by Units Sold
    name: Top Products by Units Sold
    model: block_shopify
    explore: order
    type: looker_bar
    fields: [order_line.count_items, product.title]
    filters:
      order_line.product_id: NOT NULL
    sorts: [order_line.count_items desc]
    limit: 20
    column_limit: 15
    dynamic_fields: [{table_calculation: yesno, label: yes/no, expression: row()<=10,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
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
    listen: {}
    row: 54
    col: 0
    width: 8
    height: 7
  - title: Top Products by Gross Sale
    name: Top Products by Gross Sale
    model: block_shopify
    explore: order
    type: looker_bar
    fields: [order_line.total_lifetime_revenue, product.title]
    filters:
      order_line.product_id: NOT NULL
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 20
    column_limit: 15
    dynamic_fields: [{table_calculation: yesno, label: yes/no, expression: row()<=10,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
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
    listen: {}
    row: 54
    col: 8
    width: 7
    height: 7
  - title: New vs Repeat Customers
    name: New vs Repeat Customers
    model: block_shopify
    explore: order
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
    listen: {}
    row: 24
    col: 17
    width: 7
    height: 4
  - title: New vs Repeat Customer Count Over Time
    name: New vs Repeat Customer Count Over Time
    model: block_shopify
    explore: order
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
    listen: {}
    row: 20
    col: 0
    width: 17
    height: 8
  - title: New vs Repeat Customer Stats
    name: New vs Repeat Customer Stats
    model: block_shopify
    explore: order
    type: looker_column
    fields: [order.avg_order_value, customer.new_vs_repeat, order.count, order_line.count_items]
    sorts: [order.avg_order_value desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: avg_order_items, label: Avg Order Items,
        expression: "${order_line.count_items}/${order.count}", value_format: !!null '',
        value_format_name: decimal_1, _kind_hint: measure, _type_hint: number}]
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
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.avg_order_value,
            name: Avg Order Value, __FILE: block-shopify/fishtown.dashboard.lookml,
            __LINE_NUM: 746}], __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 735},
      {label: !!null '', maxValue: !!null '', minValue: !!null '', orientation: right,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: avg_order_items,
            name: Avg Order Items, __FILE: block-shopify/fishtown.dashboard.lookml,
            __LINE_NUM: 760}], __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 749}]
    hidden_fields: [order_line.count_items, order.count]
    listen: {}
    row: 63
    col: 15
    width: 7
    height: 6
  - name: Overview
    type: text
    title_text: Overview
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Customers
    type: text
    title_text: Customers
    row: 18
    col: 0
    width: 24
    height: 2
  - name: Products
    type: text
    title_text: Products
    row: 45
    col: 0
    width: 24
    height: 2
  - title: User Spend by Location
    name: User Spend by Location
    model: block_shopify
    explore: order
    type: looker_map
    fields: [order.shipping_location, order.total_revenue]
    sorts: [order.total_revenue desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
    map_position: fit_data
    map_latitude: -71.90918219403265
    map_longitude: 14.449768066406252
    map_zoom: 1
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    map_marker_color: [green]
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 28
    col: 7
    width: 17
    height: 10
  - title: Customers by Monthly Cohorts
    name: Customers by Monthly Cohorts
    model: block_shopify
    explore: order
    type: looker_line
    fields: [customer.created_month, order.created_month, order.total_revenue]
    pivots: [order.created_month]
    fill_fields: [customer.created_month, order.created_month]
    sorts: [customer.created_month desc, order.created_month]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order.total_revenue,
            id: 2018-04 - order.total_revenue, name: 2018-04, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 974}, {axisId: order.total_revenue, id: 2018-05 - order.total_revenue,
            name: 2018-05, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 975}, {axisId: order.total_revenue, id: 2018-06 - order.total_revenue,
            name: 2018-06, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 976}, {axisId: order.total_revenue, id: 2018-07 - order.total_revenue,
            name: 2018-07, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 977}, {axisId: order.total_revenue, id: 2018-08 - order.total_revenue,
            name: 2018-08, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 978}, {axisId: order.total_revenue, id: 2018-09 - order.total_revenue,
            name: 2018-09, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 979}, {axisId: order.total_revenue, id: 2018-10 - order.total_revenue,
            name: 2018-10, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 980}, {axisId: order.total_revenue, id: 2018-11 - order.total_revenue,
            name: 2018-11, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 981}, {axisId: order.total_revenue, id: 2018-12 - order.total_revenue,
            name: 2018-12, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 982}, {axisId: order.total_revenue, id: 2019-01 - order.total_revenue,
            name: 2019-01, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 983}, {axisId: order.total_revenue, id: 2019-02 - order.total_revenue,
            name: 2019-02, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 984}, {axisId: order.total_revenue, id: 2019-03 - order.total_revenue,
            name: 2019-03, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 985}, {axisId: order.total_revenue, id: 2019-04 - order.total_revenue,
            name: 2019-04, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 986}, {axisId: order.total_revenue, id: 2019-05 - order.total_revenue,
            name: 2019-05, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 987}, {axisId: order.total_revenue, id: 2019-06 - order.total_revenue,
            name: 2019-06, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 988}, {axisId: order.total_revenue, id: 2019-07 - order.total_revenue,
            name: 2019-07, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 989}, {axisId: order.total_revenue, id: 2019-08 - order.total_revenue,
            name: 2019-08, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 990}, {axisId: order.total_revenue, id: 2019-09 - order.total_revenue,
            name: 2019-09, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 991}, {axisId: order.total_revenue, id: 2019-10 - order.total_revenue,
            name: 2019-10, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 992}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 974}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    point_style: none
    series_labels: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    listen: {}
    row: 38
    col: 0
    width: 17
    height: 7
  - name: Extra
    type: text
    title_text: Extra
    row: 61
    col: 0
    width: 24
    height: 2
  - title: Top 10 Countries by Revenue
    name: Top 10 Countries by Revenue
    model: block_shopify
    explore: order
    type: looker_bar
    fields: [order_line.total_lifetime_revenue, customer_address.country]
    filters:
      customer_address.country: "-NULL"
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 10
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: right
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
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    font_size: '12'
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Orders Total Order Revenue, axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 581}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 579}]
    x_axis_label: City
    focus_on_hover: false
    swap_axes: false
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    show_dropoff: false
    series_types: {}
    listen: {}
    row: 28
    col: 0
    width: 7
    height: 6
  - title: Avg Items per Order over Time
    name: Avg Items per Order over Time
    model: block_shopify
    explore: order
    type: looker_line
    fields: [order.created_month, order_line.count_items, order.count]
    fill_fields: [order.created_month]
    sorts: [avg_items]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: avg_items, label: avg_items, expression: "${order_line.count_items}/${order.count}",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}, {table_calculation: last_month, label: last_month, expression: 'offset(${avg_items},
          1)', value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}, {table_calculation: wow_change, label: wow_change, expression: "(${avg_items}\
          \ - ${last_month}) / ${last_month}", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    hidden_fields: [order_line.count_items, order.count, last_month]
    comparison_label: month-over-month
    listen: {}
    row: 14
    col: 6
    width: 18
    height: 4
  - title: Product Type Breakdown
    name: Product Type Breakdown
    model: block_shopify
    explore: order
    type: looker_pie
    fields: [order_line.total_lifetime_revenue, product_tag.value]
    sorts: [order_line.total_lifetime_revenue desc, product_tag.value]
    limit: 5
    column_limit: 50
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: true
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
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_colors: {}
    show_dropoff: false
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customer.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 375}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 373}]
    series_types: {}
    colors: ['palette: Mixed Pastels']
    listen: {}
    row: 47
    col: 17
    width: 7
    height: 7
  - title: Orders By Day and Product Tag (Top 15)
    name: Orders By Day and Product Tag (Top 15)
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order_line.count, product_tag.value, order.created_date]
    pivots: [product_tag.value]
    fill_fields: [order.created_date]
    filters:
      order.created_month: 2018/01/01 to 2019/12/31
    sorts: [product_tag.value, order.created_date desc]
    limit: 500
    column_limit: 15
    stacking: normal
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
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    x_axis_datetime_tick_count: 10
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    row: 47
    col: 0
    width: 17
    height: 7
  - title: Total Customers This Month
    name: Total Customers This Month
    model: block_shopify
    explore: order
    type: single_value
    fields: [order.created_month, customer.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: last_month, label: last_month, expression: 'offset(${customer.count},
          1)', value_format: !!null '', value_format_name: decimal_0}, {table_calculation: wow_change,
        label: wow_change, expression: "(${customer.count} - ${last_month}) / ${last_month}",
        value_format: !!null '', value_format_name: percent_0}]
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
    listen: {}
    row: 20
    col: 17
    width: 7
    height: 4
  - title: Repeat Customer Breakdown
    name: Repeat Customer Breakdown
    model: block_shopify
    explore: order
    type: looker_column
    fields: [customer.order_count, customer.count]
    filters:
      customer.order_count: NOT NULL
    sorts: [customer.order_count]
    limit: 5
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customers.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 296}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 294}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      customers.count: "#d088c5"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 38
    col: 17
    width: 7
    height: 7
