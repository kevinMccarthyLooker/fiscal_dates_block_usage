connection: "bigquery_publicdata_standard_sql"

include: "/views/order_items.view.lkml"
include: "/views/users.view.lkml"

#applying the fiscal dates block refinements#
include: "/apply_fiscal_dates_refinement" #base views updated here
#
#example explore definition, which uses fiscal dates refinements
explore: order_items_with_fiscal_dates {
  view_name: order_items
  hidden: yes #hide during development

  join: users {
    sql_on: ${order_items.user_id}=${users.id} ;;
    relationship: many_to_one
    type: left_outer
  }
}
