#' Acoes
#'
#' Essa base possui todas as acoes listadas na B3
#'
#' @format Uma lista que descreve as colunas:
#' \describe{
#'   \item{Codigo}{Codigo sob o qual a acao e negociada}
#'   \item{Empresa}{Nome da empresa}
#'
#' }
#' @source \url{https://acoes.info/acoes/}
"acoes"

#' FIIs
#'
#' Essa base possui todos os FIIs listados na B3
#'
#' @format Uma lista que descreve as colunas:
#' \describe{
#'   \item{codigo}{Codigo sob o qual o fii e negociado}
#'   \item{nome}{Nome do fundo de investimento imobiliario}
#'   \item{administrador}{Nome do administrador}
#'
#' }
#' @source \url{https://www.clubefii.com.br/fundo_imobiliario_lista}
"fiis"

#' ETFs
#'
#' Essa base possui todos os ETFs listados na B3
#'
#' @format Uma lista que descreve as colunas:
#' \describe{
#'   \item{codigo}{Codigo sob o qual o etf e negociado}
#'   \item{nome}{Nome do ETF}
#'
#' }
#' @source \url{https://br.investing.com/etfs/brazil-etfs}
"etfs"

#' Arquivo CEI
#'
#' Essa base serve de teste para executar as funcoes presentes neste pacote
#'
#' @format Uma lista que descreve as colunas:
#' \describe{
#'   \item{codigo_de_negociacao}{Codigo sob o qual o etf e negociado}
#'   \item{tipo_de_movimentacao}{Se a movimentacao foi de compra ou venda}
#'   \item{data_do_negocio}{Data em que foi realizada a movimentacao}
#'   \item{quantidade}{Numero de ativos}
#'   \item{valor}{Valor total da movimentacao}
#'   \item{preco}{Preco individual do ativo}
#'
#' }
#' @source
"arquivo_cei"

