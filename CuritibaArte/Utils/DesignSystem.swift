import UIKit

/// Sistema de design centralizado do aplicativo
enum DesignSystem {
    enum Cores {
        /// Verde pinheiro profundo - fundo principal
        static let fundoPrincipal = UIColor(red: 0.03, green: 0.11, blue: 0.08, alpha: 1)
        /// Verde folha escuro - fundo de célula
        static let fundoCelula = UIColor(red: 0.06, green: 0.18, blue: 0.13, alpha: 1)
        /// Verde musgo - superfícies secundárias
        static let verdeMusgo = UIColor(red: 0.11, green: 0.31, blue: 0.21, alpha: 1)
        /// Laranja erva-mate - accent principal
        static let laranja = UIColor(red: 0.96, green: 0.43, blue: 0.16, alpha: 1)
        /// Laranja suave - accent secundário
        static let laranjaSuave = UIColor(red: 0.96, green: 0.43, blue: 0.16, alpha: 0.16)
        /// Verde claro para pequenos destaques
        static let verdeClaro = UIColor(red: 0.47, green: 0.74, blue: 0.43, alpha: 1)
        /// Marfim quente - texto principal
        static let textoPrincipal = UIColor(red: 0.97, green: 0.95, blue: 0.87, alpha: 1)
        /// Marfim apagado - texto secundário
        static let textoSecundario = UIColor(red: 0.76, green: 0.82, blue: 0.72, alpha: 1)
        /// Separador sutil
        static let separador = UIColor(white: 1, alpha: 0.08)

        /// Alias mantido para compatibilidade com telas antigas do projeto.
        static let dourado = laranja
        static let douradoSuave = laranjaSuave
    }

    enum Tipografia {
        /// Título grande - nome do app
        static func tituloApp() -> UIFont {
            return UIFont(name: "Georgia-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .bold)
        }
        /// Título de obra
        static func tituloObra() -> UIFont {
            return UIFont(name: "Georgia-Italic", size: 15) ?? UIFont.italicSystemFont(ofSize: 15)
        }
        /// Nome do artista
        static func nomeArtista() -> UIFont {
            return UIFont.systemFont(ofSize: 11, weight: .medium)
        }
        /// Detalhe - ano, estilo
        static func detalhe() -> UIFont {
            return UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        /// Corpo de texto
        static func corpo() -> UIFont {
            return UIFont(name: "Georgia", size: 16) ?? UIFont.systemFont(ofSize: 16)
        }
        /// Label de seção
        static func secao() -> UIFont {
            return UIFont.systemFont(ofSize: 10, weight: .semibold)
        }
    }

    enum Espacamento {
        static let margemPequena: CGFloat = 8
        static let margem: CGFloat = 16
        static let margemGrande: CGFloat = 24
        static let margemExtraGrande: CGFloat = 32
    }

    enum Borda {
        static let pequeno: CGFloat = 8
        static let medio: CGFloat = 12
        static let grande: CGFloat = 16
    }
}
