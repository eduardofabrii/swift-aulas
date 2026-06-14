import SwiftUI

struct CategoriasView: View {
    @Environment(LojaViewModel.self) private var vm

    private let colunas = [GridItem(.adaptive(minimum: 160), spacing: 14)]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 14) {
                    ForEach(vm.categorias, id: \.self) { cat in
                        NavigationLink(value: cat) {
                            CategoriaCardView(
                                categoria: cat,
                                icone: vm.produtos(paraCategoria: cat).first?.iconCategoria ?? "tag.fill",
                                cor: vm.produtos(paraCategoria: cat).first?.corCategoria ?? .accentColor,
                                quantidade: vm.produtos(paraCategoria: cat).count
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .navigationTitle("Categorias")
            .navigationDestination(for: String.self) { categoria in
                ProdutosCategoriaView(categoria: categoria)
            }
            .navigationDestination(for: ProdutoArtesanal.self) { p in
                DetalhesProdutoView(produto: p)
            }
        }
    }
}

// MARK: – Card de categoria

struct CategoriaCardView: View {
    let categoria: String
    let icone: String
    let cor: Color
    let quantidade: Int

    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: icone)
                .font(.system(size: 36, weight: .medium))
                .foregroundStyle(.white)
                .accessibilityHidden(true)

            VStack(spacing: 4) {
                Text(categoria)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("\(quantidade) \(quantidade == 1 ? "peça" : "peças")")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.80))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 26)
        .background(cor.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: cor.opacity(0.40), radius: 6, x: 0, y: 3)
        .accessibilityLabel("\(categoria), \(quantidade) \(quantidade == 1 ? "peça" : "peças")")
    }
}

#Preview {
    CategoriasView()
        .environment(LojaViewModel())
}
