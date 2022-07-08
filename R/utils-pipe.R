#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling `rhs(lhs)`.
NULL


utils::globalVariables(c(
  "acoes", "codigo_de_negociacao", "preco",
  "quantidade", "preco_medio", "numero_ativos",
  "codigo", "custo_aquisicao", "data_do_negocio",
  "codigo_de_negociacao", "ano", "valor", "soma",
  "cumulativo_ano", "tipo_de_movimentacao"
))
