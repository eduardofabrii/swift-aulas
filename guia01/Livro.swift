struct Livro {
    var titulo: String
    var autor: String
    var anoPublicacao: Int
    var disponibilidade: Bool
}

var listaLivros: [Livro] = []

func adicionarLivro(titulo: String, autor: String, ano: Int, disponibilidade: Bool) {
    let livro = Livro(titulo: titulo, autor: autor, anoPublicacao: ano, disponibilidade: disponibilidade)
    listaLivros.append(livro)
}

func listarLivros() {
    print("\nLista de Livros:")

    for livro in listaLivros {
        let status = livro.disponibilidade ? "Sim" : "Não"

        print("Título: \(livro.titulo) | Autor: \(livro.autor) | Ano: \(livro.anoPublicacao) | Disponível: \(status)")
    }
}

func alterarDisponibilidade(titulo: String) {
    for i in 0..<listaLivros.count {
        if listaLivros[i].titulo == titulo {

            listaLivros[i].disponibilidade.toggle()

            switch listaLivros[i].disponibilidade {
            case true:
                print("O livro '\(titulo)' está disponível novamente.")
            case false:
                print("O livro '\(titulo)' foi emprestado!")
            }

            return
        }
    }

    print("Livro não encontrado.")
}

func buscarLivro(titulo: String) {
    var livroEncontrado: Livro? = nil

    for livro in listaLivros {
        if livro.titulo == titulo {
            livroEncontrado = livro
        }
    }

    if let livro = livroEncontrado {
        let status = livro.disponibilidade ? "Disponível" : "Emprestado"
        print("Livro encontrado: \(livro.titulo) | \(status)")
    } else {
        print("Livro não encontrado.")
    }
}

adicionarLivro(titulo: "Clean Code", autor: "Robert Martin", ano: 2008, disponibilidade: true)
adicionarLivro(titulo: "Harry Potter", autor: "J.K Rowling", ano: 1997, disponibilidade: false)

listarLivros()

alterarDisponibilidade(titulo: "Harry Potter")

listarLivros()

buscarLivro(titulo: "O Hobbit")