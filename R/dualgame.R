#' @title Dual Game
#' @description For a given game, this function returns the characteristic function of its dual game.
#' @param v Characteristic function.
#' @return The characteristic function of the dual game.
#' @details Let \eqn{v\in G^N},the dual game of \eqn{v}, \eqn{v^D\in G^N}, is defined by \eqn{v^D(S)=v(N)-v(N\backslash S)} for all \eqn{S \in 2^N}.
#' @examples
#' v <- seq(1:31)
#' dualgame(v)
#' @export

dualgame <- function(v) { # Principio de la función

  ################################
  ### Comprobación datos entrada###
  ################################

  nC <- length(v) # Número de coaliciones.
  n <- log(nC + 1) / log(2) # Número de jugadores.
  if (n > floor(n)) {
    stop("In dualgame(v), vector v must have length 2^n-1 for some n.", call. = F)
  }

  ################################
  ##### Creación de variables######
  ################################

  dual <- v

  ################################
  ###### Cuerpo de la función######
  ################################


  for (S in 1:((nC - 1) / 2)) # Por dualidad, recorremos solo la mitad de las coaliciones.
  {
    dual[S] <- v[nC] - v[nC - S] # v^c(S)=v(N)-v(N\ S).
    dual[nC - S] <- v[nC] - v[S] # v^c(N\S)=v(N)-v(S).
  }

  ################################
  ###### Salidas de la función#####
  ################################

  return(dual)
} # Fin de la función
