import Foundation

protocol FormaGeometrica {
    func calcularArea() -> Double
    func calcularPerimetro() -> Double
}

struct Retangulo: FormaGeometrica {
    var largura: Double
    var altura: Double
    
    func calcularArea() -> Double {
        return largura * altura
    }
    
    func calcularPerimetro() -> Double {
        return 2 * (largura + altura)
    }
}

struct Quadrado: FormaGeometrica {
    var lado: Double
    
    func calcularArea() -> Double {
        return lado * lado
    }
    
    func calcularPerimetro() -> Double {
        return 4 * lado
    }
}

struct Circulo: FormaGeometrica {
    var raio: Double
    
    func calcularArea() -> Double {
        return Double.pi * raio * raio
    }
    
    func calcularPerimetro() -> Double {
        return 2 * Double.pi * raio
    }
}

let retangulo = Retangulo(largura: 5, altura: 3)
print("Retângulo:")
print("Área: \(retangulo.calcularArea())")
print("Perímetro: \(retangulo.calcularPerimetro())")

let quadrado = Quadrado(lado: 4)
print("\nQuadrado:")
print("Área: \(quadrado.calcularArea())") 
print("Perímetro: \(quadrado.calcularPerimetro())")  

let circulo = Circulo(raio: 5)
print("\nCírculo:")
print("Área: \(String(format: "%.2f", circulo.calcularArea()))") 
print("Perímetro: \(String(format: "%.2f", circulo.calcularPerimetro()))")  
