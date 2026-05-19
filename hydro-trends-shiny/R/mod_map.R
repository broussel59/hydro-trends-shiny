mod_map_ui <- function(id) {

  ns <- shiny::NS(id)

  leaflet::leafletOutput(ns("map"), height = 700)
}

mod_map_server <- function(id, stations_reactive) {

  shiny::moduleServer(id, function(input, output, session) {

    output$map <- leaflet::renderLeaflet({

      leaflet::leaflet(stations_reactive()) %>%
        leaflet::addProviderTiles(
          leaflet::providers$CartoDB.Positron
        )
    })
  })
}
