include: "/explores/_base/insights.explore.lkml"
include: "/views/zara/*.view.lkml"

explore: insights_zara  {
  extends: [insights]
  sql_always_where: ${insights.brand} = 'Zara' ;;
}


explore: insights_zara_spain  {
  extends: [insights]
  sql_always_where: ${insights.brand} = 'Zara' and ${insights.account_id} = 00445120 ;;
}
