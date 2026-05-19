compute_mk_test <- function(data) {

  trend::mk.test(
    data$resultat_obs_elab
  )
}
