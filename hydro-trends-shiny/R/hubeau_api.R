library(hubeau)
library(memoise)

.get_hydro_data <- function(
    station_code,
    start_date,
    end_date
) {

  hubeau::get_obs_elab(
    code_entite = station_code,
    date_debut_obs_elab = start_date,
    date_fin_obs_elab = end_date
  )
}

get_hydro_data <- memoise::memoise(.get_hydro_data)
