import gleam/string.{capitalise as formata}
import gleam/int

// Lista de Fundamentos

// Exercício 12
pub fn area_retangulo(largura: Float, altura: Float) -> Float {
    largura *. altura
}

// Exercício 13
pub fn produto_anterior_posterior(numero: Int) -> Int {
    numero * {numero - 1} * {numero + 1}
}

// Exercício 14
pub fn so_primeira_maiuscula(texto: String) -> String {
    case texto {
        "" -> "Erro!"
        _ -> formata(texto)
    }
}

// Exercício 15
pub fn eh_par(numero: Int) -> Bool {
    numero > -1 && numero % 2 == 0
}

// Exercício 16
pub fn tem_tres_digitos(numero: Int) -> Bool {
    let texto = int.to_string(numero)
    string.length(texto) == 3    
}

// Exercício 17
pub fn maximo(num1: Int, num2: Int) -> Int {
    let num1maior = num1 > num2
    case num1maior {
        True -> num1
        False -> num2
    }
}

// Exercício 18
pub fn ordem(a: Int, b: Int, c: Int) -> String {
    case a <= b, b <=  c {
        True, True -> "crescente"
        True, False -> "sem ordem"
        False, True -> "sem ordem"
        False, False -> "decrescente"
    }
}