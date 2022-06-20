#' Situação anual dos seus ativos
#'
#' @param arquivo_cei tabela xlsx contendo o extrato de negociacao dos ativos de renda variavel gerada pelo site da B
#'
#' @return uma tibble
#' @export
#'
#' @examples
situacao <- function(arquivo_cei = arquivo_cei) {
  readxl::read_excel(arquivo_cei) %>% janitor::clean_names() %>%
    dplyr::mutate(
      valor = dplyr::case_when(tipo_de_movimentacao == "Venda" ~ valor*(-1),
                               TRUE ~ valor),
      quantidade = dplyr::case_when(tipo_de_movimentacao == "Venda" ~
                                      quantidade*(-1),
                                    TRUE ~ quantidade)) %>%
    dplyr::mutate(data_do_negocio = lubridate::dmy(data_do_negocio),
                  ano = lubridate::year(data_do_negocio)) %>%
    dplyr::group_by(codigo_de_negociacao, ano) %>%
    dplyr::summarise(soma = sum(valor)) %>%
    dplyr::mutate(cumulativo_ano = cumsum(soma)) %>%
    dplyr::select(codigo_de_negociacao, ano, cumulativo_ano)

}
