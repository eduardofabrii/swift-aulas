import Foundation

class Carro {
    var marca: String
    var modelo: String
    var ano: Int {
        willSet {
            print("Ano será alterado de \(ano) para \(newValue)")
        }
    }
    
    init(marca: String, modelo: String, ano: Int) {
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
    }
}

let carro = Carro(marca: "Toyota", modelo: "Corolla", ano: 2020)
carro.ano = 2021
