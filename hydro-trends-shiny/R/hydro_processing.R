prepare_hydro_data <- function(data) {

  data %>%
    dplyr::mutate(
      date = as.Date(date_obs_elab)
    ) %>%
    dplyr::arrange(date)
}
