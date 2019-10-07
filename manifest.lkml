project_name: "block-shopify"

################# Constants #################

constant: CONNECTION_NAME {
  value: "looker_app"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "looker_for_shopify"
  export: override_required
}

constant: CONFIG_PROJECT_NAME {
  value: "block-shopify-config"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }

}
