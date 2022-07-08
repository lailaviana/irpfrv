## code to prepare `DATASET` dataset goes here

fiis <- readr::read_csv("../pacotefiles/fii.csv") |>
  janitor::clean_names() |>
  dplyr::select(codigo, nome, administrador)
acoes <- readr::read_csv("../pacotefiles/acoes.csv") |>
  janitor::clean_names() |>
  dplyr::select(ticket, empresa) |>
  dplyr::rename(codigo = ticket)
etfs <- readr::read_csv("../pacotefiles/etfs.csv") |>
  janitor::clean_names() |>
  dplyr::select(codigo, nome)
arquivo_cei <- readxl::read_excel("../pacotefiles/cei_compilado.xlsx")

usethis::use_data(fiis, overwrite = TRUE)
usethis::use_data(acoes, overwrite = TRUE)
usethis::use_data(etfs, overwrite = TRUE)
usethis::use_data(arquivo_cei, overwrite = TRUE)
