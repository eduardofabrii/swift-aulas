import Foundation

class Pessoa {
    var nome: String
    var idade: Int

    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
        print("\(nome) foi inicializado.")
    }

    func exibirInformacoes() {
        print("Nome: \(nome), Idade: \(idade)")
    }

    deinit {
        print("\(nome) foi desalocado.")
    }
}

do {
    let pessoa = Pessoa(nome: "João", idade: 30)
    pessoa.exibirInformacoes() 
}  
