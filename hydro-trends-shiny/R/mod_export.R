mod_export_ui <- function(id) {

  ns <- shiny::NS(id)

  shiny::tagList(

    shiny::downloadButton(
      ns("download_csv"),
      "Télécharger CSV"
    )
  )
}

mod_export_server <- function(id, hydro_data) {

  shiny::moduleServer(id, function(input, output, session) {

    output$download_csv <- shiny::downloadHandler(

      filename = function() {
        paste0("hydro_data_", Sys.Date(), ".csv")
      },

      content = function(file) {
        readr::write_csv(hydro_data(), file)
      }
    )
  })
}
