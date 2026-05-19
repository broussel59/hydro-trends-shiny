mod_trends_ui <- function(id) {

  ns <- shiny::NS(id)

  shiny::tagList(
    DT::DTOutput(ns("trend_table"))
  )
}

mod_trends_server <- function(id, hydro_data) {

  shiny::moduleServer(id, function(input, output, session) {

    output$trend_table <- DT::renderDT({

      req(hydro_data())

      data.frame(
        station = unique(hydro_data()$code_station),
        n = nrow(hydro_data())
      )
    })
  })
}
