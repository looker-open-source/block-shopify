- dashboard: shopify_product
  title: Product Trends
  layout: newspaper
  elements:
  - title: Orders by Top 15 Product Tags
    name: Orders by Top 15 Product Tags
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
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 771
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    legend_position: center
    colors: ['palette: Mixed Pastels']
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    x_axis_datetime_tick_count: 10
    show_null_points: true
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
    listen: {}
    row: 2
    col: 0
    width: 16
    height: 12
  - title: Product Type Breakdown
    name: Product Type Breakdown
    model: block_shopify
    explore: order
    type: looker_pie
    fields: [order_line.total_lifetime_revenue, top_15.product_tag]
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 5
    column_limit: 50
    value_labels: legend
    label_type: labPer
    colors: ['palette: Mixed Pastels']
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        reverse: true
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 832
    series_colors: {}
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
    show_dropoff: false
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customer.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 893}], __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 891}]
    series_types: {}
    listen: {}
    row: 2
    col: 16
    width: 8
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
    limit: 8
    column_limit: 15
    dynamic_fields: [{table_calculation: yesno, label: yes/no, expression: row()<=10,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 921
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Product ID
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
    series_types: {}
    point_style: none
    series_colors:
      order_line.count_items: "#2865BE"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: [yesno]
    listen: {}
    row: 8
    col: 16
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
    limit: 8
    column_limit: 15
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 979
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Product ID
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
    series_types: {}
    point_style: none
    series_colors:
      order_line.total_lifetime_revenue: "#3BA2A0"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#1C2260"
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: []
    listen: {}
    row: 14
    col: 0
    width: 8
    height: 6
  - title: Collection Breakdown
    name: Collection Breakdown
    model: block_shopify
    explore: order
    type: looker_pie
    fields: [order_line.total_lifetime_revenue, collection.title]
    sorts: [order_line.total_lifetime_revenue desc]
    limit: 5
    column_limit: 50
    value_labels: legend
    label_type: labPer
    colors: ['palette: Mixed Pastels']
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 1104
    series_colors:
      'null': "#4CB388"
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
    show_dropoff: false
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: customer.count,
            name: Customers Count, axisId: customer.count, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 1165}], __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 1163}]
    series_types: {}
    listen: {}
    row: 20
    col: 0
    width: 8
    height: 6
  - title: Revenue by Month and Collection
    name: Revenue by Month and Collection
    model: block_shopify
    explore: order
    type: looker_area
    fields: [order.total_revenue, order.created_month, collection.title]
    pivots: [collection.title]
    fill_fields: [order.created_month]
    filters:
      product_tag.value: "-NULL"
    sorts: [order.created_month desc, collection.title]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml
        __LINE_NUM: 1039
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: order.total_revenue,
            name: Orders Total Order Revenue, axisId: order.total_revenue, __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
            __LINE_NUM: 1045}], __FILE: block-shopify/Shopify_Dashboard.dashboard.lookml,
        __LINE_NUM: 1043}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Order Date
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
    point_style: circle
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    focus_on_hover: false
    listen: {}
    row: 14
    col: 8
    width: 16
    height: 12
  - name: ''
    type: text
    body_text: |-
      <div class="alert alert-info vis">
      <center>
      <font size="18"><font color="#5DC370">Shopify Products</font></font>
      </center>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
