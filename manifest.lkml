project_name: "block-shopify"

################# Constants #################

constant: CONNECTION_NAME {
  value: "4mile_bigquery"
  # value: "looker_app"
  export: override_optional
}

constant: SCHEMA_NAME {
  value: "shopify_for_looker"
  export: override_optional
}
