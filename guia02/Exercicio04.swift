import Foundation

class Funcionario {
    var nome: String
    var salarioBase: Double
    
    init(nome: String, salarioBase: Double) {
        self.nome = nome
        self.salarioBase = salarioBase
    }
    
    func calcularSalario() -> Double {
        return salarioBase
    }
    
    func exibirDetalhes() {
        print("Funcionário: \(nome)")
        print("Salário: R$ \(String(format: "%.2f", calcularSalario()))")
    }
}

final class Gerente: Funcionario {
    var bonus: Double
    
    init(nome: String, salarioBase: Double, bonus: Double) {
        self.bonus = bonus
        super.init(nome: nome, salarioBase: salarioBase)
    }
    
    override func calcularSalario() -> Double {
        return salarioBase + bonus
    }
}

let funcionario = Funcionario(nome: "Carlos", salarioBase: 2000)
funcionario.exibirDetalhes()

let gerente = Gerente(nome: "Ana", salarioBase: 3000, bonus: 1000)
gerente.exibirDetalhes()

// A linha abaixo causa erro de compilação:
// final class SuperGerente: Gerente { }  
