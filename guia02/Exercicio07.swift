import Foundation

extension String {
    func formatarParaNumeroSerie(length: Int = 10) -> String {
        // garante que a string tenha um número específico de caracteres
        // preenchendo com zeros à esquerda se necessário
        if self.count >= length {
            return String(self.suffix(length))
        } else {
            let padding = String(repeating: "0", count: length - self.count)
            return padding + self
        }
    }
}


class DispositivoEletronico {
    let marca: String
    var modelo: String
    var preco: Double {
        willSet {
            print("Preço será alterado de R$ \(String(format: "%.2f", preco)) para R$ \(String(format: "%.2f", newValue))")
        }
        didSet {
            print("Preço alterado para R$ \(String(format: "%.2f", preco))")
        }
    }
    
    private(set) var numeroSerie: String
    var ligado: Bool
    var precoComDesconto: Double {
        return preco * 0.9
    }
    
    init(marca: String, modelo: String, preco: Double) {
        self.marca = marca
        self.modelo = modelo
        self.preco = preco
        let base = "\(marca)\(modelo)".uppercased()
        self.numeroSerie = base.formatarParaNumeroSerie(length: 10)
        self.ligado = false
    }
    
    convenience init(marca: String, modelo: String) {
        self.init(marca: marca, modelo: modelo, preco: 99.99)
    }
    
    func ligar() {
        if !ligado {
            ligado = true
            print("\(marca) \(modelo) foi ligado.")
        } else {
            print("Dispositivo já está ligado.")
        }
    }
    
    func desligar() {
        if ligado {
            ligado = false
            print("\(marca) \(modelo) foi desligado.")
        } else {
            print("Dispositivo já está desligado.")
        }
    }
    
    func exibirDetalhes() {
        let status = ligado ? "Ligado" : "Desligado"
        print("""
        =======================================
        MARCA: \(marca)
        MODELO: \(modelo)
        NÚMERO DE SÉRIE: \(numeroSerie)
        PREÇO: R$ \(String(format: "%.2f", preco))
        PREÇO COM DESCONTO (10%): R$ \(String(format: "%.2f", precoComDesconto))
        STATUS: \(status)
        =======================================
        """)
    }
    
    func aplicarDesconto(percentual: Double) {
        let desconto = preco * percentual / 100
        preco -= desconto
    }
    
    deinit {
        print("Dispositivo \(marca) \(modelo) foi desalocado.")
    }
}

final class Smartphone: DispositivoEletronico {
    var tamanhoTela: Double 
    var temCamera: Bool
    
    init(marca: String, modelo: String, preco: Double, tamanhoTela: Double, temCamera: Bool) {
        self.tamanhoTela = tamanhoTela
        self.temCamera = temCamera
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        print("TAMANHO DA TELA: \(tamanhoTela)\"")
        print("TEM CÂMERA: \(temCamera ? "Sim" : "Não")")
        print()
    }
    
    func tirarFoto() {
        if ligado && temCamera {
            print("Foto tirada com sucesso!")
        } else if !ligado {
            print("Não é possível tirar foto: dispositivo desligado.")
        } else {
            print("Este smartphone não possui câmera.")
        }
    }
    
    func realizarChamada(contato: String) {
        if ligado {
            print("Chamando \(contato)...")
        } else {
            print("Dispositivo desligado. Não é possível fazer chamadas.")
        }
    }
}

class Notebook: DispositivoEletronico {
    var tamanhoTela: Double  
    var capacidadeArmazenamento: Int 
    
    init(marca: String, modelo: String, preco: Double, tamanhoTela: Double, capacidadeArmazenamento: Int) {
        self.tamanhoTela = tamanhoTela
        self.capacidadeArmazenamento = capacidadeArmazenamento
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        print("TAMANHO DA TELA: \(tamanhoTela)\"")
        print("CAPACIDADE DE ARMAZENAMENTO: \(capacidadeArmazenamento)GB")
        print()
    }
}

protocol Atualizavel {
    func atualizarSoftware()
}


extension Notebook: Atualizavel {
    func atualizarSoftware() {
        if ligado {
            print("Atualizando software do notebook \(marca) \(modelo)...")
            print("Software atualizado com sucesso!")
        } else {
            print("Notebook desligado. Ligue antes de atualizar.")
        }
    }
}

struct Acessorio {
    let nome: String
    let tipo: String
    let preco: Double
    
    func exibirDetalhes() {
        print("Acessório: \(nome)")
        print("Tipo: \(tipo)")
        print("Preço: R$ \(String(format: "%.2f", preco))")
    }
}

print("SISTEMA DE GERENCIAMENTO DE DISPOSITIVOS ELETRÔNICOS\n")

let iphone = Smartphone(marca: "Apple", modelo: "iPhone 14", preco: 5999.99, tamanhoTela: 6.1, temCamera: true)
let samsung = Smartphone(marca: "Samsung", modelo: "Galaxy S23", preco: 4999.99, tamanhoTela: 6.1, temCamera: true)
let dell = Notebook(marca: "Dell", modelo: "XPS 13", preco: 7999.99, tamanhoTela: 13.3, capacidadeArmazenamento: 512)
let lenovo = Notebook(marca: "Lenovo", modelo: "ThinkPad", preco: 6499.99, tamanhoTela: 14.0, capacidadeArmazenamento: 256)

let dispositivos: [DispositivoEletronico] = [iphone, samsung, dell, lenovo]

print("\nCATÁLOGO DE DISPOSITIVOS:\n")

for (index, dispositivo) in dispositivos.enumerated() {
    print("Dispositivo #\(index + 1):")
    dispositivo.exibirDetalhes()
}

print("\nTESTANDO FUNCIONALIDADES:\n")

print("→ Testando Smartphone (iphone):")
iphone.ligar()
iphone.tirarFoto()
iphone.realizarChamada(contato: "João")
iphone.desligar()

print("\n")

print("→ Testando Notebook (dell):")
dell.ligar()
if let notebook = dell as? Atualizavel {
    notebook.atualizarSoftware()
}
dell.desligar()

print("\n")

print("APLICANDO DESCONTOS:\n")
iphone.aplicarDesconto(percentual: 15)
dell.aplicarDesconto(percentual: 20)

print("\nPreço atual do iPhone: R$ \(String(format: "%.2f", iphone.preco))")
print("Preço atual do Dell: R$ \(String(format: "%.2f", dell.preco))")

print("\nACESSÓRIOS DISPONÍVEIS:\n")
let carregadorRapido = Acessorio(nome: "Carregador Rápido 65W", tipo: "Carregador", preco: 199.99)
let capa = Acessorio(nome: "Capa Protetora", tipo: "Capa", preco: 49.99)
let pelicula = Acessorio(nome: "Película de Vidro Temperado", tipo: "Película", preco: 29.99)

carregadorRapido.exibirDetalhes()
print()
capa.exibirDetalhes()
print()
pelicula.exibirDetalhes()

print("\nTeste concluído!")
