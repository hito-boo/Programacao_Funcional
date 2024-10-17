import sgleam/check
import gleam/int
import gleam/string

// Lista de Projeto de Funções

// Exercício 13

/// Produz True se uma pessoa com *idade* é isento da tarifa de transporte público,
/// isto é, tem menos que 18 anos ou 65 ou mais. Produz False caso contrário.
pub fn isento_tarifa(idade: Int) -> Bool {
  idade < 18  || idade > 64
}
pub fn isento_tarifa_examples() {
  check.eq(isento_tarifa(17), True)
  check.eq(isento_tarifa(18), False)
  check.eq(isento_tarifa(50), False)
  check.eq(isento_tarifa(65), True)
  check.eq(isento_tarifa(70), True)
}

// Exercício 14

/// Conta a quantidade de dígitos de *n*. Se *n* é 0, então devolve zero. Se *n* é
/// menor que zero, então devolve a quantidade e dígitos do valor absoluto de *n*.
pub fn quantidade_digitos(n: Int) -> Int {
  string.length(int.to_string(int.absolute_value(n)))
}
pub fn quantidade_digitos_examples() {
  check.eq(quantidade_digitos(123), 3)
  check.eq(quantidade_digitos(0), 1)
  check.eq(quantidade_digitos(-1519), 4)
}

// Exercício 15

/// Produz True se uma pessoa com a *idade* é supercentenária, isto é, tem 110 anos
/// ou mais. False caso contrário.
pub fn supercentenario(idade: Int) -> Bool {
  idade >= 110
}
pub fn supercentenario_examples() {
  check.eq(supercentenario(101), False)
  check.eq(supercentenario(110), True)
  check.eq(supercentenario(112), True)
}

// Exercício 16

/// Transforma a string *data* que está no formato "dia/mes/ano para o formato
/// "ano/mes/dia".
/// 
/// Requer que o dia e o mês tenham dois dígitos e que o ano tenha quatro dígitos.
pub fn dma_para_amd(data: String) -> String {
  string.slice(data, -4, 4) <> string.slice(data, 2, 4) <> string.slice(data, 0, 2)
}
pub fn dma_para_amd_examples() {
  check.eq(dma_para_amd("19/07/2023"), "2023/07/19")
  check.eq(dma_para_amd("01/01/1980"), "1980/01/01")
  check.eq(dma_para_amd("20/02/2002"), "2002/02/20")
}

// Exercício 17

/// Produz um aumento percentual no *valor* de acordo com a *porcentagem*.
/// 
/// Requer que o *valor* e a *porcentagem* sejam maiores que 0.
pub fn aumenta(valor: Float, porcentagem: Float) -> Float {
  valor *. {1.0 +. porcentagem /. 100.0}
}
pub fn aumenta_examples() {
  check.eq(aumenta(1.0, 50.0), 1.5)
  check.eq(aumenta(100.0, 0.1), 100.1)
  check.eq(aumenta(4.7, 192.8), 13.7616)
}

// Exercício 18

/// Devolve a classificação de acordo com o tamanho de *nome*, sendo a saída
/// "curto" caso o nome tenha menos de 5 letras; "médio" caso tenha mais de 4
/// letras e menos de 11; e "longo" caso teha mais de 10 letras.
pub fn tamanho_nome(nome: String) -> String {
  case string.length(nome) <= 4 {
    True -> "curto"
    False -> case string.length(nome) <= 10 {
      True -> "médio"
      False -> "longo"
    }
  }
}
pub fn tamanho_nome_examples() {
  check.eq(tamanho_nome(""), "curto")
  check.eq(tamanho_nome("Dudu"), "curto")
  check.eq(tamanho_nome("Eduardo"), "médio")
  check.eq(tamanho_nome("Eduardo Vitor"), "longo")
}

// Exercício 19

/// Adiciona um ponto final na *frase* caso ela  não termine com ponto final.
/// Caso termine, apenas devolve *frase*.
pub fn adiciona_ponto(frase: String) -> String {
  case string.slice(frase, -1, 1) == "." {
    True -> frase
    False -> frase <> "."
  }
}
pub fn adiciona_ponto_examples() {
  check.eq(adiciona_ponto(""), ".")
  check.eq(adiciona_ponto("Oiê"), "Oiê.")
  check.eq(adiciona_ponto("Chama!!"), "Chama!!.")
  check.eq(adiciona_ponto("Não enche."), "Não enche.")
}

// Exercício 20

/// Verifica se a *palavra* possui traço ("-") em seu caractere mediano, devolvendo True
/// caso tenha e False caso não tenha.
pub fn tem_traco(palavra: String) -> Bool {
  string.length(palavra) % 2 == 1 && string.slice(palavra, string.length(palavra) / 2, 1) == "-"
}
pub fn tem_traco_examples() {
  check.eq(tem_traco(""), False)
  check.eq(tem_traco("LeroLero"), False)
  check.eq(tem_traco("Aaabab"), False)
  check.eq(tem_traco("-"), True)
  check.eq(tem_traco("Lero-Lero"), True)
  check.eq(tem_traco("Aaa-bab"), True)
  check.eq(tem_traco("Guarda-chuva"), False)
}

// Exercício 21

/// Devolve o maior valor entre os números *num1*, *num2* e *num3*.
pub fn maximo(num1: Float, num2: Float, num3: Float) -> Float {
  case num1 >. num2 {
    True -> case num1 >. num3 {
      True -> num1
      False -> num3
    }
    False -> case num2 >. num3 {
      True -> num2
      False -> num3
    }
  }
}
pub fn maximo_examples() {
  check.eq(maximo(0.0, 0.0, 0.0), 0.0)
  check.eq(maximo(1.0, 1.0, 1.0), 1.0)
  check.eq(maximo(1.3, -1.2, 0.1), 1.3)
  check.eq(maximo(1.7, 2.8, 0.1), 2.8)
  check.eq(maximo(19.0, 26.2, 31.2), 31.2)
  check.eq(maximo(-8.2, -9.1, -9.1), -8.2)
  check.eq(maximo(-10.5, -11.3, -10.5), -10.5)
}

// Exercício 22
