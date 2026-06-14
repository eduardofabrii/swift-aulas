import SwiftUI

struct VitrineView: View {
    @Environment(LojaViewModel.self) private var vm

    @State private var textoBusca = ""
    @State private var categoriaAtiva: String? = nil
    @State private var ordem: OrdemClassificacao = .relevancia

    private let colunas = [GridItem(.adaptive(minimum: 150), spacing: 14)]

    private var produtosFiltrados: [ProdutoArtesanal] {
        vm.filtrar(busca: textoBusca, categoria: categoriaAtiva, ordem: ordem)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    chipsFiltro
                    contadorResultados
                    if produtosFiltrados.isEmpty {
                        estadoVazio
                    } else {
                        grade
                    }
                }
            }
            .navigationTitle("Feira do Largo")
            .searchable(text: $textoBusca, prompt: "Produto, categoria ou artesão…")
            .toolbar { toolbarOrdem }
            .navigationDestination(for: ProdutoArtesanal.self) { p in
                DetalhesProdutoView(produto: p)
            }
        }
    }

    // MARK: – Chips de filtro por categoria

    private var chipsFiltro: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ChipFiltro(titulo: "Todos", ativo: categoriaAtiva == nil) {
                    withAnimation { categoriaAtiva = nil }
                }
                ForEach(vm.categorias, id: \.self) { cat in
                    ChipFiltro(titulo: cat, ativo: categoriaAtiva == cat) {
                        withAnimation {
                            categoriaAtiva = categoriaAtiva == cat ? nil : cat
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }

    // MARK: – Contador

    private var contadorResultados: some View {
        HStack {
            Text("\(produtosFiltrados.count) peças encontradas")
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 6)
    }

    // MARK: – Grade de produtos

    private var grade: some View {
        LazyVGrid(columns: colunas, spacing: 14) {
            ForEach(produtosFiltrados) { produto in
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
    }

    // MARK: – Estado vazio

    private var estadoVazio: some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass.circle")
                .font(.system(size: 60))
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)

            Text("Nenhuma peça encontrada")
                .font(.headline)

            Text("Tente outro nome, categoria ou artesão.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 72)
        .padding(.horizontal, 40)
    }

    // MARK: – Toolbar ordenação

    @ToolbarContentBuilder
    private var toolbarOrdem: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Menu {
                ForEach(OrdemClassificacao.allCases, id: \.self) { op in
                    Button {
                        withAnimation { ordem = op }
                    } label: {
                        if ordem == op {
                            Label(op.rawValue, systemImage: "checkmark")
                        } else {
                            Text(op.rawValue)
                        }
                    }
                }
            } label: {
                Label("Ordenar", systemImage: "arrow.up.arrow.down.circle")
                    .labelStyle(.iconOnly)
                    .font(.title3)
            }
        }
    }
}

#Preview {
    VitrineView()
        .environment(LojaViewModel())
}
