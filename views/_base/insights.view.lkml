explore: test {
  view_name: insights
}

view: insights {
  sql_table_name: `data-engineering-298610.dashboards.insights_day_ad_*`
    ;;

  dimension: pk {
    primary_key: yes
    sql: concat(
          coalesce(${account_id},'0'),
          coalesce(${ad_id},'0'),
          coalesce(${adset_id},'0'),
          coalesce(${campaign_id},'0'),
          coalesce(${customer_id},'0'),
          coalesce(${network},'0'),
          ${insights_date}
         ) ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: achieve_level {
    type: number
    sql: ${TABLE}.achieve_level ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.ad_type ;;
  }

  dimension: adds_to_cart {
    type: number
    sql: ${TABLE}.adds_to_cart ;;
  }

  dimension: adds_to_cart_1d_click {
    type: number
    sql: ${TABLE}.adds_to_cart_1d_click ;;
  }

  dimension: adds_to_cart_1d_view {
    type: number
    sql: ${TABLE}.adds_to_cart_1d_view ;;
  }

  dimension: adds_to_cart_7d_click {
    type: number
    sql: ${TABLE}.adds_to_cart_7d_click ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

  dimension: app_installs {
    type: number
    sql: ${TABLE}.app_installs ;;
  }

  dimension: average_video_play {
    type: number
    sql: ${TABLE}.average_video_play ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: comments {
    type: number
    sql: ${TABLE}.comments ;;
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

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: daily_rate {
    type: number
    sql: ${TABLE}.daily_rate ;;
  }

  dimension_group: insights {
    type: time
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: engagements {
    type: number
    sql: ${TABLE}.engagements ;;
  }

  dimension_group: exchange {
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
    sql: ${TABLE}.exchange_date ;;
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

  dimension: follows {
    type: number
    sql: ${TABLE}.follows ;;
  }

  dimension: ga_goal_completions_all {
    type: number
    sql: ${TABLE}.ga_goal_completions_all ;;
  }

  dimension: ga_goal_conversion_rate_all {
    type: number
    sql: ${TABLE}.ga_goal_conversion_rate_all ;;
  }

  dimension: ga_goal_value_all {
    type: number
    sql: ${TABLE}.ga_goal_value_all ;;
  }

  dimension: ga_item_quantity {
    type: number
    sql: ${TABLE}.ga_item_quantity ;;
  }

  dimension: ga_new_users {
    type: number
    sql: ${TABLE}.ga_new_users ;;
  }

  dimension: ga_purchases {
    type: number
    sql: ${TABLE}.ga_purchases ;;
  }

  dimension: ga_purchases_revenue {
    type: number
    sql: ${TABLE}.ga_purchases_revenue ;;
  }

  dimension: ga_sessions {
    type: number
    sql: ${TABLE}.ga_sessions ;;
  }

  dimension: ga_total_value {
    type: number
    sql: ${TABLE}.ga_total_value ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: internal_account_id {
    type: string
    sql: ${TABLE}.internal_account_id ;;
  }

  dimension: landing_page_views {
    type: number
    sql: ${TABLE}.landing_page_views ;;
  }

  dimension: landing_page_views_1d_click {
    type: number
    sql: ${TABLE}.landing_page_views_1d_click ;;
  }

  dimension: landing_page_views_1d_view {
    type: number
    sql: ${TABLE}.landing_page_views_1d_view ;;
  }

  dimension: landing_page_views_7d_click {
    type: number
    sql: ${TABLE}.landing_page_views_7d_click ;;
  }

  dimension: leadgen_grouped {
    type: number
    sql: ${TABLE}.leadgen_grouped ;;
  }

  dimension: leadgen_grouped_1d_click {
    type: number
    sql: ${TABLE}.leadgen_grouped_1d_click ;;
  }

  dimension: leadgen_grouped_1d_view {
    type: number
    sql: ${TABLE}.leadgen_grouped_1d_view ;;
  }

  dimension: leadgen_grouped_7d_click {
    type: number
    sql: ${TABLE}.leadgen_grouped_7d_click ;;
  }

  dimension: leads {
    type: number
    sql: ${TABLE}.leads ;;
  }

  dimension: leads_1d_click {
    type: number
    sql: ${TABLE}.leads_1d_click ;;
  }

  dimension: leads_1d_view {
    type: number
    sql: ${TABLE}.leads_1d_view ;;
  }

  dimension: leads_7d_click {
    type: number
    sql: ${TABLE}.leads_7d_click ;;
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

  dimension: outbound_clicks {
    type: number
    sql: ${TABLE}.outbound_clicks ;;
  }

  dimension: purchases {
    type: number
    sql: ${TABLE}.purchases ;;
  }

  dimension: purchases_1d_click {
    type: number
    sql: ${TABLE}.purchases_1d_click ;;
  }

  dimension: purchases_1d_view {
    type: number
    sql: ${TABLE}.purchases_1d_view ;;
  }

  dimension: purchases_7d_click {
    type: number
    sql: ${TABLE}.purchases_7d_click ;;
  }

  dimension: purchases_dda {
    type: number
    sql: ${TABLE}.purchases_dda ;;
  }

  dimension: purchases_value {
    type: number
    sql: ${TABLE}.purchases_value ;;
  }

  dimension: purchases_value_1d_click {
    type: number
    sql: ${TABLE}.purchases_value_1d_click ;;
  }

  dimension: purchases_value_1d_click_eur {
    type: number
    sql: ${TABLE}.purchases_value_1d_click_EUR ;;
  }

  dimension: purchases_value_1d_view {
    type: number
    sql: ${TABLE}.purchases_value_1d_view ;;
  }

  dimension: purchases_value_1d_view_eur {
    type: number
    sql: ${TABLE}.purchases_value_1d_view_EUR ;;
  }

  dimension: purchases_value_7d_click {
    type: number
    sql: ${TABLE}.purchases_value_7d_click ;;
  }

  dimension: purchases_value_7d_click_eur {
    type: number
    sql: ${TABLE}.purchases_value_7d_click_EUR ;;
  }

  dimension: purchases_value_dda {
    type: number
    sql: ${TABLE}.purchases_value_dda ;;
  }

  dimension: purchases_value_eur {
    type: number
    sql: ${TABLE}.purchases_value_EUR ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: reactions {
    type: number
    sql: ${TABLE}.reactions ;;
  }

  dimension: registrations {
    type: number
    sql: ${TABLE}.registrations ;;
  }

  dimension: registrations_1d_click {
    type: number
    sql: ${TABLE}.registrations_1d_click ;;
  }

  dimension: registrations_1d_view {
    type: number
    sql: ${TABLE}.registrations_1d_view ;;
  }

  dimension: registrations_7d_click {
    type: number
    sql: ${TABLE}.registrations_7d_click ;;
  }

  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  dimension: spend_eur {
    type: number
    sql: ${TABLE}.spend_EUR ;;
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

  dimension: video_play_actions {
    type: number
    sql: ${TABLE}.video_play_actions ;;
  }

  dimension: video_starts {
    type: number
    sql: ${TABLE}.video_starts ;;
  }

  dimension: video_thruplays {
    type: number
    sql: ${TABLE}.video_thruplays ;;
  }

  dimension: video_views {
    type: number
    sql: ${TABLE}.video_views ;;
  }

  dimension: video_views_10s {
    type: number
    sql: ${TABLE}.video_views_10s ;;
  }

  dimension: video_views_30s {
    type: number
    sql: ${TABLE}.video_views_30s ;;
  }

  dimension: video_views_p100 {
    type: number
    sql: ${TABLE}.video_views_p100 ;;
  }

  dimension: video_views_p25 {
    type: number
    sql: ${TABLE}.video_views_p25 ;;
  }

  dimension: video_views_p50 {
    type: number
    sql: ${TABLE}.video_views_p50 ;;
  }

  dimension: video_views_p75 {
    type: number
    sql: ${TABLE}.video_views_p75 ;;
  }

  dimension: video_watched_6s {
    type: number
    sql: ${TABLE}.video_watched_6s ;;
  }

  dimension: view_content {
    type: number
    sql: ${TABLE}.view_content ;;
  }

  dimension: view_content_1d_click {
    type: number
    sql: ${TABLE}.view_content_1d_click ;;
  }

  dimension: view_content_1d_view {
    type: number
    sql: ${TABLE}.view_content_1d_view ;;
  }

  dimension: view_content_7d_click {
    type: number
    sql: ${TABLE}.view_content_7d_click ;;
  }

  measure: count {
    type: count
    drill_fields: [adset_name, campaign_name, account_name, ad_name]
  }
}
