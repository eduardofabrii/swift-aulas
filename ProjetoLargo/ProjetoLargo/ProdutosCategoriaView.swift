import SwiftUI

struct ProdutosCategoriaView: View {
    let categoria: String

    @Environment(LojaViewModel.self) private var vm

    private let colunas = [GridItem(.adaptive(minimum: 150), spacing: 14)]

    private var produtos: [ProdutoArtesanal] {
        vm.produtos(paraCategoria: categoria)
    }

    var body: some View {
        ScrollView {
            if produtos.isEmpty {
                estadoVazio
            } else {
                LazyVGrid(columns: colunas, spacing: 14) {
                    ForEach(produtos) { produto in
                        NavigationLink(value: produto) {
                            CardProduto(produto: produto) {
                                vm.toggleFavorito(produto.id)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
        .navigationTitle(categoria)
    }

    private var estadoVazio: some View {
        VStack(spacing: 12) {
            Image(systemName: "tray")
                .font(.system(size: 52))
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)
            Text("Sem peças nesta categoria")
                .font(.headline)
        }
        .padding(.top, 80)
    }
}

#Preview {
    NavigationStack {
        ProdutosCategoriaView(categoria: "Madeira")
            .environment(LojaViewModel())
    }
}
