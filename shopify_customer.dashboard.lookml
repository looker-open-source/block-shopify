- dashboard: shopify_customer
  title: Shopify Customer
  layout: newspaper
  elements:
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
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 413
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    series_types: {}
    point_style: none
    series_colors:
      new - order.count: "#FFE663"
      repeat - order.count: "#4CB388"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    listen: {}
    row: 2
    col: 0
    width: 16
    height: 10
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
    row: 2
    col: 16
    width: 8
    height: 5
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
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 467
    series_colors:
      repeat: "#4CB388"
      new: "#FFE663"
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
    listen: {}
    row: 7
    col: 16
    width: 8
    height: 5
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
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 517
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: order_line.total_lifetime_revenue,
            id: order_line.total_lifetime_revenue, name: Total Lifetime Revenue}],
        showLabels: true, showValues: false, maxValue: !!null '', minValue: !!null '',
        valueFormat: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Country
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    colors: ['palette: Mixed Pastels']
    font_size: '12'
    series_types: {}
    point_style: circle
    series_colors:
      order_line.total_lifetime_revenue: "#4CB388"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    interpolation: linear
    value_labels: legend
    label_type: labPer
    focus_on_hover: false
    swap_axes: false
    show_dropoff: false
    listen: {}
    row: 12
    col: 0
    width: 8
    height: 5
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
    row: 17
    col: 0
    width: 8
    height: 5
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
    map_marker_color: ["#5DC370"]
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 12
    col: 8
    width: 16
    height: 10
  - title: Revenue by Customer Cohort
    name: Revenue by Customer Cohort
    model: block_shopify
    explore: order
    type: looker_line
    fields: [customer.created_month, order.created_month, order.total_revenue]
    pivots: [order.created_month]
    fill_fields: [customer.created_month, order.created_month]
    sorts: [customer.created_month desc, order.created_month]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 622
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order.total_revenue,
            id: 2018-04 - order.total_revenue, name: 2018-04, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 626}, {axisId: order.total_revenue, id: 2018-05 - order.total_revenue,
            name: 2018-05, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 628}, {axisId: order.total_revenue, id: 2018-06 - order.total_revenue,
            name: 2018-06, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 630}, {axisId: order.total_revenue, id: 2018-07 - order.total_revenue,
            name: 2018-07, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 632}, {axisId: order.total_revenue, id: 2018-08 - order.total_revenue,
            name: 2018-08, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 634}, {axisId: order.total_revenue, id: 2018-09 - order.total_revenue,
            name: 2018-09, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 636}, {axisId: order.total_revenue, id: 2018-10 - order.total_revenue,
            name: 2018-10, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 638}, {axisId: order.total_revenue, id: 2018-11 - order.total_revenue,
            name: 2018-11, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 640}, {axisId: order.total_revenue, id: 2018-12 - order.total_revenue,
            name: 2018-12, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 642}, {axisId: order.total_revenue, id: 2019-01 - order.total_revenue,
            name: 2019-01, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 644}, {axisId: order.total_revenue, id: 2019-02 - order.total_revenue,
            name: 2019-02, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 646}, {axisId: order.total_revenue, id: 2019-03 - order.total_revenue,
            name: 2019-03, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 648}, {axisId: order.total_revenue, id: 2019-04 - order.total_revenue,
            name: 2019-04, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 650}, {axisId: order.total_revenue, id: 2019-05 - order.total_revenue,
            name: 2019-05, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 652}, {axisId: order.total_revenue, id: 2019-06 - order.total_revenue,
            name: 2019-06, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 654}, {axisId: order.total_revenue, id: 2019-07 - order.total_revenue,
            name: 2019-07, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 656}, {axisId: order.total_revenue, id: 2019-08 - order.total_revenue,
            name: 2019-08, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 658}, {axisId: order.total_revenue, id: 2019-09 - order.total_revenue,
            name: 2019-09, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 660}, {axisId: order.total_revenue, id: 2019-10 - order.total_revenue,
            name: 2019-10, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 662}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 626}]
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
    row: 22
    col: 0
    width: 15
    height: 9
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
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 711
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customers.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 717}], __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 715}]
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
      customer.count: "#93CF6C"
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
    row: 22
    col: 15
    width: 9
    height: 9
  - name: ''
    type: text
    body_text: |-
      <div class="alert alert-info vis">
      <center>
      <font size="18"><font color="#5DC370">Shopify Customers</font></font>
      </center>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Order Count by Customer Age
    name: Order Count by Customer Age
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order.customer_age, order.count, order.created_month]
    pivots: [order.customer_age]
    fill_fields: [order.created_month]
    filters:
      order.customer_age: NOT NULL
    sorts: [order.customer_age, order.created_month desc]
    limit: 5000
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        reverse: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      "-2 - order.count": "#3BA2A0"
      "-1 - order.count": "#93CF6C"
      0 - order.count: "#2865BE"
      183 - order.count: "#5DC370"
      "-2 - calculation_1": "#359299"
      "-1 - calculation_1": "#5DC370"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    listen: {}
    row: 31
    col: 0
    width: 24
    height: 10
