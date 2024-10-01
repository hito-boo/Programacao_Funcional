import gleam/io
import gleam/int

// 2
pub fn main() {
    io.debug(testa())
}

fn testa() {
    let var = int.random(5)
    io.debug(var)
    
    case var {
        0 -> var
        1 -> var
        _ -> 999
    }
}