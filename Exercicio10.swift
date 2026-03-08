struct Carro {
    var marca: String
    var modelo: String
    var ano: Int
    
    func exibirInformacoes() {
        print("Marca: \(marca)")
        print("Modelo: \(modelo)")
        print("Ano: \(ano)")
    }
}

let meuCarro = Carro(marca: "Toyota", modelo: "Corolla", ano: 2020)
meuCarro.exibirInformacoes()