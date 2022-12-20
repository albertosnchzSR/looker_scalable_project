explore: campaigns {}

view: campaigns {
  sql_table_name: `data-engineering-298610.dashboards.campaigns_*`
    ;;

  dimension: pk {
    primary_key: yes
    sql: concat(
          coalesce(${account_id},'0'),
          coalesce(${campaign_id},'0'),
          coalesce(${status}, '0')
         ) ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: bid_strategy {
    type: string
    sql: ${TABLE}.bid_strategy ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: daily_budget {
    type: number
    sql: ${TABLE}.daily_budget ;;
  }

  dimension: data_source {
    type: string
    sql: ${TABLE}.data_source ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: extracted {
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
    sql: ${TABLE}.extracted_at ;;
  }

  dimension: internal_account_id {
    type: string
    sql: ${TABLE}.internal_account_id ;;
  }

  dimension: is_fake {
    type: yesno
    sql: ${TABLE}.is_fake ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: obj_detailed_std {
    type: string
    sql: ${TABLE}.obj_detailed_std ;;
  }

  dimension: obj_general_std {
    type: string
    sql: ${TABLE}.obj_general_std ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}.objective ;;
  }

  dimension: other_countries {
    type: string
    sql: ${TABLE}.other_countries ;;
  }

  dimension: other_publisher_platforms {
    type: string
    sql: ${TABLE}.other_publisher_platforms ;;
  }

  dimension: publisher_platform {
    type: string
    sql: ${TABLE}.publisher_platform ;;
  }

  dimension: publisher_platform_std {
    type: string
    sql: ${TABLE}.publisher_platform_std ;;
  }

  dimension: spend_limit {
    type: string
    sql: ${TABLE}.spend_limit ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_detailed_std {
    type: string
    sql: ${TABLE}.status_detailed_std ;;
  }

  dimension: status_general_std {
    type: string
    sql: ${TABLE}.status_general_std ;;
  }

  dimension: total_budget {
    type: number
    sql: ${TABLE}.total_budget ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    drill_fields: [name]
  }
}
