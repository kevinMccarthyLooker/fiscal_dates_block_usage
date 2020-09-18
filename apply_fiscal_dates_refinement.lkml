include: "//financial_calendar_extension/financial_calendar_extension.view.lkml"
include: "/views/order_items.view"
view: +order_items {

  extends: [financial_calendar_extension]

#here what you configure the block on
  dimension_group: base_date {sql:${created_date};;} # also considering having them fill constant: my_base_field_for_financial_calendar {value: "${created_raw}"} , but that would be difficult to apply multiple times in an instance

  dimension: default_fiscal_calendar_type {
    sql:4-4-5;;
  }
  parameter: fiscal_calendar_selector {hidden: no}


#And perhaps we should we give them access to configure the output fields like this
  dimension: financial_week_of_year {group_label:"Special Group Label"}
  dimension: financial_year {group_label:"Created Date"}
  dimension: financial_quarter_of_year {group_label:"Created Date"}
  dimension: financial_month_of_year {group_label:"Created Date"}
}
