# The name of this view in Looker is "Guides"
view: guides {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `coconut-crab.national_parks.guides`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Description" in Explore.

  dimension: key {
    hidden: yes
    sql: concat(${TABLE}.feature,'-',${TABLE}.park) ;;
    primary_key: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    link: {
      url: "{{guides.link}}"
      label: "Learn More about {{guides.activity}}"
    }
  }

  dimension: activity {
    type: string
    sql: ${TABLE}.feature ;;
    link: {
      url: "{{guides.link}}"
      label: "Learn More about {{value}}"
    }
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
    html: <a href="{{value}}}">Learn more about {{guides.activity}}</a> ;;
  }

  dimension: park {
    label: "Park Code"
    type: string
    sql: UPPER(${TABLE}.park) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
