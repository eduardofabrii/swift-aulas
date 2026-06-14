# Relatório Técnico - Galeria de Artistas Curitibanos

## Componentes do grupo

- Eduardo
- João 1
- Roberto
- João 2

> Observação: caso necessário, substituir "João 1" e "João 2" pelos nomes completos dos integrantes.

## 1. Visão geral do projeto

O aplicativo **Galeria de Artistas Curitibanos** foi desenvolvido em iOS utilizando **UIKit** e **View Code**, com o objetivo de apresentar uma galeria interativa de artistas e obras com forte relação com Curitiba. O app valoriza artes visuais, música e cena, reunindo obras públicas de Poty Lazzarotto e João Turin, além de perfis de artistas e personalidades culturais ligados à cidade.

A tela principal exibe os itens em uma grade construída com `UICollectionView`. Ao selecionar uma célula, o usuário é direcionado para uma tela de detalhes com imagem ampliada, título, artista, ano, estilo, descrição e botão de compartilhamento.

## 2. Arquitetura utilizada

A arquitetura utilizada foi **MVC (Model-View-Controller)**, padrão comum em projetos UIKit.

### Model

O arquivo `Models/ObraDeArte.swift` define a struct `ObraDeArte`, responsável por representar cada item da galeria. Ela possui as propriedades exigidas no enunciado:

- `titulo`
- `artista`
- `ano`
- `estilo`
- `imagemNome`
- `descricao`

No mesmo arquivo, `CatalogoDeObras` centraliza a lista de dados usada pelo aplicativo.

### View

A principal View customizada é `Views/ObraCollectionViewCell.swift`. Essa célula define a apresentação visual de cada item da galeria, exibindo imagem, título e nome do artista.

### Controller

O arquivo `Controllers/GaleriaViewController.swift` controla a tela principal, incluindo:

- criação da `UICollectionView`;
- configuração de `DataSource` e `Delegate`;
- cálculo responsivo do layout;
- lógica de busca;
- animações de entrada das células;
- navegação para a tela de detalhes.

O arquivo `Controllers/DetalheViewController.swift` controla a tela de detalhes, exibindo os dados completos da obra/artista e acionando o compartilhamento via `UIActivityViewController`.

## 3. Estrutura de dados

O catálogo possui 27 itens, combinando obras e perfis culturais:

- 12 obras de Poty Lazzarotto;
- 3 obras de João Turin;
- 12 artistas e personalidades culturais ligados a Curitiba, incluindo André Mendes, Laura Dalla Vecchia, Deleon, Gardpam, Karol Conka, Plá, Michele Mara, Alexandre Nero, Ary Fontoura e Luís Melo.

As imagens são carregadas localmente a partir do `Assets.xcassets`, usando o valor da propriedade `imagemNome`.

## 4. UICollectionView e layout responsivo

A galeria foi construída com `UICollectionView` e `UICollectionViewFlowLayout`. O layout calcula dinamicamente o tamanho das células conforme a largura da tela:

- em telas menores, a grade tende a exibir 2 colunas;
- em telas maiores, pode chegar a 3 ou 4 colunas;
- o espaçamento é definido pelo `DesignSystem`, mantendo consistência visual.

Essa solução permite que o app funcione bem em iPhone e iPad, evitando células muito pequenas ou grandes demais.

## 5. Interatividade

Ao tocar em uma célula, o método `collectionView(_:didSelectItemAt:)` identifica a obra selecionada e cria uma instância de `DetalheViewController`, enviando o objeto `ObraDeArte` correspondente.

Na tela de detalhes, o usuário visualiza:

- imagem em destaque;
- título;
- artista;
- ano;
- estilo;
- descrição;
- botão de compartilhamento.

O botão de compartilhamento usa `UIActivityViewController`, permitindo compartilhar uma mensagem com o título, o nome do artista e um convite para conhecer mais artistas curitibanos.

## 6. Busca

A busca foi implementada com `UISearchController` e `UISearchResultsUpdating`. O filtro pesquisa por:

- título;
- artista;
- estilo.

Também foi adicionada normalização de texto com `folding(options:)`, permitindo buscar sem diferenciar maiúsculas, minúsculas ou acentos. Isso melhora a experiência do usuário, pois uma busca por "joao" pode encontrar "João".

## 7. Animações

O app possui animações sutis para melhorar a experiência:

- animação de entrada das células na tela principal;
- animação no método `willDisplay`, aplicada quando novas células aparecem no scroll;
- animação de toque na célula, reduzindo levemente a escala;
- animação de entrada dos elementos da tela de detalhes;
- animação rápida no botão de compartilhamento.

As animações foram pensadas para deixar a interface mais fluida sem atrapalhar a navegação.

## 8. Decisões de UI e UX

O design foi construído com uma paleta **verde e laranja**, remetendo à identidade visual urbana e cultural de Curitiba. O verde foi usado como base de fundo, enquanto o laranja funciona como cor de destaque em linhas, botões, ícones e elementos de navegação.

As principais decisões de interface foram:

- uso de cards escuros para destacar imagens e textos;
- tipografia com aparência editorial para títulos;
- imagens grandes na tela de detalhes;
- navegação simples via `UINavigationController`;
- busca sempre acessível no topo da galeria;
- estado vazio para pesquisas sem resultado;
- layout em grade para facilitar a comparação visual entre obras e artistas.

## 9. Dificuldades encontradas e soluções

### Referência ao storyboard Main

Durante o desenvolvimento, o app apresentou erro informando que não encontrava um storyboard chamado `Main`. A causa era uma configuração antiga no projeto (`UIMainStoryboardFile = Main`). Como o app foi desenvolvido em View Code, essa referência foi removida do target, e a inicialização passou a ser feita pela `SceneDelegate`.

### Imagens locais

O enunciado exigia imagens no Assets Catalog. Inicialmente algumas entradas não tinham imagem real. A solução foi organizar todos os itens em `.imageset` dentro do `Assets.xcassets`, garantindo que cada `imagemNome` do modelo tenha um asset correspondente.

### Responsividade

Para adaptar a grade em diferentes tamanhos de tela, foi usado `UICollectionViewDelegateFlowLayout`, calculando o número de colunas com base na largura disponível.

### Busca com acentos

Uma busca simples poderia falhar em nomes com acentos. A solução foi normalizar os textos antes da comparação, tornando a busca mais flexível.

## 10. Conclusão

O projeto atende aos requisitos propostos ao utilizar UIKit, `UICollectionView`, View Code, arquitetura MVC, busca, animações, tela de detalhes e compartilhamento. Além disso, a curadoria visual e temática amplia o recorte de "Artistas Curitibanos" para diferentes áreas culturais, incluindo artes visuais, música, teatro, televisão e arte urbana.

## 11. Fontes das imagens

As imagens utilizadas foram coletadas de fontes públicas, institucionais ou de páginas de referência dos artistas:

- Patrimônio Cultural do Paraná - obras de Poty Lazzarotto
- Prefeitura de Curitiba - obras de João Turin
- Blombo - André Mendes
- Tribuna do Paraná - Laura Dalla Vecchia
- Site oficial de Deleon Ribeiro
- RPC / Rede Globo - Gardpam e Michele Mara
- Revista DUO - Adri Volpi
- Site oficial de Celso Coppio
- Wikimedia Commons - Karol Conka, Alexandre Nero, Ary Fontoura e Luís Melo
- Busão Curitiba - Plá

