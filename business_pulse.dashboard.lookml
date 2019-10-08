- dashboard: shopify_business_pulse
  title: Shopify Business Pulse
  layout: newspaper
  elements:
  - title: Untitled
    name: Untitled
    model: block_shopify
    explore: order
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
    model: block_shopify
    explore: order
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
    single_value_title: order This Quarter
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 4
  - name: Top 15 Product Tag Orders
    title: Top 15 Product Tag Orders
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order_line.count, order.created_date, top_15.product_tag]
    pivots: [top_15.product_tag]
    fill_fields: [order.created_date]
    filters:
      order.created_month: 2018/01/01 to 2019/12/31
    sorts: [order.created_date desc, top_15.product_tag]
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
    row: 35
    col: 8
    width: 16
    height: 9
  - title: Total Sales, Year Over Year
    name: Total Sales, Year Over Year
    model: block_shopify
    explore: order
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
        __FILE: block-shopify/business_pulse.dashboard.lookml
        __LINE_NUM: 169
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Total Sale Price, maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: '2015',
            name: '2015', axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 175}, {id: '2016', name: '2016', axisId: order.total_revenue,
            __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 177},
          {id: '2017', name: '2017', axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 179}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 173}]
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
      2018 - order.total_revenue: "#8eadd8"
      2019 - order.total_revenue: "#9b82da"
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
    listen: {}
    row: 4
    col: 12
    width: 12
    height: 7
  - title: New Customers This Year
    name: New Customers This Year
    model: block_shopify
    explore: order
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
          __LINE_NUM: 244}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: block-shopify/business_pulse.dashboard.lookml, __LINE_NUM: 243}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [customer.created_year]
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 4
  - title: Order Drop-off Rate
    name: Order Drop-off Rate
    model: block_shopify
    explore: order
    type: looker_column
    fields: [customer.order_count, customer.count]
    sorts: [customer.order_count]
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
      customer.count: "#d088c5"
    show_dropoff: true
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customer.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 337}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 335}]
    listen: {}
    row: 11
    col: 13
    width: 11
    height: 6
  - title: Top 5 Product Types Ordered
    name: Top 5 Product Types Ordered
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
            __LINE_NUM: 416}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 414}]
    series_types: {}
    colors: ['palette: Mixed Pastels']
    listen: {}
    row: 35
    col: 0
    width: 8
    height: 9
  - title: Total Revenue by Customer Creation Date
    name: Total Revenue by Customer Creation Date
    model: block_shopify
    explore: order
    type: looker_line
    fields: [order.total_revenue, customer.created_date]
    fill_fields: [customer.created_date]
    sorts: [order.total_revenue desc]
    limit: 500
    column_limit: 50
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
    map_marker_color: ["#ff6961"]
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    font_size: '12'
    custom_color_enabled: false
    custom_color: "#ffe89f"
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
            name: order Total Order Revenue, axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 510}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 508}]
    x_axis_label: Customer Creation Date
    listen: {}
    row: 23
    col: 13
    width: 11
    height: 6
  - title: Product  Revenue Performance by Month
    name: Product  Revenue Performance by Month
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order.created_month_num, product_tag.value, order.total_revenue]
    pivots: [product_tag.value]
    fill_fields: [order.created_month_num]
    filters:
      product_tag.value: "-NULL"
    sorts: [order.created_month_num, product.product_type desc]
    limit: 500
    column_limit: 5
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
            name: order Total Order Revenue, axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 566}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 564}]
    x_axis_label: Order Date
    focus_on_hover: false
    swap_axes: false
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    listen: {}
    row: 50
    col: 8
    width: 16
    height: 6
  - title: Top 10 Revenue Generating Cities
    name: Top 10 Revenue Generating Cities
    model: block_shopify
    explore: order
    type: looker_column
    fields: [customer_address.city, order_line.total_lifetime_revenue]
    filters:
      customer_address.city: "-NULL"
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
            name: order Total Order Revenue, axisId: order.total_revenue, __FILE: block-shopify/business_pulse.dashboard.lookml,
            __LINE_NUM: 624}], __FILE: block-shopify/business_pulse.dashboard.lookml,
        __LINE_NUM: 622}]
    x_axis_label: City
    focus_on_hover: false
    swap_axes: false
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    show_dropoff: false
    listen: {}
    row: 20
    col: 0
    width: 13
    height: 9
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
    row: 11
    col: 0
    width: 13
    height: 9
  - title: Sales & order Over Time
    name: Sales & order Over Time
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
    totals_color: "#aae3a7"
    series_types: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Gross Sales Total, __FILE: block-shopify/fishtown.dashboard.lookml,
            __LINE_NUM: 444}], __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 442},
      {label: !!null '', maxValue: !!null '', minValue: !!null '', orientation: right,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.count,
            name: order, __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 449}],
        __FILE: block-shopify/fishtown.dashboard.lookml, __LINE_NUM: 447}]
    listen: {}
    row: 4
    col: 0
    width: 12
    height: 7
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
    avg_order_value: "#ffe89f"
    listen: {}
    row: 44
    col: 8
    width: 16
    height: 6
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
      order_line.count_items: "#8eadd8"
    hidden_series: []
    x_axis_label: Product ID
    hidden_points_if_no: [yesno]
    listen: {}
    row: 50
    col: 0
    width: 8
    height: 6
  - title: Top Products by Revenue
    name: Top Products by Revenue
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
    row: 44
    col: 0
    width: 8
    height: 6
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
      new - order.count: "#ffe89f"
      repeat - order.count: "#9b82da"
    listen: {}
    row: 29
    col: 0
    width: 8
    height: 6
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
      repeat: "#ffe89f"
      new: "#9b82da"
    listen: {}
    row: 29
    col: 8
    width: 8
    height: 6
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
    barColors: ['palette: Mixed Pastels']
    smoothedBars: false
    orientation: automatic
    groupBars: true
    showLegend: true
    series_colors:
      order.avg_order_value: "#ffe89f"
      avg_order_items: "#9b82da"
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
    row: 29
    col: 16
    width: 8
    height: 6
  - title: Cohort Analysis
    name: Cohort Analysis
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
            id: 2018-04 - order.total_revenue, name: 2018-04}, {axisId: order.total_revenue,
            id: 2018-05 - order.total_revenue, name: 2018-05}, {axisId: order.total_revenue,
            id: 2018-06 - order.total_revenue, name: 2018-06}, {axisId: order.total_revenue,
            id: 2018-07 - order.total_revenue, name: 2018-07}, {axisId: order.total_revenue,
            id: 2018-08 - order.total_revenue, name: 2018-08}, {axisId: order.total_revenue,
            id: 2018-09 - order.total_revenue, name: 2018-09}, {axisId: order.total_revenue,
            id: 2018-10 - order.total_revenue, name: 2018-10}, {axisId: order.total_revenue,
            id: 2018-11 - order.total_revenue, name: 2018-11}, {axisId: order.total_revenue,
            id: 2018-12 - order.total_revenue, name: 2018-12}, {axisId: order.total_revenue,
            id: 2019-01 - order.total_revenue, name: 2019-01}, {axisId: order.total_revenue,
            id: 2019-02 - order.total_revenue, name: 2019-02}, {axisId: order.total_revenue,
            id: 2019-03 - order.total_revenue, name: 2019-03}, {axisId: order.total_revenue,
            id: 2019-04 - order.total_revenue, name: 2019-04}, {axisId: order.total_revenue,
            id: 2019-05 - order.total_revenue, name: 2019-05}, {axisId: order.total_revenue,
            id: 2019-06 - order.total_revenue, name: 2019-06}, {axisId: order.total_revenue,
            id: 2019-07 - order.total_revenue, name: 2019-07}, {axisId: order.total_revenue,
            id: 2019-08 - order.total_revenue, name: 2019-08}, {axisId: order.total_revenue,
            id: 2019-09 - order.total_revenue, name: 2019-09}, {axisId: order.total_revenue,
            id: 2019-10 - order.total_revenue, name: 2019-10}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    row: 17
    col: 13
    width: 11
    height: 6
