app_ui <- function() {

  shiny::fluidPage(

    theme = bslib::bs_theme(
      version = 5,
      bootswatch = "flatly"
    ),

    shiny::titlePanel(
      "Analyse des tendances hydrologiques"
    ),

    shiny::sidebarLayout(

      shiny::sidebarPanel(
        mod_filters_ui("filters")
      ),

      shiny::mainPanel(

        shiny::tabsetPanel(

          shiny::tabPanel(
            "Carte",
            mod_map_ui("map")
          ),

          shiny::tabPanel(
            "Chroniques",
            mod_timeseries_ui("timeseries")
          ),

          shiny::tabPanel(
            "Tendances",
            mod_trends_ui("trends")
          ),

          shiny::tabPanel(
            "Exports",
            mod_export_ui("export")
          )
        )
      )
    )
  )
}
