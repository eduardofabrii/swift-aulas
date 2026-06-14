/// Struct principal que representa uma obra de arte de um artista curitibano
struct ObraDeArte {
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}

/// Catálogo de obras de artistas curitibanos
struct CatalogoDeObras {
    static let obras: [ObraDeArte] = [
        ObraDeArte(
            titulo: "Monumento do 1° Centenário do Paraná",
            artista: "Poty Lazzarotto",
            ano: 1953,
            estilo: "Mural de azulejo pintado",
            imagemNome: "poty_centenario_parana",
            descricao: "Obra localizada na Praça Dezenove de Dezembro, em Curitiba."
        ),
        ObraDeArte(
            titulo: "Pinheiros, Café e Erva-Mate - Trabalho na Lavoura",
            artista: "Poty Lazzarotto",
            ano: 1959,
            estilo: "Painel em madeira",
            imagemNome: "poty_pinheiros_cafe_erva_mate",
            descricao: "Painel instalado no Palácio Iguaçu, no Centro Cívico de Curitiba."
        ),
        ObraDeArte(
            titulo: "O Bom Samaritano",
            artista: "Poty Lazzarotto",
            ano: 1961,
            estilo: "Mural em lajota cerâmica",
            imagemNome: "poty_bom_samaritano",
            descricao: "Mural instalado na fachada do Hospital de Clínicas, em Curitiba."
        ),
        ObraDeArte(
            titulo: "O Trabalho Humano e a Evolução Tecnológica",
            artista: "Poty Lazzarotto",
            ano: 1965,
            estilo: "Painel em cerâmica esmaltada",
            imagemNome: "poty_trabalho_evolucao",
            descricao: "Painel localizado no Centro Politécnico da UFPR."
        ),
        ObraDeArte(
            titulo: "Desenvolvimento de Curitiba",
            artista: "Poty Lazzarotto",
            ano: 1967,
            estilo: "Painel em concreto",
            imagemNome: "poty_desenvolvimento_curitiba",
            descricao: "Painel localizado na Praça 29 de Março, no bairro Mercês."
        ),
        ObraDeArte(
            titulo: "A Comunicação",
            artista: "Poty Lazzarotto",
            ano: 1969,
            estilo: "Painel em madeira",
            imagemNome: "poty_comunicacao",
            descricao: "Painel instalado no Museu Municipal de Arte, o MuMA."
        ),
        ObraDeArte(
            titulo: "Evolução das Artes Cênicas",
            artista: "Poty Lazzarotto",
            ano: 1969,
            estilo: "Painel em concreto aparente",
            imagemNome: "poty_artes_cenicas",
            descricao: "Painel instalado na fachada do Teatro Guaíra, em Curitiba."
        ),
        ObraDeArte(
            titulo: "História do Paraná",
            artista: "Poty Lazzarotto",
            ano: 1972,
            estilo: "Painel em concreto aparente",
            imagemNome: "poty_historia_parana",
            descricao: "Painel instalado no saguão do Edifício BADEP."
        ),
        ObraDeArte(
            titulo: "Profissões",
            artista: "Poty Lazzarotto",
            ano: 1974,
            estilo: "Mural em concreto com pigmento",
            imagemNome: "poty_profissoes",
            descricao: "Mural instalado no campus da UTFPR, em Curitiba."
        ),
        ObraDeArte(
            titulo: "Mapa do Paraná Estilizado",
            artista: "Poty Lazzarotto",
            ano: 1976,
            estilo: "Painel em madeira gravada",
            imagemNome: "poty_mapa_parana",
            descricao: "Painel instalado na sala de reuniões do Edifício BADEP."
        ),
        ObraDeArte(
            titulo: "O Largo da Ordem",
            artista: "Poty Lazzarotto",
            ano: 1993,
            estilo: "Mural em azulejos",
            imagemNome: "poty_largo_da_ordem",
            descricao: "Mural localizado na Travessa Nestor de Castro, no Centro Histórico de Curitiba."
        ),
        ObraDeArte(
            titulo: "Painel do Mercado Municipal",
            artista: "Poty Lazzarotto",
            ano: 1997,
            estilo: "Painel em azulejos",
            imagemNome: "poty_mercado_municipal",
            descricao: "Painel localizado no Mercado Municipal de Curitiba."
        ),
        ObraDeArte(
            titulo: "Pietá",
            artista: "João Turin",
            ano: 1917,
            estilo: "Escultura / baixo-relevo",
            imagemNome: "turin_pieta",
            descricao: "Baixo-relevo de temática sacra feito na França; exemplar pode ser visto no Memorial Paranista."
        ),
        ObraDeArte(
            titulo: "No Exílio",
            artista: "João Turin",
            ano: 1912,
            estilo: "Escultura",
            imagemNome: "turin_no_exilio",
            descricao: "Primeira escultura de grandes proporções de João Turin, realizada em Bruxelas."
        ),
        ObraDeArte(
            titulo: "Tiradentes",
            artista: "João Turin",
            ano: 1922,
            estilo: "Escultura",
            imagemNome: "turin_tiradentes",
            descricao: "Escultura exibida em Paris em 1922 e presente no centro de Curitiba desde 1927."
        ),
        ObraDeArte(
            titulo: "Pesquisa em Cor e Espaço",
            artista: "André Mendes",
            ano: 2022,
            estilo: "Pintura, escultura e instalação",
            imagemNome: "artista_andre_mendes",
            descricao: "Artista contemporâneo nascido em Curitiba, com produção voltada ao desenho, pintura, escultura, instalações e intervenções espaciais."
        ),
        ObraDeArte(
            titulo: "Bordados em Folhas Secas",
            artista: "Laura Dalla Vecchia",
            ano: 2021,
            estilo: "Arte têxtil e natureza",
            imagemNome: "artista_laura_dalla_vecchia",
            descricao: "Artista conhecida por transformar folhas secas em suporte artístico, criando bordados delicados inspirados principalmente em aves e elementos naturais."
        ),
        ObraDeArte(
            titulo: "Grafite e Arte Urbana",
            artista: "Deleon",
            ano: 2015,
            estilo: "Graffiti",
            imagemNome: "artista_deleon",
            descricao: "Artista urbano criado em Curitiba, Deleon desenvolve obras com tinta spray e acrílica, misturando cores vibrantes, preto e branco, realismo e imaginação."
        ),
        ObraDeArte(
            titulo: "Mural de Paulo Leminski",
            artista: "Gardpam",
            ano: 2024,
            estilo: "Muralismo urbano",
            imagemNome: "artista_gardpam",
            descricao: "Gardpam, nome artístico de Fernando Ferlin, é reconhecido por murais de grande escala em Curitiba, incluindo homenagens a Paulo Leminski, Helena Kolody e Poty Lazzarotto."
        ),
        ObraDeArte(
            titulo: "Pintura Contemporânea",
            artista: "Adri Volpi",
            ano: 2020,
            estilo: "Pintura",
            imagemNome: "artista_adri_volpi",
            descricao: "Artista visual ligada à pintura contemporânea, com formação em Artes Plásticas e trajetória marcada por exposições individuais no Brasil e no exterior."
        ),
        ObraDeArte(
            titulo: "Trajetória em Pintura",
            artista: "Celso Coppio",
            ano: 1974,
            estilo: "Pintura e ensino de arte",
            imagemNome: "artista_celso_coppio",
            descricao: "Artista e professor de arte, Celso Coppio construiu uma longa trajetória em pintura e formação artística, mantendo galeria e escola de arte."
        ),
        ObraDeArte(
            titulo: "Batuk Freak",
            artista: "Karol Conka",
            ano: 2013,
            estilo: "Rap e hip-hop",
            imagemNome: "artista_karol_conka",
            descricao: "Cantora e rapper curitibana, Karol Conka ganhou projeção nacional com uma linguagem que mistura rap, hip-hop, pop e referências brasileiras."
        ),
        ObraDeArte(
            titulo: "Música das Ruas",
            artista: "Plá",
            ano: 1984,
            estilo: "Música de rua",
            imagemNome: "artista_pla",
            descricao: "Ademir Antunes, conhecido como Plá, é músico tradicional das ruas de Curitiba, lembrado pelo violão, pela presença constante na Rua das Flores e por sua produção independente."
        ),
        ObraDeArte(
            titulo: "Voz Paranaense",
            artista: "Michele Mara",
            ano: 2011,
            estilo: "Soul, MPB e performance vocal",
            imagemNome: "artista_michele_mara",
            descricao: "Cantora curitibana de voz marcante, Michele Mara ganhou reconhecimento nacional ao vencer concursos de interpretação vocal e atua também em projetos de valorização cultural."
        ),
        ObraDeArte(
            titulo: "Atuação e Música",
            artista: "Alexandre Nero",
            ano: 1995,
            estilo: "Teatro, TV e música",
            imagemNome: "artista_alexandre_nero",
            descricao: "Ator, cantor e compositor nascido em Curitiba, Alexandre Nero construiu carreira nacional na televisão, no cinema, no teatro e na música."
        ),
        ObraDeArte(
            titulo: "Trajetória na Teledramaturgia",
            artista: "Ary Fontoura",
            ano: 1949,
            estilo: "Teatro, cinema e televisão",
            imagemNome: "artista_ary_fontoura",
            descricao: "Ator curitibano de carreira extensa no teatro, cinema e televisão, Ary Fontoura é reconhecido como um dos grandes nomes da dramaturgia brasileira."
        ),
        ObraDeArte(
            titulo: "Teatro de Pesquisa",
            artista: "Luís Melo",
            ano: 1992,
            estilo: "Teatro e televisão",
            imagemNome: "artista_luis_melo",
            descricao: "Ator curitibano com forte trajetória no teatro de pesquisa, Luís Melo também se destacou na televisão e no cinema, contribuindo para a formação artística no Paraná."
        )
    ]
}
