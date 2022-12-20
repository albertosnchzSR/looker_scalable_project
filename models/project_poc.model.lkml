connection: "bigquery"

# Base Explores
include: "/explores/_base/*.explore.lkml"


# Zara Explores
include: "/explores/*/*.explore.lkml"


#LookML Dashboards
include: "/dashboards/*.dashboard.lookml"


# Caching Policies
include: "/models/datagroups.lkml"
