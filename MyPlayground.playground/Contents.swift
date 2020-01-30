import UIKit

// loops
for i in 1..<6 {
    print("número: " + String(i))
}

for i in 1...6 {
    print("número: " + String(i))
}

var comentarios: [String] = []
comentarios.append("gostei")
comentarios.append("top")
comentarios.append("topzera")

for comentario in comentarios {
    print(comentario)
}

// while
var contador: Int = 0

while contador < 6 {
    print("while: " + String(contador))
    contador += 1
}

// repeat
contador = 0
repeat {
    print("repeat: " + String(contador))
    contador += 1
} while contador < 6

// functions
func test() {
    print("func test")
}

test()
test()

func mult(num1: Int, num2: Int) {
    print("mult void return: " + String(num1 * num2))
}

mult(num1: 2, num2: 3)

func multRet(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

var rest = multRet(num1: 3, num2: 3)
rest = rest + 1
print("multRet: " + String(rest))

var nums = arc4random_uniform(10)
print("random: " + String(nums))


func calcIdade(ano: Int) -> Int {
    return 2020 - ano
}
var idade = calcIdade(ano: 1991)
print("Idade: " + String(idade))

// variables
var mutable = 1
mutable = 2

let immutable = 1
//immutable = 2 // error

// optionals
var valor1: Int
var valor2: Int?
var total: Int

valor1 = 10
valor2 = 1

// ! interronpe a execução caso não haja esse valor
total = valor1 + valor2!

if let valor2Testado = valor2 {
    total = valor1 + valor2Testado
}

print("optional: " + String(total))

// classes
class Casa {
    // atributos
    var cor: String
    
    init(cor: String) {
        self.cor = cor
    }
    
    // métodos
    func getCor() -> String {
        return self.cor
    }
}
// criar objeto
var casa = Casa(cor: "Amarelo")
print("casa cor: " + casa.getCor())

var casa2 = Casa(cor: "Roxo")
print("casa2 cor: " + casa2.getCor())

class Cachorro {
    var cor: String
    
    init(cor: String) {
        self.cor = cor
    }
    
    func latir() -> String {
        return "latir"
    }
    
    func correr() -> String {
        return "correr"
    }
}

var cachorro = Cachorro(cor: "Preto")
print("cachorro latir: " + cachorro.latir())

// herança
class Animal {
    var cor = "marrom"
    
    func dormir() -> String {
        return "dormir"
    }
}

class Cachorro2: Animal {
    func latir() -> String {
        return "latir"
    }
}

class Passaro: Animal {
    func voar() -> String {
        return "voar"
    }
}

class Papagaio: Passaro {
    func repetir() -> String {
        return "repetir"
    }
}

// cachorro 2
var cachorro2 = Cachorro2()
cachorro2.dormir()
cachorro2.latir()

// passaro
var passaro = Passaro()
passaro.dormir()
passaro.voar()

// papagaio
var papagaio = Papagaio()
papagaio.repetir()

