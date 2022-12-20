include: "/views/_base/*.view.lkml"

explore: insights {
  view_name: insights

  join: customers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${insights.customer_id} = ${customers.id} ;;
  }

  join: campaigns {
    type: left_outer
    # relationship: many_to_one para que fuera many_to_one necesitamos hacer join con campagins.status también (hay que solucionar esto)
    relationship: many_to_many
    sql_on: ${insights.campaign_id} = ${campaigns.campaign_id}
        and ${insights.account_id} = ${campaigns.account_id}
    ;;
  }

  join: ads {
    type: left_outer
    relationship: many_to_one
    sql_on: ${insights.ad_id} = ${ads.ad_id}
        and ${insights.adset_id} = ${ads.adset_id}
        and ${insights.campaign_id} = ${ads.campaign_id}
        and ${insights.ad_name} = ${ads.name}
    ;;
  }
}









explore: +insights {
  sql_always_where: 1=1
  {% if insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_year'  %}
  and (${insights_date} >= date_sub(date({% date_start dates_range %}), interval 1 year) and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year))
  or (${insights_date} >= date({% date_start dates_range %}) and ${insights_date} < date({% date_end dates_range %}))
  {% elsif insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_period' %}
  and ${insights_date} >= date_sub(date_sub(date({% date_start dates_range %}), interval 0 day ), interval date_diff(date({% date_end dates_range %}), date({% date_start dates_range %}), day)  day)
  and ${insights_date} < date({% date_end dates_range %})
  {% elsif insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_week_of_year' %}
  and (${insights_week_of_year} = extract(week from date({% date_end dates_range %})) and ${insights_year} = extract(year from date({% date_end dates_range %})))
  or (${insights_week_of_year} = extract(week from date({% date_end dates_range %})) and ${insights_year} = extract(year from date_sub(date({% date_end dates_range %}), interval 1 year)))
  {% elsif insights.period_anlysis._in_query1 and type_of_analysis._parameter_value == 'previous_ytd' %}
  and (${insights_date} >= date_trunc(date({% date_end dates_range %}), year) and ${insights_date} < date({% date_end dates_range %}))
  or (${insights_date} >= date_trunc(date_sub(date({% date_end dates_range %}), interval 1 year),year) and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year))
  {% elsif insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_mtd' %}
  and (${insights_date} >= date_trunc(date({% date_end dates_range %}), month) and ${insights_date} < date({% date_end dates_range %}))
  or (${insights_date} >= date_trunc(date_sub(date({% date_end dates_range %}), interval 1 year),month) and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year))
  {% endif %} ;;
}
