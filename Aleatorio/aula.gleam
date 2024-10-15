import sgleam/check

// Aula 03/10

pub fn and(bool1: Bool, bool2: Bool) {
    case bool1, bool2 {
        True, True -> True
        _, _ -> False
    }
} 

pub fn or(bool1: Bool, bool2: Bool) {
    case bool1 {
        True -> True
        False -> bool2
    }
}

// Aula 15/10

pub fn or_examples() {
    check.eq(or(True, False), True)
}