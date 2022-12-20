explore: customers {}

view: customers {
  sql_table_name: `redai-adsdata.bbbtool.customers`
    ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: agency_id {
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: amp_org_id {
    type: string
    sql: ${TABLE}.amp_org_id ;;
  }

  dimension: build_dashboard_structures {
    type: number
    sql: ${TABLE}.build_dashboard_structures ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: customer_lost {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.customer_lost_at ;;
  }

  dimension_group: customer_won {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.customer_won_at ;;
  }

  dimension_group: dashboard_breakdown_structures_refreshed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dashboard_breakdown_structures_refreshed_at ;;
  }

  dimension_group: dashboard_structures_refreshed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dashboard_structures_refreshed_at ;;
  }

  dimension: demo_seeder_algorithm {
    type: string
    sql: ${TABLE}.demo_seeder_algorithm ;;
  }

  dimension_group: demo_seeder_backfill_until {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.demo_seeder_backfill_until ;;
  }

  dimension: demo_seeder_customer_id {
    type: number
    sql: ${TABLE}.demo_seeder_customer_id ;;
  }

  dimension_group: demo_seeder_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.demo_seeder_start_at ;;
  }

  dimension: demo_seeder_window_days {
    type: number
    sql: ${TABLE}.demo_seeder_window_days ;;
  }

  dimension: health {
    type: number
    sql: ${TABLE}.health ;;
  }

  dimension: industry_id {
    type: number
    sql: ${TABLE}.industry_id ;;
  }

  dimension: invoice_distribution_emails {
    type: string
    sql: ${TABLE}.invoice_distribution_emails ;;
  }

  dimension: is_demo {
    type: number
    sql: ${TABLE}.is_demo ;;
  }

  dimension: main_objective {
    type: string
    sql: ${TABLE}.main_objective ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: reference_current_number {
    type: number
    sql: ${TABLE}.reference_current_number ;;
  }

  dimension: reference_prefix {
    type: string
    sql: ${TABLE}.reference_prefix ;;
  }

  dimension: reporting_currency_code {
    type: string
    sql: ${TABLE}.reporting_currency_code ;;
  }

  dimension: sales_rep_user_id {
    type: number
    sql: ${TABLE}.sales_rep_user_id ;;
  }

  dimension: sync_tableau {
    type: number
    sql: ${TABLE}.sync_tableau ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: tier_id {
    type: number
    sql: ${TABLE}.tier_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
