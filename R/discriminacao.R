#' Gerando a discriminacao das acoes
#'
#' @param b3_acoes arquivo de saida do script analise_geral filtrado por acoes
#'
#' @return um arquivo de texto
#' @export
#'
#' @examples
discriminacao_acoes <- function(b3_acoes) {
  paste0(
    b3_acoes$numero_ativos, " ACOES DA EMPRESA ",
    b3_acoes$empresa,
    " NEGOCIADAS NA B3 COM O CODIGO ", b3_acoes$codigo_de_negociacao,
    ", ADQUIRIDAS PELO VALOR TOTAL DE R$ ",
    round(b3_acoes$custo_aquisicao, 2), " AO PRECO MEDIO DE R$ ",
    round(b3_acoes$preco_medio, 2)
  )
}


#' Gerando a discriminacao dos fiis
#'
#' @param b3_fiis arquivo de saida do script analise_geral filtrado por fiis
#'
#' @return um arquivo de texto
#' @export
#'
#' @examples
discriminacao_fiis <- function(b3_fiis) {
  paste0(
    b3_fiis$numero_ativos, " COTA(S) DO FUNDO IMOBILIARIO ",
    b3_fiis$nome, ", NEGOCIADAS NA B3 COM O CODIGO ",
    b3_fiis$codigo, ", ADMINISTRADO POR ", b3_fiis$administrador,
    " ADQUIRIDAS PELO VALOR TOTAL DE ", round(b3_fiis$custo_aquisicao, 2),
    " AO PRECO MEDIO DE ", round(b3_fiis$preco_medio, 2)
  )
}


#' Gerando a discriminacao dos etfs
#'
#' @param b3_etfs arquivo de saida do script analise_geral filtrado por etfs
#'
#' @return um arquivo de texto
#' @export
#'
#' @examples
discriminacao_etfs <- function(b3_etfs) {
  paste0(
    b3_etfs$numero_ativos, " COTA(S) DO ETF ",
    b3_etfs$nome, ", NEGOCIADAS NA B3 COM O CODIGO ",
    b3_etfs$codigo,
    " ADQUIRIDAS PELO VALOR TOTAL DE ", round(b3_etfs$custo_aquisicao, 2),
    " AO PRECO MEDIO DE ", round(b3_etfs$preco_medio, 2)
  )
}
