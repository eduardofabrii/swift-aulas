import SwiftUI

/// Exibe estrelas de avaliação (1–5) com suporte a meia-estrela.
struct EstrelaRating: View {
    let avaliacao: Double
    var tamanho: Font = .caption2
    var cor: Color = .yellow

    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { i in
                Image(systemName: icone(para: i))
                    .font(tamanho)
                    .foregroundStyle(cor)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Avaliação: \(String(format: "%.1f", avaliacao)) de 5 estrelas")
    }

    private func icone(para posicao: Int) -> String {
        let v = Double(posicao)
        if avaliacao >= v          { return "star.fill" }
        if avaliacao >= v - 0.5   { return "star.leadinghalf.filled" }
        return "star"
    }
}

#Preview {
    HStack {
        EstrelaRating(avaliacao: 4.5)
        EstrelaRating(avaliacao: 3.0)
        EstrelaRating(avaliacao: 5.0)
    }
    .padding()
}
