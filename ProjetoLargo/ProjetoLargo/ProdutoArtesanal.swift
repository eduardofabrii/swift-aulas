import SwiftUI

struct ProdutoArtesanal: Identifiable, Hashable {
    let id: UUID
    let nome: String
    let artesao: String
    let preco: Double
    let categoria: String
    let imagemNome: String   // nome do asset em Assets.xcassets
    let descricao: String
    let avaliacao: Double    // 1.0 – 5.0
    var isFavorito: Bool

    init(
        nome: String,
        artesao: String,
        preco: Double,
        categoria: String,
        imagemNome: String,
        descricao: String,
        avaliacao: Double = 4.5,
        isFavorito: Bool = false
    ) {
        self.id = UUID()
        self.nome = nome
        self.artesao = artesao
        self.preco = preco
        self.categoria = categoria
        self.imagemNome = imagemNome
        self.descricao = descricao
        self.avaliacao = avaliacao
        self.isFavorito = isFavorito
    }

    // MARK: – Formatação

    var precoFormatado: String {
        preco.formatted(.currency(code: "BRL"))
    }

    // MARK: – Identidade Visual

    var corCategoria: Color {
        switch categoria {
        case "Madeira":      return Color(red: 0.52, green: 0.34, blue: 0.18)
        case "Arte":         return Color(red: 0.48, green: 0.20, blue: 0.70)
        case "Vestuário":    return Color(red: 0.14, green: 0.42, blue: 0.80)
        case "Cerâmica":     return Color(red: 0.86, green: 0.44, blue: 0.10)
        case "Alimentos":    return Color(red: 0.18, green: 0.60, blue: 0.30)
        case "Antiguidades": return Color(red: 0.38, green: 0.38, blue: 0.44)
        case "Bijuterias":   return Color(red: 0.80, green: 0.20, blue: 0.52)
        case "Couro":        return Color(red: 0.46, green: 0.26, blue: 0.08)
        default:             return Color(red: 0.22, green: 0.52, blue: 0.62)
        }
    }

    var iconCategoria: String {
        switch categoria {
        case "Madeira":      return "tree.fill"
        case "Arte":         return "paintpalette.fill"
        case "Vestuário":    return "tshirt.fill"
        case "Cerâmica":     return "cup.and.saucer.fill"
        case "Alimentos":    return "fork.knife"
        case "Antiguidades": return "clock.fill"
        case "Bijuterias":   return "sparkles"
        case "Couro":        return "bag.fill"
        default:             return "tag.fill"
        }
    }
}
