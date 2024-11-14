import sgleam/check

// Lista de Tipos de Dados

// Exercício 10

/// Representa os pontos cardeais.
pub type Direcao {
  Norte
  Leste
  Sul
  Oeste
}

// 10- a)
/// Retorna a direção cardeal oposta da *direcao* cardeal recebida.
pub fn direcao_oposta(direcao: Direcao) -> Direcao {
  case direcao {
    Norte -> Sul
    Leste -> Oeste
    Sul -> Norte
    Oeste -> Leste
  }
}
pub fn direcao_oposta_examples() {
  check.eq(direcao_oposta(Norte), Sul)
  check.eq(direcao_oposta(Leste), Oeste)
  check.eq(direcao_oposta(Sul), Norte)
  check.eq(direcao_oposta(Oeste), Leste)
}

// 10- b)
/// Retorna a *direcao* cardeal recebida deslocada 90 graus no sentido horário.
pub fn menos_noventa_graus(direcao: Direcao) -> Direcao {
  case direcao {
    Norte -> Leste
    Leste -> Sul
    Sul -> Oeste
    Oeste -> Norte
  }
}
pub fn menos_noventa_graus_examples() {
  check.eq(menos_noventa_graus(Norte), Leste)
  check.eq(menos_noventa_graus(Leste), Sul)
  check.eq(menos_noventa_graus(Sul), Oeste)
  check.eq(menos_noventa_graus(Oeste), Norte)
}

// 10- c)
/// Retorna a *direcao* cardeal recebida deslocada 90 graus no sentido anti-horário.
pub fn mais_noventa_graus(direcao: Direcao) -> Direcao {
  direcao_oposta(menos_noventa_graus(direcao))
}
pub fn mais_noventa_graus_examples() {
  check.eq(mais_noventa_graus(Norte), Oeste)
  check.eq(mais_noventa_graus(Leste), Norte)
  check.eq(mais_noventa_graus(Sul), Leste)
  check.eq(mais_noventa_graus(Oeste), Sul)
}

// 10- d)
/// Retorna quantos graus uma pessoa virada para a *direcao1* deve virar no sentido horário
/// para estar virado para a *direcao2*.
pub fn distancia_horaria(direcao1: Direcao, direcao2: Direcao) -> Int {
  case direcao2 == menos_noventa_graus(direcao1), direcao2 == direcao_oposta(direcao1), direcao2 == mais_noventa_graus(direcao1) {
    True, _, _ -> 90
    False, True, _ -> 180
    False, False, True -> 270
    False, False, False -> 0
  }
}
pub fn distancia_horaria_examples() {
  check.eq(distancia_horaria(Oeste, Norte), 90)
  check.eq(distancia_horaria(Norte, Sul), 180)
  check.eq(distancia_horaria(Leste, Oeste), 180)
  check.eq(distancia_horaria(Leste, Norte), 270)
  check.eq(distancia_horaria(Sul, Sul), 0)
}

// Exercício 11

// Representa o estado de um elevador.
pub type Estado {
  Descendo
  Parado
  Subindo
}

// 11- a)
// Retorna qual será o próximo estado imediato de um elevador que esta no *andar1* e
// recebe uma solicitação para ir ao *andar2*.
pub fn atualiza_estado(andar1: Int, andar2: Int) -> Estado {
  case andar1 == andar2, andar1 > andar2 {
    True, _ -> Parado
    False, True -> Descendo
    False, False -> Subindo
  }
}
pub fn atualiza_estado_examples() {
  check.eq(atualiza_estado(0, 0), Parado)
  check.eq(atualiza_estado(1, 6), Subindo)
  check.eq(atualiza_estado(0, -1), Descendo)
}