mod_timeseries_ui <- function(id) {

  ns <- shiny::NS(id)

  shiny::tagList(

    plotly::plotlyOutput(
      ns("timeseries_plot"),
      height = 600
    )
  )
}

mod_timeseries_server <- function(id, hydro_data) {

  shiny::moduleServer(id, function(input, output, session) {

    output$timeseries_plot <- plotly::renderPlotly({

      req(hydro_data())

      gg <- ggplot2::ggplot(
        hydro_data(),
        ggplot2::aes(
          x = date,
          y = resultat_obs_elab
        )
      ) +
        ggplot2::geom_line()

      plotly::ggplotly(gg)
    })
  })
}
