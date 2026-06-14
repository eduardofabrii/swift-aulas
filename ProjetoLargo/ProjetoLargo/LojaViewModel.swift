import SwiftUI

// MARK: - Ordenação

enum OrdemClassificacao: String, CaseIterable {
    case relevancia = "Relevância"
    case menorPreco = "Menor Preço"
    case maiorPreco = "Maior Preço"
    case nomeAZ     = "Nome A–Z"
}

// MARK: - ViewModel

/// @Observable (iOS 17+) é compatível com SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor
/// ao contrário de ObservableObject, cujo objectWillChange precisa ser nonisolated.
@Observable
final class LojaViewModel {

    var produtos: [ProdutoArtesanal] = ProdutoArtesanal.exemplos

    // MARK: Computed

    var favoritos: [ProdutoArtesanal] {
        produtos.filter { $0.isFavorito }
    }

    var categorias: [String] {
        Array(Set(produtos.map { $0.categoria })).sorted()
    }

    // MARK: Filtragem + Ordenação

    func filtrar(busca: String, categoria: String?, ordem: OrdemClassificacao) -> [ProdutoArtesanal] {
        var lista = produtos

        if let cat = categoria {
            lista = lista.filter { $0.categoria == cat }
        }
        if !busca.isEmpty {
            lista = lista.filter {
                $0.nome.localizedCaseInsensitiveContains(busca) ||
                $0.categoria.localizedCaseInsensitiveContains(busca) ||
                $0.artesao.localizedCaseInsensitiveContains(busca)
            }
        }

        switch ordem {
        case .relevancia:  break
        case .menorPreco:  lista.sort { $0.preco < $1.preco }
        case .maiorPreco:  lista.sort { $0.preco > $1.preco }
        case .nomeAZ:      lista.sort { $0.nome < $1.nome }
        }

        return lista
    }

    func produtos(paraCategoria categoria: String) -> [ProdutoArtesanal] {
        produtos.filter { $0.categoria == categoria }
    }

    // MARK: Ações

    func toggleFavorito(_ id: UUID) {
        guard let idx = produtos.firstIndex(where: { $0.id == id }) else { return }
        withAnimation(.spring(response: 0.35, dampingFraction: 0.55)) {
            produtos[idx].isFavorito.toggle()
        }
    }
}
