- dashboard: shopify_overview
  title: Store Overview
  layout: newspaper
  preferred_viewer: dashboards-next
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
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 3090efc0-32d5-441e-85ca-793523ccc782
      options:
        steps: 5
        reverse: false
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 334
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Gross Sales Total, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 341}], __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 339}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
        orientation: right, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: order.count, name: Orders, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 347}], __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 344}]
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
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order.total_revenue: "#5DC370"
      order.count: "#CADB68"
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
    col: 6
    width: 18
    height: 8
  - title: Avg Order Value Over Time
    name: Avg Order Value Over Time
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order.created_month, order.total_revenue, order.count]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: avg_order_value, label: Avg Order Value,
        expression: "${order.total_revenue}/${order.count}", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 1218
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      avg_order_value: "#2865BE"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order.count, order.total_revenue]
    avg_order_value: "#1C2260"
    listen: {}
    row: 10
    col: 6
    width: 18
    height: 4
  - title: Avg Items per Order over Time
    name: Avg Items per Order over Time
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order.created_month, order_line.avg_items_per_order]
    fill_fields: [order.created_month]
    sorts: [order.created_month desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 1271
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: wow_change, id: wow_change,
            name: wow_change, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 1275}, {axisId: avg_items, id: avg_items, name: avg_items,
            __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml, __LINE_NUM: 1276}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 1275}]
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
    legend_position: right
    series_types: {}
    point_style: none
    series_colors:
      wow_change: "#BBE5B3"
      avg_items: "#4CB388"
    series_labels:
      avg_items: Average Items
      wow_change: WoW Change
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
    hidden_fields: []
    comparison_label: month-over-month
    listen: {}
    row: 14
    col: 6
    width: 18
    height: 4
  - title: Paid and Fulfilled Orders
    name: Paid and Fulfilled Orders
    model: block_shopify
    explore: order
    type: looker_column
    fields: [order.financial_status, order.fulfillment_status, order.count, order.created_date]
    pivots: [order.financial_status, order.fulfillment_status]
    fill_fields: [order.created_date]
    filters:
      order.financial_status: "-NULL"
      order.created_date: 30 days
    sorts: [order.financial_status, order.fulfillment_status, order.created_date desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 8509a00c-3f06-4a32-a9c0-d1edc5cc3b6d
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      refunded - order.fulfillment_status___null - order.count: "#FFE663"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 18
    col: 12
    width: 12
    height: 11
  - title: Revenue and Order Volume by Vendor
    name: Revenue and Order Volume by Vendor
    model: block_shopify
    explore: order
    type: looker_column
    fields: [product.vendor, order_line.total_lifetime_revenue, order_line.count_items]
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_line.total_lifetime_revenue,
            id: order_line.total_lifetime_revenue, name: Total Lifetime Revenue}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_line.count_items,
            id: order_line.count_items, name: Count Items}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    trellis_rows: 5
    series_types: {}
    point_style: none
    series_colors:
      order_line.total_lifetime_revenue: "#5DC370"
      order_line.count_items: "#359299"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    swap_axes: false
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 18
    col: 0
    width: 12
    height: 11
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div class="alert alert-info vis">
      <center>
      <font size="18"><font color="#5DC370">Shopify Overview</font></font>
      </center>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
