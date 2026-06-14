import SwiftUI

struct FavoritosView: View {
    @Environment(LojaViewModel.self) private var vm

    private let colunas = [GridItem(.adaptive(minimum: 150), spacing: 14)]

    var body: some View {
        NavigationStack {
            Group {
                if vm.favoritos.isEmpty {
                    estadoVazio
                } else {
                    ScrollView {
                        LazyVGrid(columns: colunas, spacing: 14) {
                            ForEach(vm.favoritos) { produto in
                                NavigationLink(value: produto) {
                                    CardProduto(produto: produto) {
                                        vm.toggleFavorito(produto.id)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, 8)
                    }
                }
            }
            .navigationTitle("Favoritos")
            .navigationDestination(for: ProdutoArtesanal.self) { p in
                DetalhesProdutoView(produto: p)
            }
        }
    }

    private var estadoVazio: some View {
        VStack(spacing: 18) {
            Image(systemName: "heart.slash.circle")
                .font(.system(size: 68))
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)

            Text("Nenhum favorito ainda")
                .font(.title3)
                .fontWeight(.semibold)

            Text("Toque no coração das peças da vitrine\npara salvá-las aqui.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    FavoritosView()
        .environment(LojaViewModel())
}
