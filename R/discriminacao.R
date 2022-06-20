#' Gerando a discriminacao das acoes
#'
#' @param cei_acoes arquivo de saida do script analise_geral filtrado por acoes
#'
#' @return um arquivo de texto
#' @export
#'
#' @examples
discriminacao_acoes <- function(cei_acoes) {
  paste0(cei_acoes$numero_ativos, " ACOES DA EMPRESA ",
         cei_acoes$empresa,
         " NEGOCIADAS NA B3 COM O CODIGO ", cei_acoes$codigo_de_negociacao,
         ", ADQUIRIDAS PELO VALOR TOTAL DE R$ ",
         round(cei_acoes$custo_aquisicao,2), " AO PRECO MEDIO DE R$ ",
         round(cei_acoes$preco_medio,2))
}


#' Gerando a discriminacao dos fiis
#'
#' @param cei_fiis arquivo de saida do script analise_geral filtrado por fiis
#'
#' @return um arquivo de texto
#' @export
#'
#' @examples
discriminacao_fiis <- function(cei_fiis) {
  paste0(cei_fiis$numero_ativos, " COTA(S) DO FUNDO IMOBILIARIO ",
         cei_fiis$nome, ", NEGOCIADAS NA B3 COM O CODIGO ",
         cei_fiis$codigo, ", ADMINISTRADO POR ", cei_fiis$administrador,
         " ADQUIRIDAS PELO VALOR TOTAL DE ", round(cei_fiis$custo_aquisicao,2),
         " AO PRECO MEDIO DE ", round(cei_fiis$preco_medio, 2))
}


#' Gerando a discriminacao dos etfs
#'
#' @param cei_etfs arquivo de saida do script analise_geral filtrado por etfs
#'
#' @return um arquivo de texto
#' @export
#'
#' @examples
discriminacao_etfs <- function(cei_etfs) {
  paste0(cei_etfs$numero_ativos, " COTA(S) DO ETF ",
         cei_etfs$nome, ", NEGOCIADAS NA B3 COM O CODIGO ",
         cei_etfs$codigo,
         " ADQUIRIDAS PELO VALOR TOTAL DE ", round(cei_etfs$custo_aquisicao,2),
         " AO PRECO MEDIO DE ", round(cei_etfs$preco_medio, 2))
}
