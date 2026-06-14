import SwiftUI

struct DetalhesProdutoView: View {
    let produto: ProdutoArtesanal

    @State private var mostrarAlerta = false
    @Environment(LojaViewModel.self) private var vm

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                heroImagem
                conteudo
                    .padding()
                    .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea(edges: .top)
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(
                    item: "\(produto.nome) por \(produto.artesao) — \(produto.precoFormatado)\n\nFeira do Largo da Ordem, Curitiba 🎨",
                    subject: Text(produto.nome),
                    message: Text("Encontrei essa peça incrível na feira!")
                ) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert("Contato", isPresented: $mostrarAlerta) {
            Button("OK") {}
        } message: {
            Text("Em breve você poderá contatar \(produto.artesao) diretamente pelo app!")
        }
    }

    // MARK: – Hero Image

    private var heroImagem: some View {
        ZStack(alignment: .bottomLeading) {
            Image(produto.imagemNome)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 320)
                .clipped()
            // Prioridade 1 → VoiceOver lê o nome (prioridade 2) antes da imagem
            .accessibilityLabel(
                "Imagem de \(produto.nome), artesanato de \(produto.categoria)"
            )
            .accessibilitySortPriority(1)

            LinearGradient(
                colors: [.black.opacity(0.60), .clear],
                startPoint: .bottom,
                endPoint: .center
            )

            VStack(alignment: .leading, spacing: 4) {
                Label(produto.categoria, systemImage: produto.iconCategoria)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)

                // Prioridade 2 → lido ANTES da imagem pelo VoiceOver
                Text(produto.nome)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .accessibilitySortPriority(2)
            }
            .padding(16)
        }
    }

    // MARK: – Conteúdo

    @ViewBuilder
    private var conteudo: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 2) {
                Text(produto.precoFormatado)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(produto.corCategoria)
                    .accessibilityLabel("Preço: \(produto.precoFormatado)")

                EstrelaRating(avaliacao: produto.avaliacao, tamanho: .callout)
            }
            Spacer()
            botaoFavoritoDetalhe
        }
        .padding(.top, 16)

        Divider().padding(.vertical, 12)

        infoSection(titulo: "ARTESÃO") {
            HStack(spacing: 12) {
                Circle()
                    .fill(produto.corCategoria.opacity(0.18))
                    .frame(width: 42, height: 42)
                    .overlay {
                        Image(systemName: "person.fill")
                            .foregroundStyle(produto.corCategoria)
                    }
                Text(produto.artesao)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }

        Divider().padding(.vertical, 12)

        infoSection(titulo: "SOBRE A PEÇA") {
            Text(produto.descricao)
                .font(.body)   // escala com Dynamic Type, sem frame fixo
                .foregroundStyle(.secondary)
        }

        Divider().padding(.vertical, 12)

        Button {
            mostrarAlerta = true
        } label: {
            Label("Entrar em contato com o Artesão", systemImage: "message.fill")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(produto.corCategoria)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .padding(.top, 8)
        .accessibilityHint("Abre opções de contato com \(produto.artesao)")
    }

    @ViewBuilder
    private func infoSection<C: View>(titulo: String, @ViewBuilder content: () -> C) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(titulo)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .kerning(0.5)
            content()
        }
    }

    private var botaoFavoritoDetalhe: some View {
        let isFav = vm.produtos.first(where: { $0.id == produto.id })?.isFavorito ?? false
        return Button {
            vm.toggleFavorito(produto.id)
        } label: {
            Image(systemName: isFav ? "heart.fill" : "heart")
                .font(.title2)
                .foregroundStyle(isFav ? .red : .secondary)
                .scaleEffect(isFav ? 1.1 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isFav)
        }
        .frame(minWidth: 44, minHeight: 44)
        .accessibilityLabel(isFav ? "Remover dos favoritos" : "Adicionar aos favoritos")
    }
}

#Preview {
    NavigationStack {
        DetalhesProdutoView(produto: ProdutoArtesanal.exemplos[0])
            .environment(LojaViewModel())
    }
}
