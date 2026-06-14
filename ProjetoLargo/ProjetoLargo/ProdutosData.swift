import Foundation

extension ProdutoArtesanal {
    static let exemplos: [ProdutoArtesanal] = [

        // MARK: – Madeira
        ProdutoArtesanal(
            nome: "Escultura Capivara",
            artesao: "João da Silva",
            preco: 120.00,
            categoria: "Madeira",
            imagemNome: "produto_escultura_capivara",
            descricao: "Escultura entalhada à mão em madeira de araucária representando a capivara, animal símbolo do Paraná. Acabamento com verniz ecológico natural. Peça única com 20 cm de comprimento.",
            avaliacao: 4.9
        ),
        ProdutoArtesanal(
            nome: "Porta-Retratos Araucária",
            artesao: "Maria Pinheiro",
            preco: 75.00,
            categoria: "Madeira",
            imagemNome: "produto_porta_retratos",
            descricao: "Porta-retratos artesanal em pinheiro paranaense com entalhes de ramos de araucária. Suporta fotos 10×15 cm. Lixado e envernizado à mão.",
            avaliacao: 4.6
        ),
        ProdutoArtesanal(
            nome: "Banquinho Rústico",
            artesao: "Marcenaria Curitibana",
            preco: 210.00,
            categoria: "Madeira",
            imagemNome: "produto_banquinho_rustico",
            descricao: "Banquinho confeccionado com madeira de demolição, dando nova vida a materiais descartados. Acabamento com cera de abelha natural. Altura 45 cm, suporta até 100 kg.",
            avaliacao: 4.7
        ),
        ProdutoArtesanal(
            nome: "Caixa de Música Entalhada",
            artesao: "Guilherme Entalhador",
            preco: 340.00,
            categoria: "Madeira",
            imagemNome: "produto_caixa_musica",
            descricao: "Caixa de música artesanal em cedro com entalhes florais. Mecanismo suíço que toca 'Asa Branca'. Interior forrado em veludo vermelho. Peça numerada e assinada.",
            avaliacao: 4.9
        ),
        ProdutoArtesanal(
            nome: "Miniatura Araucária",
            artesao: "Atelier do Pinhão",
            preco: 95.00,
            categoria: "Madeira",
            imagemNome: "produto_miniatura_araucaria",
            descricao: "Miniatura fiel de araucária entalhada em madeira maciça. Pintura à base d'água realçando os detalhes da casca. Altura 22 cm. Ótima para decoração de mesa.",
            avaliacao: 4.5
        ),

        // MARK: – Arte
        ProdutoArtesanal(
            nome: "Tela Pôr do Sol",
            artesao: "Ana Pintora",
            preco: 350.00,
            categoria: "Arte",
            imagemNome: "produto_tela_por_sol",
            descricao: "Pintura em tela com tinta acrílica retratando o pôr do sol visto da Pedreira Paulo Leminski. Dimensões 40×60 cm, moldura de madeira inclusa. Assinada e com certificado.",
            avaliacao: 4.9
        ),
        ProdutoArtesanal(
            nome: "Aquarela Centro Histórico",
            artesao: "Carlos Aguarela",
            preco: 280.00,
            categoria: "Arte",
            imagemNome: "produto_aquarela_centro",
            descricao: "Aquarela em papel de algodão 300 g retratando o Largo da Ordem em dia de feira. Detalhes vibrantes da azulejaria curitibana. Formato A3, emoldurada artesanalmente.",
            avaliacao: 4.8
        ),
        ProdutoArtesanal(
            nome: "Fotografia Curitibana",
            artesao: "Cláudia Fonseca",
            preco: 180.00,
            categoria: "Arte",
            imagemNome: "produto_fotografia",
            descricao: "Fotografia artística em impressão Fine Art, papel algodão 308 g. Cena clássica do centro histórico em dia chuvoso. Moldura de pinus.",
            avaliacao: 4.6
        ),
        ProdutoArtesanal(
            nome: "Mosaico de Vidro",
            artesao: "Estúdio Mosaic",
            preco: 420.00,
            categoria: "Arte",
            imagemNome: "produto_mosaico_vidro",
            descricao: "Mosaico em vidro colorido com motivos de pássaros nativos do Paraná. Técnica Tiffany. Dimensões 30×30 cm, com gancho para parede incluso.",
            avaliacao: 4.8
        ),
        ProdutoArtesanal(
            nome: "Gravura em Metal",
            artesao: "Marco Artesão",
            preco: 150.00,
            categoria: "Arte",
            imagemNome: "produto_gravura_metal",
            descricao: "Gravura em cobre com técnica de água-forte. Tiragem limitada de 30 exemplares, numerados e assinados. Dimensões 20×30 cm.",
            avaliacao: 4.5
        ),

        // MARK: – Vestuário
        ProdutoArtesanal(
            nome: "Blusa de Crochê Floral",
            artesao: "Dona Tereza",
            preco: 185.00,
            categoria: "Vestuário",
            imagemNome: "produto_blusa_croche",
            descricao: "Blusa em crochê artesanal com linha de algodão 100% natural. Motivos florais da flora nativa do Paraná. Tamanhos P, M e G. Lavagem à mão recomendada.",
            avaliacao: 4.8
        ),
        ProdutoArtesanal(
            nome: "Cachecol de Lã",
            artesao: "Sra. Aparecida Costa",
            preco: 95.00,
            categoria: "Vestuário",
            imagemNome: "produto_cachecol_la",
            descricao: "Cachecol tricotado à mão em lã merina natural, ideal para os invernos de Curitiba. Comprimento 180 cm com franja. Cores: creme, cinza e azul petróleo.",
            avaliacao: 4.6
        ),
        ProdutoArtesanal(
            nome: "Chapéu de Palha",
            artesao: "Família Santos",
            preco: 70.00,
            categoria: "Vestuário",
            imagemNome: "produto_chapeu_palha",
            descricao: "Chapéu de palha trançado à mão por artesãos da região. Aba larga de 8 cm, forro de algodão. Tamanho único ajustável.",
            avaliacao: 4.4
        ),
        ProdutoArtesanal(
            nome: "Bolsa Macramê",
            artesao: "Linhas da Terra",
            preco: 145.00,
            categoria: "Vestuário",
            imagemNome: "produto_bolsa_macrame",
            descricao: "Bolsa em macramê com cordão de algodão cru. Interior forrado em linho. Alça regulável. Dimensões 30×25 cm. Cada peça é única.",
            avaliacao: 4.7
        ),

        // MARK: – Cerâmica
        ProdutoArtesanal(
            nome: "Jogo de Xícaras Pintadas",
            artesao: "Atelier Cerâmica Viva",
            preco: 220.00,
            categoria: "Cerâmica",
            imagemNome: "produto_xicaras_pintadas",
            descricao: "Jogo com 4 xícaras e pires em cerâmica artesanal, pintadas à mão com padrões geométricos. Vai ao micro-ondas e lava-louças. 200 ml.",
            avaliacao: 4.9
        ),
        ProdutoArtesanal(
            nome: "Vaso de Barro Rústico",
            artesao: "Pedro Oleiro",
            preco: 60.00,
            categoria: "Cerâmica",
            imagemNome: "produto_vaso_barro",
            descricao: "Vaso em barro vermelho feito na roda de oleiro, queimado em forno a lenha. Altura 25 cm, abertura 12 cm.",
            avaliacao: 4.5
        ),
        ProdutoArtesanal(
            nome: "Prato Decorativo Azul",
            artesao: "Cerâmica do Largo",
            preco: 85.00,
            categoria: "Cerâmica",
            imagemNome: "produto_prato_decorativo",
            descricao: "Prato em cerâmica de alta temperatura, pintura em azul cobalto inspirada nos azulejos portugueses. Diâmetro 28 cm. Suporte de parede incluso.",
            avaliacao: 4.6
        ),
        ProdutoArtesanal(
            nome: "Porta-Velas em Cerâmica",
            artesao: "Luz Artesanal",
            preco: 45.00,
            categoria: "Cerâmica",
            imagemNome: "produto_porta_velas",
            descricao: "Porta-velas em cerâmica branca com recortes geométricos que projetam sombras. Compatível com velas tea-light. Altura 12 cm.",
            avaliacao: 4.7
        ),

        // MARK: – Alimentos
        ProdutoArtesanal(
            nome: "Barreado Artesanal",
            artesao: "Família Gonçalves",
            preco: 48.00,
            categoria: "Alimentos",
            imagemNome: "produto_barreado",
            descricao: "Barreado seguindo receita paranaense de mais de 100 anos. Carne bovina cozida lentamente em panela de barro lacrada. Serve 2 pessoas.",
            avaliacao: 4.9
        ),
        ProdutoArtesanal(
            nome: "Chimia de Figo",
            artesao: "Sítio Esperança",
            preco: 22.00,
            categoria: "Alimentos",
            imagemNome: "produto_chimia_figo",
            descricao: "Chimia de figo com frutas do próprio sítio, sem conservantes. Textura cremosa e sabor intenso. Frasco de 400 g. Validade 6 meses.",
            avaliacao: 4.8
        ),
        ProdutoArtesanal(
            nome: "Pão de Mel Artesanal",
            artesao: "Doceria da Feira",
            preco: 35.00,
            categoria: "Alimentos",
            imagemNome: "produto_pao_mel",
            descricao: "Caixa com 12 unidades de pão de mel recheado com doce de leite e coberto com chocolate belga. Validade 15 dias.",
            avaliacao: 4.7
        ),
        ProdutoArtesanal(
            nome: "Erva-Mate Especial",
            artesao: "Erveira Curitibana",
            preco: 28.00,
            categoria: "Alimentos",
            imagemNome: "produto_erva_mate",
            descricao: "Erva-mate premium cultivada na serra paranaense. Blend com pitanga e carqueja. Lata reutilizável de 500 g.",
            avaliacao: 4.6
        ),

        // MARK: – Antiguidades
        ProdutoArtesanal(
            nome: "Relógio de Parede Vintage",
            artesao: "Antiguários do Largo",
            preco: 380.00,
            categoria: "Antiguidades",
            imagemNome: "produto_relogio_vintage",
            descricao: "Relógio alemão dos anos 1950, mecanismo de corda original funcionando. Caixa em carvalho maciço. Restaurado por especialista. Certificado de autenticidade.",
            avaliacao: 4.8
        ),
        ProdutoArtesanal(
            nome: "Máquina de Escrever",
            artesao: "Colecionáveis BR",
            preco: 520.00,
            categoria: "Antiguidades",
            imagemNome: "produto_maquina_escrever",
            descricao: "Olivetti Lettera 32, anos 1960, em excelente estado. Revisada e lubrificada. Fita nova inclusa. Estojo de couro original.",
            avaliacao: 4.9
        ),
        ProdutoArtesanal(
            nome: "Vinil Música Gaúcha",
            artesao: "Discos do Sul",
            preco: 65.00,
            categoria: "Antiguidades",
            imagemNome: "produto_vinil",
            descricao: "Disco de vinil 33 RPM com gravações raras de música gaúcha e paranaense dos anos 1970. Estado 8/10. Capa original conservada.",
            avaliacao: 4.5
        ),

        // MARK: – Bijuterias
        ProdutoArtesanal(
            nome: "Colar Pedras Brasileiras",
            artesao: "Joia Nativa",
            preco: 160.00,
            categoria: "Bijuterias",
            imagemNome: "produto_colar_pedras",
            descricao: "Colar com ametista do RS, ágata do Sul e quartzo rosa de MG. Fio de prata 950. Comprimento ajustável 40–50 cm.",
            avaliacao: 4.8
        ),
        ProdutoArtesanal(
            nome: "Brincos de Penas",
            artesao: "Atelier Plumas",
            preco: 65.00,
            categoria: "Bijuterias",
            imagemNome: "produto_brincos_penas",
            descricao: "Brincos com penas naturais tingidas, argola de prata 925 e cristais Swarovski. Comprimento 8 cm. Cada par é único.",
            avaliacao: 4.5
        ),
        ProdutoArtesanal(
            nome: "Pulseira Trançada",
            artesao: "ArteBijou",
            preco: 55.00,
            categoria: "Bijuterias",
            imagemNome: "produto_pulseira",
            descricao: "Pulseira trançada em fio de prata e couro com pedra turquesa natural. Fechamento ajustável. Inspirada nos ornamentos originários do sul do Brasil.",
            avaliacao: 4.6
        ),

        // MARK: – Couro
        ProdutoArtesanal(
            nome: "Carteira em Couro Gravado",
            artesao: "Couro & Arte",
            preco: 130.00,
            categoria: "Couro",
            imagemNome: "produto_carteira_couro",
            descricao: "Carteira bifold em couro bovino curtido ao vegetal. Gravação artesanal com fauna paranaense. Capacidade para 8 cartões, 3 bolsos e notas.",
            avaliacao: 4.7
        ),
        ProdutoArtesanal(
            nome: "Cinto Artesanal",
            artesao: "Cintos do Sul",
            preco: 95.00,
            categoria: "Couro",
            imagemNome: "produto_cinto_couro",
            descricao: "Cinto em couro genuíno curtido artesanalmente. Fivela em latão envelhecido. Largura 3,5 cm. Tamanhos P a GG. Gravação com iniciais opcional.",
            avaliacao: 4.5
        ),
    ]
}
