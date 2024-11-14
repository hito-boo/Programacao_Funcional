import sgleam/check
import gleam/int

// Lista de Autorreferência e Recursividade

// Exercício 6

/// Concatena todos os elementos presentes em uma *lista* de textos.
pub fn concatena_elementos(lista: List(String)) -> String {
  case lista {
    [elem1, ..restante] -> elem1 <> concatena_elementos(restante)
    [] -> ""
  }
}
pub fn concatena_elementos_examples() {
  check.eq(concatena_elementos([]), "")
  check.eq(concatena_elementos(["oie"]), "oie")
  check.eq(concatena_elementos(["oie", "tchau"]), "oietchau")
  check.eq(concatena_elementos(["nao", " ", "sim"]), "nao sim")
}

// Exercício 7

/// Determina a quantidade de elementos de uma *lista* de números.
pub fn quantidade_elementos(lista: List(Int)) -> Int {
  case lista {
    [_, ..restante] -> 1 + quantidade_elementos(restante)
    [] -> 0
  }
}
pub fn quantidade_elementos_examples() {
  check.eq(quantidade_elementos([]), 0)
  check.eq(quantidade_elementos([40]), 1)
  check.eq(quantidade_elementos([384, 632]), 2)
  check.eq(quantidade_elementos([1231, 123132, 121]), 3)
  check.eq(quantidade_elementos([109, 391, 0, 1]), 4)
}

// Exercício 8

/// A partir de uma *lista* formada por textos, retorna uma lista de Results(Int, Nil) com
/// os inteiros sendo convertidos a partir da *lista* de entrada, por meio da função int.parse().
pub fn converte_lista(lista: List(String)) -> List(Result(Int, Nil)) {
  case lista {
    [elem1, ..restante] -> [int.parse(elem1), ..converte_lista(restante)]
    [] -> []
  }
}
pub fn converte_lista_examples() {
  check.eq(converte_lista([]), [])
  check.eq(converte_lista(["4"]), [Ok(4)])
  check.eq(converte_lista(["384", "632"]), [Ok(384), Ok(632)])
  check.eq(converte_lista(["1231", "oiee", "121"]), [Ok(1231), Error(Nil), Ok(121)])
  check.eq(converte_lista(["109", "391", "0", ""]), [Ok(109), Ok(391), Ok(0), Error(Nil)])
}

