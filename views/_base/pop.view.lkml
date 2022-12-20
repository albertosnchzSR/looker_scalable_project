include: "/views/_base/insights.view.lkml"

view: +insights {

  filter: dates_range {
    view_label: "PoP"
    type: date
    description: "Use this filter for period analysis"
  }

  parameter:  type_of_analysis {
    type: unquoted
    view_label: "PoP"
    allowed_value: {
      value: "previous_period"
      label: "Previous Period"
    }
    allowed_value: {
      value: "previous_year"
      label: "PreviousYear"
    }
    allowed_value: {
      value: "previous_week_of_year"
      label: "Week of Year"
    }
    allowed_value: {
      value: "previous_mtd"
      label: "MTD"
    }
    allowed_value: {
      value: "previous_ytd"
      label: "YTD"
    }
  }

  dimension: period_anlysis {
    view_label: "PoP"
    description: "Select a period of time with the filter /Dates Range/ and what kind of analysis with /Type of Analysis/"
    label_from_parameter: type_of_analysis
    sql:  {% if    type_of_analysis._parameter_value == 'previous_year' %}
            ${previous_year}
          {% elsif type_of_analysis._parameter_value == 'previous_period' %}
            ${previous_period}
          {% elsif type_of_analysis._parameter_value == 'previous_week_of_year' %}
            ${previous_week_of_year}
          {% elsif type_of_analysis._parameter_value == 'previous_mtd' %}
            ${previous_mtd}
          {% elsif type_of_analysis._parameter_value == 'previous_ytd' %}
            ${previous_ytd}
          {% endif %} ;;
  }

  dimension: previous_period {
    hidden: yes
    view_label: "PoP"
    sql:
      case
        when ${insights_date} >= date({% date_start dates_range %})
          and ${insights_date} < date({% date_end dates_range %})
            then 'This Period'
        when ${insights_date} >= date_sub(date({% date_start dates_range %}), interval date_diff(date({% date_end dates_range %}), date({% date_start dates_range %}), day)  day)
          and ${insights_date} < date({% date_start dates_range %})
            then 'Previous Period'
      end ;;
  }

  dimension: previous_week_of_year {
    hidden: yes
    view_label: "PoP"
    sql:
      case
        when ${insights_week_of_year} = extract(week from date({% date_end dates_range %}))
          and ${insights_year} = extract(year from date({% date_end dates_range %}))
            then 'Week of Current Year'
        when ${insights_week_of_year} = extract(week from date({% date_end dates_range %}))
          and ${insights_year} = extract(year from date_sub(date({% date_end dates_range %}), interval 1 year))
            then 'Week of Previous Year'
      end ;;
  }

  dimension: previous_year {
    hidden: yes
    view_label: "PoP"
    sql:
      case
        when ${insights_date} >= date({% date_start dates_range %})
          and ${insights_date} < date({% date_end dates_range %})
            then 'This Period'
        when ${insights_date} >= date_sub(date({% date_start dates_range %}), interval 1 year)
          and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year)
            then 'Previous Year'
      end ;;
  }

  dimension: previous_ytd {
    hidden: yes
    view_label: "PoP"
    sql:
      case
        when ${insights_date} >= date_trunc(date({% date_end dates_range %}), year)
          and ${insights_date} < date({% date_end dates_range %})
            then 'Current YTD'
        when ${insights_date} >= date_trunc(date_sub(date({% date_end dates_range %}), interval 1 year),year)
          and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year)
            then 'Previous YTD'
      end ;;
  }

  dimension: previous_mtd {
    hidden: yes
    view_label: "PoP"
    sql:
      case
        when ${insights_date} >= date_trunc(date({% date_end dates_range %}), month)
          and ${insights_date} < date({% date_end dates_range %})
            then 'Current MTD'
        when ${insights_date} >= date_trunc(date_sub(date({% date_end dates_range %}), interval 1 year),month)
          and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year)
            then 'Previous MTD'
      end ;;
  }


  # Include this code in any explore you want to use the period over period:

  # sql_always_where: 1=1
  # {% if insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_year'  %}
  #   and (${insights_date} >= date_sub(date({% date_start dates_range %}), interval 1 year) and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year))
  #     or (${insights_date} >= date({% date_start dates_range %}) and ${insights_date} < date({% date_end dates_range %}))
  # {% elsif insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_period' %}
  #   and ${insights_date} >= date_sub(date_sub(date({% date_start dates_range %}), interval 0 day ), interval date_diff(date({% date_end dates_range %}), date({% date_start dates_range %}), day)  day)
  #   and ${insights_date} < date({% date_end dates_range %})
  # {% elsif insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_week_of_year' %}
  #   and (${insights_week_of_year} = extract(week from date({% date_end dates_range %})) and ${insights_year} = extract(year from date({% date_end dates_range %})))
  #     or (${insights_week_of_year} = extract(week from date({% date_end dates_range %})) and ${insights_year} = extract(year from date_sub(date({% date_end dates_range %}), interval 1 year)))
  # {% elsif insights.period_anlysis._in_query1 and type_of_analysis._parameter_value == 'previous_ytd' %}
  #   and (${insights_date} >= date_trunc(date({% date_end dates_range %}), year) and ${insights_date} < date({% date_end dates_range %}))
  #     or (${insights_date} >= date_trunc(date_sub(date({% date_end dates_range %}), interval 1 year),year) and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year))
  # {% elsif insights.period_anlysis._in_query and type_of_analysis._parameter_value == 'previous_mtd' %}
  #   and (${insights_date} >= date_trunc(date({% date_end dates_range %}), month) and ${insights_date} < date({% date_end dates_range %}))
  #     or (${insights_date} >= date_trunc(date_sub(date({% date_end dates_range %}), interval 1 year),month) and ${insights_date} < date_sub(date({% date_end dates_range %}), interval 1 year))
  # {% endif %} ;;


}
