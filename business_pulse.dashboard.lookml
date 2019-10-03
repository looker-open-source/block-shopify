- dashboard: shopify_business_pulse
  title: Shopify Business Pulse
  layout: newspaper
  elements:
  - title: Untitled
    name: Untitled
    model: shopify
    explore: orders
    type: single_value
    fields: [order_line.avg_price, order.created_date]
    fill_fields: [order.created_date]
    sorts: [order.created_date desc]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
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
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Average Order Sale Price
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 4
  - title: New Tile
    name: New Tile
    model: shopify
    explore: orders
    type: single_value
    fields: [order.created_quarter, order_line.count]
    sorts: [order_line.count desc]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
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
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Orders This Quarter
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 4
  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: shopify
    explore: orders
    type: looker_area
    fields: [order_line.count, product_tag.value, order.created_date]
    pivots: [product_tag.value]
    fill_fields: [order.created_date]
    filters:
      # product_tag.value: "%boy%,%girl%"
      # order.created_year: '2019,2018'
      order.created_month: 2018/01/01 to 2019/12/31
    sorts: [orders_line.count desc 0, product_tag.value]
    limit: 500
    column_limit: 50
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
    listen: {}
    row: 16
    col: 8
    width: 16
    height: 9
  - name: Total Sales, Year Over Year
    title: Total Sales, Year Over Year
    model: shopify
    explore: orders
    type: looker_line
    fields: [order.created_year, order.created_month_num, order.total_revenue]
    pivots: [order.created_year]
    fill_fields: [order.created_year, order.created_month_num]
    sorts: [order.created_year, order.created_month_num]
    limit: 500
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Total Sale Price, maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: '2015',
            name: '2015', axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 195}, {id: '2016', name: '2016', axisId: order.total_revenue,
            __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 197},
          {id: '2017', name: '2017', axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 199}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 193}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month of Year
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: []
    legend_position: right
    colors: ['palette: Mixed Pastels']
    series_types: {}
    point_style: none
    series_colors:
      2018 - order.total_revenue: "#61A9A5"
      2019 - order.total_revenue: "#DBC361"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 4
    col: 13
    width: 11
    height: 6
  - title: New Customers This Year
    name: New Customers This Year
    model: shopify
    explore: orders
    type: single_value
    fields: [customer.created_year, order.count_new_customers]
    fill_fields: [customer.created_year]
    filters:
      customer.created_year: NOT NULL
    sorts: [customer.created_year desc]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${order.count_new_customers}/offset(${order.count_new_customers},1)",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: New Customers This Year
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: From Last Year
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825, __FILE: block-shopify/business_pulse.dashboard.lookml,
          __LINE_NUM: 276}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 275}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [customer.created_year]
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 4
  - name: Cohort Analysis
    title: Cohort Analysis
    model: shopify
    explore: orders
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear

    row: 16
    col: 0
    width: 8
    height: 9
  - title: Order Drop-off Rate
    name: Order Drop-off Rate
    model: shopify
    explore: orders
    type: looker_column
    fields: [customer.orders_count, customer.count]
    sorts: [customer.orders_count]
    limit: 5
    column_limit: 50
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
    series_colors:
      customers.count: "#1f3e5a"
    show_dropoff: true
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customers.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 380}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 378}]
    listen: {}
    row: 10
    col: 13
    width: 11
    height: 6
  - title: Top 5 Product Types Ordered
    name: Top 5 Product Types Ordered
    model: shopify
    explore: orders
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
            __LINE_NUM: 459}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 457}]
    series_types: {}
    colors: ['palette: Mixed Pastels']
    listen: {}
    row: 25
    col: 14
    width: 10
    height: 6
  - title: Total Revenue by Customer Creation Date
    name: Total Revenue by Customer Creation Date
    model: shopify
    explore: orders
    type: looker_line
    fields: [order.total_revenue, customer.created_date]
    fill_fields: [customer.created_date]
    sorts: [order.total_revenue desc]
    limit: 500
    column_limit: 50
    # query_timezone: America/New_York
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
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    map: usa
    map_projection: ''
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
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
    font_size: '12'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    map_latitude: 35.55904339525896
    map_longitude: -87.24380493164062
    map_zoom: 2
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Orders Total Order Revenue, axisId: orders.total_revenue,
            __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 553}],
        __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 551}]
    x_axis_label: Customer Creation Date
    listen: {}
    row: 25
    col: 0
    width: 14
    height: 6
  - title: Product  Revenue Performance by Month
    name: Product  Revenue Performance by Month
    model: shopify
    explore: orders
    type: looker_area
    fields: [order.created_month_num, product_tag.value, order.total_revenue]
    pivots: [product_tag.value]
    fill_fields: [order.created_month_num]
    filters:
      product_tag.value: "-NULL"
    sorts: [order.created_month_num, product.product_type desc]
    limit: 500
    column_limit: 5
    # query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
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
    show_null_points: false
    point_style: circle
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    font_size: '12'
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Orders Total Order Revenue, axisId: order.total_revenue,
            __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 651}],
        __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 649}]
    x_axis_label: Order Date
    focus_on_hover: false
    swap_axes: false
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    listen: {}
    row: 31
    col: 10
    width: 14
    height: 7
  - title: Top 10 Revenue Generating Cities
    name: Top 10 Revenue Generating Cities
    model: shopify
    explore: orders
    type: looker_column
    fields: [customer_address.city, order_line.total_lifetime_revenue]
    filters:
      customer_address.city: "-NULL"
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 10
    column_limit: 50
    # query_timezone: America/New_York
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
            name: Orders Total Order Revenue, axisId: order.total_revenue,
            __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 751}],
        __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 749}]
    x_axis_label: City
    focus_on_hover: false
    swap_axes: false
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    show_dropoff: false
    listen: {}
    row: 31
    col: 0
    width: 10
    height: 7
  - title: User Spend by Location
    name: User Spend by Location
    model: shopify
    explore: orders
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
    row: 4
    col: 0
    width: 13
    height: 12
