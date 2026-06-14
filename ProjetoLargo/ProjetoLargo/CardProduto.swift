import SwiftUI

struct CardProduto: View {
    let produto: ProdutoArtesanal
    let onToggleFavorito: () -> Void

    var body: some View {
        Rectangle()
            .fill(produto.corCategoria.gradient)   // cor de fundo enquanto imagem carrega
            .aspectRatio(4/5, contentMode: .fit)
            // 1. Foto local (bundled no app – sempre disponível)
            .overlay { foto }
            // 2. Gradiente + nome + preço na faixa inferior
            .overlay(alignment: .bottom) { overlayInferior }
            // 3. Badge de categoria (topo-esquerdo)
            .overlay(alignment: .topLeading) { categoriaBadge.padding(10) }
            // 4. Botão favoritar (topo-direito) – touch target mínimo 44×44 pt
            .overlay(alignment: .topTrailing) { botaoFavorito.padding(8) }
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 4)
    }

    // MARK: – Foto do asset local

    private var foto: some View {
        Image(produto.imagemNome)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // Rótulo descritivo para VoiceOver (requisito A11y)
            .accessibilityLabel(
                "Imagem de \(produto.nome), artesanato da categoria \(produto.categoria)"
            )
    }

    // MARK: – Overlay inferior (gradiente + informações)

    private var overlayInferior: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(produto.nome)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .lineLimit(2)              // sem altura fixa → respeita Dynamic Type
                .fixedSize(horizontal: false, vertical: true)

            HStack(spacing: 4) {
                EstrelaRating(avaliacao: produto.avaliacao)
                Spacer(minLength: 4)
                Text(produto.precoFormatado)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    // Label explícito evita VoiceOver ler "R cifrão…"
                    .accessibilityLabel("Preço: \(produto.precoFormatado)")
            }
        }
        // padding horizontal/bottom de 14 pt garante distância segura
        // dos cantos arredondados (cornerRadius 18)
        .padding(.horizontal, 14)
        .padding(.bottom, 14)
        .padding(.top, 48)
        .background(
            LinearGradient(
                colors: [.black.opacity(0.80), .black.opacity(0.20), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
        )
    }

    // MARK: – Badge de categoria

    private var categoriaBadge: some View {
        Text(produto.categoria)
            .font(.caption2)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
            .accessibilityHidden(true)
    }

    // MARK: – Botão Favoritar

    private var botaoFavorito: some View {
        Button(action: onToggleFavorito) {
            Image(systemName: produto.isFavorito ? "heart.fill" : "heart")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(produto.isFavorito ? Color.red : Color.white)
                .shadow(color: .black.opacity(0.45), radius: 3)
                .scaleEffect(produto.isFavorito ? 1.15 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: produto.isFavorito)
        }
        .frame(minWidth: 44, minHeight: 44)
        .accessibilityLabel(
            produto.isFavorito
                ? "Remover \(produto.nome) dos favoritos"
                : "Adicionar \(produto.nome) aos favoritos"
        )
    }
}

#Preview {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 14)], spacing: 14) {
        ForEach(ProdutoArtesanal.exemplos.prefix(4)) { p in
            CardProduto(produto: p) {}
        }
    }
    .padding()
    .environment(LojaViewModel())
}
