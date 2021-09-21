connection: "@{CONNECTION_NAME}"

include: "/explores/*.explore.lkml"
include: "/dashboards/*.dashboard.lookml"

#Large Dollars Amount format
named_value_format: largeamount {
  value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
}
