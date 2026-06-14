import SwiftUI

struct MainTabView: View {
    // @State + @Observable: cria a instância e rastreia mudanças automaticamente
    @State private var vm = LojaViewModel()

    var body: some View {
        TabView {
            VitrineView()
                .tabItem {
                    Label("Vitrine", systemImage: "storefront.fill")
                }

            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }
                .badge(vm.favoritos.count > 0 ? vm.favoritos.count : 0)

            CategoriasView()
                .tabItem {
                    Label("Categorias", systemImage: "square.grid.2x2.fill")
                }
        }
        // .environment(vm) injeta o @Observable – recebido com @Environment(LojaViewModel.self)
        .environment(vm)
        .tint(.accentColor)
    }
}

#Preview {
    MainTabView()
}
