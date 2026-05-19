app_server <- function(input, output, session) {

  filters <- mod_filters_server("filters")

  selected_station <- shiny::reactiveVal(NULL)

  hydro_data <- shiny::eventReactive(

    filters$trigger(),

    {

      req(filters$station())

      data <- get_hydro_data(

        station_code = filters$station(),

        start_date = filters$dates()[1],

        end_date = filters$dates()[2]
      )

      prepare_hydro_data(data)
    }
  )

  mod_timeseries_server(
    "timeseries",
    hydro_data
  )

  mod_trends_server(
    "trends",
    hydro_data
  )
}
