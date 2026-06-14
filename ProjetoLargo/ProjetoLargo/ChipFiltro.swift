import SwiftUI

/// Chip de filtro de categoria — visual pill que alterna entre ativo/inativo.
struct ChipFiltro: View {
    let titulo: String
    let ativo: Bool
    let acao: () -> Void

    var body: some View {
        Button(action: acao) {
            Text(titulo)
                .font(.subheadline)
                .fontWeight(ativo ? .semibold : .regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(ativo ? Color.accentColor : Color(.systemGray5))
                .foregroundStyle(ativo ? .white : .primary)
                .clipShape(Capsule())
                .animation(.easeInOut(duration: 0.18), value: ativo)
        }
        .accessibilityAddTraits(ativo ? [.isSelected] : [])
    }
}

#Preview {
    HStack {
        ChipFiltro(titulo: "Todos", ativo: true) {}
        ChipFiltro(titulo: "Madeira", ativo: false) {}
        ChipFiltro(titulo: "Arte", ativo: false) {}
    }
    .padding()
}
