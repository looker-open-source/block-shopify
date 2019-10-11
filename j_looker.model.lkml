connection: "looker__internal__analytics"

include: "*.view"
include: "*.dashboard.lookml"

datagroup: j_looker_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: j_looker_default_datagroup

explore: content_usage {
  join: dashboard {
    relationship: many_to_one
    sql_on:
      {% if _dialect._name == 'hypersql' or _dialect._name == 'bigquery_standard_sql' %}
        ${content_usage.content_id_as_number}
      {% else %}
        ${content_usage.content_id}
      {% endif %}
      = ${dashboard.id} AND ${content_usage.content_type} LIKE 'dashboard' ;;
  }
  join: look {
    relationship: many_to_one
    sql_on:
      {% if _dialect._name == 'hypersql' or _dialect._name == 'bigquery_standard_sql' %}
        ${content_usage.content_id_as_number}
      {% else %}
        ${content_usage.content_id}
      {% endif %}
      = ${look.id} AND ${content_usage.content_type} LIKE 'look' ;;
  }
}

explore: dashboard {
  view_name: dashboard_layout_component
  label: "Dashboard"

  join: dashboard_layout {
    type: left_outer
    sql_on: ${dashboard_layout_component.dashboard_layout_id} = ${dashboard_layout.id} ;;
    relationship: many_to_one
  }
  join: dashboard_element {
    type: left_outer
    sql_on: ${dashboard_layout_component.dashboard_element_id} = ${dashboard_element.id} ;;
    relationship: many_to_one
  }
  join: query {
    type: left_outer
    relationship: many_to_many
    sql_on: COALESCE(${dashboard_element.query_id}, ${look.query_id}, ${merge_query_source_query.query_id}) = ${query.id} ;;
    required_joins: [dashboard_element, look, merge_query_source_query]
  }
  join: look {
    type: left_outer
    sql_on: ${dashboard_element.look_id} = ${look.id} ;;
    relationship: many_to_one
  }
  join: result_maker {
    from: result_maker_lookup
    foreign_key: dashboard_element.result_maker_id
  }
  join: merge_query {
    relationship: one_to_one
    foreign_key: result_maker.merge_query_id
  }
  join: merge_query_source_query {
    type: left_outer
    relationship: one_to_many
    sql_on: ${merge_query.id} = ${merge_query_source_query.merge_query_id} ;;
  }
  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_layout.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }
  join: space {
    type: left_outer
    sql_on: ${dashboard.space_id} = ${space.id} ;;
    relationship: many_to_one
  }
  join: user {
    type: left_outer
    sql_on: ${dashboard.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${user.id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: filtered_history_dashboards {
    type: left_outer
    sql_on:
      ${dashboard.id} =
        {% if _dialect._name == 'hypersql' or _dialect._name == 'bigquery_standard_sql' %}
          ${filtered_history_dashboards.dashboard_id_as_number}
        {% else %}
          ${filtered_history_dashboards.dashboard_id}
        {% endif %} ;;
    relationship: one_to_many
  }
}

explore: dashboard_performance {
  from: dashboard_run_event_stats
  view_label: "Dashboard Run"
  fields: [ALL_FIELDS*, -history.explore_user, -history.dashboard_user, -history.sql_runner_user]

  join: dashboard_history_stats {
    sql_on: ${dashboard_performance.dashboard_run_session} = ${dashboard_history_stats.dashboard_session} ;;
    relationship: one_to_one
  }
  join: dashboard_page_event_stats {
    sql_on: ${dashboard_performance.dashboard_page_session} = ${dashboard_page_event_stats.dashboard_page_session} ;;
    relationship: many_to_one
  }
  join: history {
    sql_on: ${dashboard_history_stats.dashboard_session} = ${history.dashboard_session} ;;
    relationship: one_to_many
  }
  join: dashboard {
    sql_on:
      {% if _dialect._name == 'hypersql' or _dialect._name == 'bigquery_standard_sql' %}
        ${dashboard_history_stats.dashboard_id_as_number}
      {% else %}
        ${dashboard_history_stats.dashboard_id}
      {% endif %}
      = ${dashboard.id} ;;
    relationship: many_to_one
  }
  join: event_attribute_joiner {
    from: event_attribute
    sql_on: ${event_attribute_joiner.name} = 'run_session_id' AND ${event_attribute_joiner.value} = ${dashboard_performance.dashboard_run_session} ;;
    relationship: many_to_many
    fields: []
  }
  join: event {
    sql_on: ${event.id} = ${event_attribute_joiner.event_id} ;;
    relationship: one_to_one
  }
  join: event_attribute {
    sql_on: ${event.id} = ${event_attribute.event_id} ;;
    relationship: one_to_many
  }
  join: dashboard_run_session_filter_usage {
    relationship: many_to_one
    sql_on: ${dashboard_run_session_filter_usage.run_session_id} = ${dashboard_performance.dashboard_run_session} ;;
  }
  join: user {
    sql_on: ${event.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${user.id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: db_connection {
  label: "DB Connection"
  join: user {
    type: left_outer
    sql_on: ${db_connection.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${db_connection.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
}

explore: event {
  join: user {
    type: left_outer
    sql_on: ${event.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${event.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: group_user {
    relationship: one_to_many
    sql_on: ${user.id} = ${group_user.user_id};;
    fields: []
  }
  join: group {
    relationship: one_to_many
    sql_on: ${group.id} = ${group_user.group_id};;
  }
}

explore: event_attribute {
  join: event {
    type: left_outer
    sql_on: ${event_attribute.event_id} = ${event.id} ;;
    relationship: many_to_one
  }
  join: user {
    type: left_outer
    sql_on: ${event.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${event.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: group_user {
    relationship: one_to_many
    sql_on: ${user.id} = ${group_user.user_id};;
    fields: []
  }
  join: group {
    relationship: one_to_many
    sql_on: ${group.id} = ${group_user.group_id};;
  }
}

explore: group {
  join: group_user {
    type: left_outer
    sql_on: ${group.id} = ${group_user.group_id} ;;
    relationship: one_to_many
  }
  join: user {
    type: left_outer
    sql_on: ${group_user.user_id} = ${user.id} ;;
    relationship: many_to_many
  }
  join: user_facts {
    type: left_outer
    sql_on: ${group_user.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_many
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: indirect_group {
    from: group
    type: left_outer
    sql_on: ${group_user.from_group_id} = ${indirect_group.id} AND
            ${group_user.from_group_id} != ${group_user.group_id} ;;
    relationship: many_to_many
  }

  join: group_group_into {
    from: group_group
    type: left_outer
    sql_on: ${group.id} = ${group_group_into.into_group_id} ;;
    relationship: one_to_many
  }
  join: child_group {
    from: group
    type: left_outer
    sql_on: ${group_group_into.included_group_id} = ${child_group.id} ;;
    relationship: many_to_many
  }
  join: group_group_included {
    from: group_group
    type: left_outer
    sql_on: ${group.id} = ${group_group_included.included_group_id} ;;
    relationship: one_to_many
  }
  join: parent_group {
    from: group
    type: left_outer
    sql_on: ${group_group_included.into_group_id} = ${parent_group.id} ;;
    relationship: many_to_many
  }
  join: role_group {
    type: left_outer
    sql_on: ${group.id} = ${role_group.group_id} ;;
    relationship: one_to_many
    fields: []
  }
  join: group_role {
    from: role
    type: left_outer
    sql_on: ${role_group.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
}

explore: history {
  join: dashboard {
    type: left_outer
    sql_on:
      {% if _dialect._name == 'hypersql' or _dialect._name == 'bigquery_standard_sql' %}
        ${history.dashboard_id_as_number}
      {% else %}
        ${history.dashboard_id}
      {% endif %}
      = ${dashboard.id} ;;
    fields: [history_detail*]
    relationship: many_to_one
  }
  join: group {
    relationship: one_to_many
    sql_on: ${group.id} = ${group_user.group_id};;
  }
  join: group_user {
    relationship: one_to_many
    sql_on: ${user.id} = ${group_user.user_id};;
    fields: []
  }
  join: look {
    type: left_outer
    sql_on: ${history.look_id} = ${look.id} ;;
    relationship: many_to_one
  }
  join: query {
    type: left_outer
    sql_on: ${history.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
  join: result_maker {
    from: result_maker_lookup
    foreign_key: history.result_maker_id
  }
  join: merge_query {
    foreign_key: result_maker.merge_query_id
  }
  join: merge_query_source_query {
    type: left_outer
    sql_on: ${merge_query.id} = ${merge_query_source_query.merge_query_id} ;;
    relationship: many_to_many
  }
  join: source_query {
    from: query
    foreign_key: merge_query_source_query.query_id
  }
  join: sql_query {
    type: left_outer
    sql_on: ${history.sql_query_id} = ${sql_query.id} ;;
    relationship: many_to_one
  }
  join: user {
    foreign_key: user_id
  }
  join: user_facts {
    type: left_outer
    sql_on: ${history.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: node {
    type: left_outer
    sql_on: ${history.node_id} = ${node.id} ;;
    relationship: many_to_one
  }
}

explore: look {
  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
  join: space {
    type: left_outer
    sql_on: ${look.space_id} = ${space.id} ;;
    relationship: many_to_one
  }
  join: user {
    type: left_outer
    sql_on: ${look.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${look.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: filtered_history_looks {
    type: left_outer
    sql_on: ${look.id} = ${filtered_history_looks.look_id} ;;
    relationship: one_to_many
  }
}

explore: merge_query {
  join: merge_query_source_query {
    type: left_outer
    sql_on: ${merge_query.id} = ${merge_query_source_query.merge_query_id} ;;
    relationship: one_to_many
  }
  join: query {
    type: left_outer
    sql_on: ${merge_query_source_query.query_id} = ${query.id} ;;
    relationship: many_to_many
  }
}

explore: pdt_event_log {
  label: "PDT Event Log"
  # The view `pdt_table_to_view_map` is defined in pdt_event_log.view.lkml
  join: pdt_table_to_view_map {
    type: left_outer
    foreign_key: table_name
    relationship: many_to_one
  }
  join: pdt_builds {
    type: left_outer
    foreign_key: tid
    relationship: many_to_one
  }
}

explore: result_maker_lookup {
  join: single_query {
    from: query
    foreign_key: query_id
  }
  join: merge_query {
    foreign_key: merge_query_id
  }
  join: merge_query_source_query {
    type: left_outer
    sql_on: ${merge_query.id} = ${merge_query_source_query.merge_query_id} ;;
    relationship: one_to_many
  }
  join: source_query {
    from: query
    foreign_key: merge_query_source_query.query_id
    relationship: many_to_many
  }
}

explore: scheduled_plan {
  join: user {
    type: left_outer
    sql_on: ${scheduled_plan.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${scheduled_plan.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: look {
    type: left_outer
    sql_on: ${scheduled_plan.look_id} = ${look.id} ;;
    relationship: many_to_one
  }
  join: query {
    type: left_outer
    sql_on: ${look.query_id} = ${query.id} ;;
    relationship: many_to_one
  }
  join: dashboard {
    type: left_outer
    sql_on: ${scheduled_plan.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }
  join: scheduled_job {
    type: left_outer
    sql_on: ${scheduled_job.scheduled_plan_id} = ${scheduled_plan.id};;
    relationship: one_to_many
  }
  join: scheduled_job_stage {
    type:  left_outer
    sql_on: ${scheduled_job.id} = ${scheduled_job_stage.scheduled_job_id} ;;
    relationship: one_to_many
  }
  join: scheduled_plan_destination {
    type: left_outer
    sql_on: ${scheduled_plan_destination.scheduled_plan_id} = ${scheduled_plan.id} ;;
    relationship: one_to_many
  }
}

explore: space {
  join: user {
    type: left_outer
    sql_on: ${space.creator_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${space.creator_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: sql_query {
  join: user {
    type: left_outer
    sql_on: ${sql_query.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${sql_query.user_id} = ${user_facts.user_id} ;;
    relationship: many_to_one
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}

explore: user {
  join: user_facts {
    type: left_outer
    sql_on: ${user.id} = ${user_facts.user_id} ;;
    relationship: one_to_many
  }
  join: user_facts_role {
    type: left_outer
    sql_on: ${user.id} = ${user_facts_role.user_id} ;;
    relationship: many_to_many
    fields: []
  }
  join: role {
    view_label: "User Role (updated hourly)"
    type: left_outer
    sql_on: ${user_facts_role.role_id} = ${role.id} ;;
    relationship: many_to_many
  }
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
  join: session {
    type: left_outer
    sql_on: ${user.id} = ${session.user_id} ;;
    relationship: one_to_many
  }
  join: access_token {
    type: left_outer
    sql_on: ${user.id} = ${access_token.user_id} and ${access_token.grant_type} <> 'client_credentials';;
    relationship: one_to_many
  }
  join: dashboard {
    type: left_outer
    sql_on: ${user.id} = ${dashboard.user_id} ;;
    relationship: one_to_many
  }
  join: group_user {
    type: left_outer
    sql_on: ${user.id} = ${group_user.user_id} ;;
    relationship: one_to_many
  }
  join: group {
    type: left_outer
    sql_on: ${group_user.group_id} = ${group.id} ;;
    relationship: many_to_many
  }
  join: space_user {
    type: left_outer
    sql_on: ${user.id} = ${space_user.user_id} ;;
    relationship: one_to_many
    fields: []
  }
  join: space {
    type: left_outer
    sql_on: ${space_user.space_id} = ${space.id} ;;
    relationship: many_to_many
  }
  join: scheduled_plan {
    type: left_outer
    sql_on: ${user.id} = ${scheduled_plan.user_id} ;;
    relationship: one_to_many
  }
  join: scheduled_plan_destination {
    type: left_outer
    sql_on: ${scheduled_plan.id} = ${scheduled_plan_destination.scheduled_plan_id} ;;
    relationship: one_to_many
  }
  join: look {
    view_label: "Scheduled Plan Look"
    type: left_outer
    sql_on: ${scheduled_plan.look_id} = ${look.id} ;;
    relationship: many_to_many
  }
  join: scheduled_job {
    type: left_outer
    sql_on: ${user.id} = ${scheduled_job.user_id} ;;
    relationship: one_to_many
  }
  join: history {
    type: left_outer
    sql_on: ${user.id} = ${history.user_id} ;;
    relationship: one_to_many
  }
  join: filtered_history_users_last_7days {
    type: left_outer
    sql_on: ${user.id} = ${filtered_history_users_last_7days.user_id} ;;
    relationship: one_to_many
  }
  join: filtered_history_users_last_30days {
    type: left_outer
    sql_on: ${user.id} = ${filtered_history_users_last_30days.user_id} ;;
    relationship: one_to_many
  }
}

explore: role {
  join: permission_set {
    type: left_outer
    sql_on: ${role.permission_set_id} = ${permission_set.id} ;;
    relationship: many_to_one
  }
  join: model_set {
    type: left_outer
    sql_on: ${role.model_set_id} = ${model_set.id} ;;
    relationship: many_to_one
  }
}
