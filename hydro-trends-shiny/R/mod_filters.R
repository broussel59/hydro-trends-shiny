mod_filters_ui <- function(id) {

  ns <- shiny::NS(id)

  shiny::tagList(

    shiny::selectInput(
      ns("departement"),
      "Département",
      choices = c("59", "62", "80")
    ),

    shiny::selectizeInput(
      ns("station"),
      "Station hydrométrique",
      choices = NULL
    ),

    shiny::dateRangeInput(
      ns("dates"),
      "Période",
      start = "2000-01-01",
      end = Sys.Date()
    ),

    shiny::actionButton(
      ns("load_data"),
      "Charger les données"
    )
  )
}

mod_filters_server <- function(id) {

  shiny::moduleServer(id, function(input, output, session) {

    list(

      station = shiny::reactive(input$station),

      dates = shiny::reactive(input$dates),

      trigger = shiny::reactive(input$load_data)
    )
  })
}
