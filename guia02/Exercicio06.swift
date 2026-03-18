import Foundation

struct PontoStruct {
    var x: Double
    var y: Double
    
    func distanciaOrigem() -> Double {
        return sqrt(x * x + y * y)
    }
}

class PontoClass {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func distanciaOrigem() -> Double {
        return sqrt(x * x + y * y)
    }
}

print("=== STRUCT (Cópia por Valor) ===")
var pontoA = PontoStruct(x: 3, y: 4)
var pontoB = pontoA
print("PontoA antes: (\(pontoA.x), \(pontoA.y))")  
print("PontoB antes: (\(pontoB.x), \(pontoB.y))")  

pontoB.x = 10
print("PontoA após alteração de pontoB: (\(pontoA.x), \(pontoA.y))")  
print("PontoB após alteração: (\(pontoB.x), \(pontoB.y))") 

print("\nDistância origem A: \(pontoA.distanciaOrigem())") 
print("Distância origem B: \(pontoB.distanciaOrigem())") 

print("\n=== CLASS (Cópia por Referência) ===")
var pontoC = PontoClass(x: 3, y: 4)
var pontoD = pontoC
print("PontoC antes: (\(pontoC.x), \(pontoC.y))") 
print("PontoD antes: (\(pontoD.x), \(pontoD.y))")  

pontoD.x = 10
print("PontoC após alteração de pontoD: (\(pontoC.x), \(pontoC.y))")  
print("PontoD após alteração: (\(pontoD.x), \(pontoD.y))") 

print("\nDistância origem C: \(pontoC.distanciaOrigem())") 
print("Distância origem D: \(pontoD.distanciaOrigem())")  

print("\n=== Comparação de Identidade ===")
print("pontoC === pontoD: \(pontoC === pontoD)") 

var pontoE = PontoClass(x: 3, y: 4)
print("pontoC === pontoE: \(pontoC === pontoE)") 

print("\n=== Resumo ===")
print("Struct: Cópia por valor, cada variável tem sua própria cópia dos dados")
print("Class: Cópia por referência, múltiplas variáveis apontam para o mesmo objeto")
