import Foundation

class Animal {
    var nome: String
    
    init(nome: String) {
        self.nome = nome
    }
    
    func emitirSom() {
        print("\(nome) emite um som genérico.")
    }
    
    func mover() {
        print("\(nome) está se movendo.")
    }
}

class Cachorro: Animal {
    override func emitirSom() {
        print("\(nome) late: Au Au!")
    }
    
    override func mover() {
        print("\(nome) corre feliz!!!")
    }
    
    func buscar() {
        print("\(nome) está buscando a bolinha!")
    }
}

let animal = Animal(nome: "Animal Genérico")
animal.emitirSom() 

let cachorro = Cachorro(nome: "Rex")
cachorro.emitirSom()
cachorro.mover()    
cachorro.buscar()
