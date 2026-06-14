# Roteiro do Vídeo de Apresentação

**Projeto:** Galeria de Artistas Curitibanos  
**Duração recomendada:** 12 a 15 minutos  
**Ordem de fala:** Eduardo, João 1, João 2 e Roberto

> Observação: trocar "João 1" e "João 2" pelos nomes completos ou sobrenomes antes de entregar/gravar.

## Eduardo - Abertura, proposta do app e demonstração inicial

**Tempo sugerido:** 3 a 4 minutos

### Fala sugerida

"Olá, professor. Nós somos o grupo formado por Eduardo, João, João e Roberto. Nosso projeto se chama **Galeria de Artistas Curitibanos**."

"A proposta do aplicativo é apresentar uma galeria interativa de artistas, obras e personalidades culturais ligadas a Curitiba. O app reúne diferentes áreas da produção cultural, como artes visuais, arte urbana, música, teatro e televisão."

"A ideia foi valorizar a produção local e mostrar que Curitiba possui artistas importantes em várias linguagens. Por isso, o catálogo inclui obras públicas de Poty Lazzarotto e João Turin, além de nomes como Karol Conka, Alexandre Nero, Ary Fontoura, Luís Melo, Plá, Michele Mara, Deleon, Gardpam e outros artistas."

"O aplicativo foi desenvolvido em **UIKit**, usando **View Code**, ou seja, sem Storyboard para a interface principal. A navegação é feita com `UINavigationController`, começando pela tela da galeria e indo para uma tela de detalhes quando o usuário toca em uma obra ou artista."

### Demonstração no app

Abrir o app no simulador ou no iPhone.

Mostrar a tela inicial e falar:

"Aqui temos a tela principal do aplicativo. Ela apresenta o título **Galeria de Artistas Curitibanos**, um subtítulo com o recorte do projeto e um contador com a quantidade de itens do catálogo."

Rolar a tela e falar:

"A galeria é exibida em formato de grade. Cada célula mostra uma imagem, o título da obra ou perfil artístico e o nome do artista."

Mostrar alguns exemplos:

"Aqui aparecem obras do Poty Lazzarotto, obras do João Turin e também artistas de outras áreas culturais. Isso ajuda o projeto a atender ao tema de artistas curitibanos de forma mais ampla."

Tocar em uma célula e falar:

"Quando o usuário toca em um item, o app abre uma nova tela com os detalhes. Essa tela mostra a imagem maior, título, artista, ano, estilo e descrição."

Voltar para a galeria.

### Explicação de UI/UX

"Na parte visual, escolhemos uma paleta verde e laranja. O verde aparece como base do fundo e dos cards, enquanto o laranja aparece nos destaques, botões, ícones e linhas decorativas."

"Essa escolha cria uma identidade visual forte, ligada à ideia de cidade, cultura, arte urbana e memória cultural. Também usamos cards com cantos arredondados, sombras leves e imagens grandes para deixar a galeria mais visual."

"A experiência foi pensada para ser simples: o usuário abre o app, navega pela galeria, pesquisa artistas ou estilos e acessa os detalhes com um toque."

### Arquivos para mostrar rapidamente

- `AppDelegate.swift`, mostrando que o app inicia por View Code.
- `Utils/DesignSystem.swift`, mostrando a paleta verde e laranja.
- Tela do simulador com a galeria funcionando.

### Fechamento da parte do Eduardo

"Agora o João vai explicar a arquitetura do projeto e a estrutura de dados usada para montar a galeria."

---

## João 1 - Arquitetura, modelo de dados e Assets Catalog

**Tempo sugerido:** 3 a 4 minutos

### Fala sugerida

"A arquitetura usada no projeto foi **MVC**, que significa Model, View e Controller. Esse padrão combina bem com UIKit e ajuda a organizar melhor o código."

"No nosso projeto, o Model fica no arquivo `ObraDeArte.swift`. Ele define a estrutura dos dados exibidos no aplicativo."

Mostrar `Models/ObraDeArte.swift`.

"A struct `ObraDeArte` possui as propriedades pedidas no enunciado: `titulo`, `artista`, `ano`, `estilo`, `imagemNome` e `descricao`."

"Cada item da galeria é criado usando essa struct. O campo `titulo` representa o nome da obra ou do perfil artístico. O campo `artista` guarda o nome do artista. O campo `ano` representa o ano da obra ou um ano de referência na trajetória. O campo `estilo` descreve a linguagem artística, e o campo `descricao` traz um texto explicativo."

"O campo `imagemNome` é muito importante, porque ele faz a ligação entre o dado do catálogo e a imagem armazenada localmente no Assets Catalog."

### Explicação do catálogo

Mostrar `CatalogoDeObras.obras`.

"Logo abaixo da struct, temos o `CatalogoDeObras`, que contém o array com todos os itens exibidos na galeria."

"Atualmente, o catálogo possui 27 itens. Ele mistura obras públicas reais de Poty Lazzarotto e João Turin com perfis de artistas e personalidades culturais ligadas a Curitiba."

"Essa organização facilita a manutenção do app. Se quisermos adicionar um novo artista, basta criar mais um `ObraDeArte` no array e adicionar a imagem correspondente no Assets."

### Explicação dos Assets

Mostrar `Assets.xcassets`.

"As imagens ficam no `Assets.xcassets`, como o enunciado solicitou. Cada imagem está dentro de um `.imageset`."

"Por exemplo, no modelo temos `imagemNome: \"poty_largo_da_ordem\"`. No Assets existe um imageset com esse mesmo nome. Assim, quando o app chama `UIImage(named: obra.imagemNome)`, ele encontra a imagem correta."

"Também tomamos cuidado para remover arquivos que não estavam mais sendo usados, deixando o catálogo de assets mais organizado."

### Relação com MVC

"Dentro do MVC, esse arquivo representa a parte Model. Ele não sabe nada sobre interface. Ele apenas guarda os dados que depois serão usados pelos Controllers e pelas Views."

"Essa separação deixa o código mais claro: os dados ficam em um lugar, a tela principal em outro, a célula em outro e a tela de detalhes em outro."

### Fechamento da parte do João 1

"Agora o próximo João vai explicar a tela principal, a CollectionView, a célula customizada e a lógica de busca."

---

## João 2 - CollectionView, célula customizada, busca e layout responsivo

**Tempo sugerido:** 4 a 5 minutos

### Fala sugerida

"A tela principal do app está no arquivo `GaleriaViewController.swift`. Ela é responsável por exibir a galeria usando `UICollectionView`."

Mostrar `Controllers/GaleriaViewController.swift`.

"A CollectionView é criada por View Code. Nela configuramos o layout, a cor de fundo, o espaçamento, o registro da célula customizada e também definimos o `dataSource` e o `delegate`."

Mostrar este trecho:

- `cv.register(ObraCollectionViewCell.self, forCellWithReuseIdentifier:)`
- `cv.dataSource = self`
- `cv.delegate = self`

"O `DataSource` é responsável por dizer quantos itens aparecem na galeria e por configurar cada célula."

Mostrar `numberOfItemsInSection`.

"No método `numberOfItemsInSection`, retornamos `obrasFiltradas.count`. Isso é importante porque a tela exibe tanto o catálogo completo quanto os resultados filtrados pela busca."

Mostrar `cellForItemAt`.

"No método `cellForItemAt`, pegamos a célula reutilizável, acessamos a obra correspondente no array e chamamos `celula.configurar(com:)`."

### Célula customizada

Mostrar `Views/ObraCollectionViewCell.swift`.

"A célula customizada é a `ObraCollectionViewCell`. Ela mostra a imagem, o título e o nome do artista."

"A célula também tem um container com sombra, cantos arredondados, uma linha laranja decorativa e um gradiente sobre a imagem para melhorar a leitura."

Mostrar o método `configurar(com:)`.

"Aqui no método `configurar`, a célula recebe uma `ObraDeArte`, coloca o título e o artista nas labels e carrega a imagem com `UIImage(named:)`."

"Caso a imagem não seja encontrada, existe um placeholder gerado por código. Mas como o catálogo está completo, cada item possui sua imagem no Assets."

### Delegate e navegação

Voltar para `GaleriaViewController.swift`.

Mostrar `didSelectItemAt`.

"O `Delegate` é usado para capturar a interação do usuário. Quando o usuário toca em uma célula, o método `didSelectItemAt` é chamado."

"Dentro dele, pegamos a obra selecionada e criamos uma `DetalheViewController`, passando essa obra no inicializador. Depois usamos `navigationController?.pushViewController` para abrir a tela de detalhes."

### Layout responsivo

Mostrar `UICollectionViewDelegateFlowLayout`.

"Para deixar a grade responsiva, usamos `UICollectionViewDelegateFlowLayout`."

"O método `sizeForItemAt` calcula a largura das células com base na largura da CollectionView. Ele usa entre 2 e 4 colunas, dependendo do tamanho da tela."

"Isso permite que o app funcione bem tanto em iPhone quanto em iPad, sem precisar criar layouts separados."

### Busca

Mostrar `UISearchResultsUpdating`.

"A busca foi feita com `UISearchController`. O usuário pode pesquisar por título, artista ou estilo."

Mostrar `updateSearchResults`.

"Quando o texto da busca muda, o método `updateSearchResults` filtra o array `todasObras` e atualiza o array `obrasFiltradas`."

Mostrar `normalizarBusca`.

"Também criamos a função `normalizarBusca`, usando `folding(options:)`. Isso permite ignorar acentos e diferença entre maiúsculas e minúsculas. Então pesquisar `joao` funciona mesmo que o nome esteja escrito como `João`."

### Demonstração no app

No simulador:

- pesquisar `poty`;
- pesquisar `joao`;
- pesquisar `rap`;
- pesquisar uma palavra sem resultado para mostrar o estado vazio.

Fala:

"Aqui conseguimos ver que a busca atualiza a galeria em tempo real e também mostra uma mensagem quando nenhum resultado é encontrado."

### Fechamento da parte do João 2

"Agora o Roberto vai explicar a tela de detalhes, o compartilhamento, as animações e as dificuldades encontradas no desenvolvimento."

---

## Roberto - Tela de detalhes, compartilhamento, animações, dificuldades e encerramento

**Tempo sugerido:** 4 a 5 minutos

### Tela de detalhes

Mostrar `Controllers/DetalheViewController.swift`.

"A tela de detalhes é controlada pela `DetalheViewController`. Ela recebe uma `ObraDeArte` no inicializador, então cada tela de detalhe é montada com base no item que o usuário selecionou."

Mostrar `init(obra:)`.

"Esse inicializador guarda a obra em uma propriedade privada. Depois, no `viewDidLoad`, chamamos `setupUI()` e `popularDados()`."

Mostrar `popularDados`.

"No método `popularDados`, preenchemos o título, artista, descrição e imagem. Também formatamos a descrição com espaçamento entre linhas para melhorar a leitura."

"A tela usa uma imagem grande no topo, um card de informações e uma `UIScrollView`. Isso é importante porque alguns textos são maiores, e a ScrollView garante que tudo fique acessível em telas menores."

### Ano e estilo

Mostrar `criarMetaItem`.

"O ano e o estilo são exibidos como metadados, com ícones do sistema. Essa função cria um pequeno bloco visual com ícone, rótulo e valor."

### Compartilhamento

Mostrar `compartilharObra`.

"O botão Compartilhar usa `UIActivityViewController`, que é o componente padrão do iOS para compartilhar conteúdo."

"A mensagem inclui o título, o nome do artista e um convite para conhecer mais artistas curitibanos no app."

No simulador:

- abrir um item;
- tocar em Compartilhar;
- mostrar a sheet do iOS;
- cancelar.

### Animações

Mostrar `ObraCollectionViewCell.swift`.

"Também adicionamos animações sutis. Na célula, quando o usuário toca, ela diminui levemente de tamanho. Isso dá feedback visual e melhora a sensação de interação."

Mostrar `touchesBegan`, `touchesEnded` e `animarToque`.

Voltar para `GaleriaViewController.swift`.

"Na galeria, usamos animações quando as células aparecem na tela. Isso acontece no `willDisplay`, e também existe uma animação de entrada quando a tela aparece."

Mostrar `willDisplay` e `animarEntradaDaCelulas`.

Mostrar `DetalheViewController.swift`.

"Na tela de detalhes, os elementos aparecem com uma animação em sequência, deixando a transição mais agradável."

Mostrar `animarEntrada`.

### Dificuldades e soluções

"Durante o desenvolvimento, uma dificuldade foi a configuração inicial do projeto. O app estava tentando abrir um storyboard chamado `Main`, mas a interface foi construída em View Code. A solução foi remover a referência ao storyboard principal e criar a janela programaticamente."

"Outra dificuldade foi organizar as imagens locais. Como o requisito pedia imagens armazenadas no projeto, conferimos se todos os nomes usados em `imagemNome` tinham uma imagem correspondente no Assets Catalog."

"Também melhoramos a busca para lidar com acentos, porque nomes como João poderiam não aparecer se o usuário digitasse sem acento."

"Por fim, ajustamos o layout para funcionar de forma responsiva, usando cálculo dinâmico no `UICollectionViewFlowLayout`."

### Encerramento

"Com isso, o aplicativo atende aos requisitos do projeto: usa UIKit, CollectionView, DataSource, Delegate, layout responsivo, tela de detalhes, imagens locais, busca, animações e compartilhamento."

"A arquitetura MVC ajudou a organizar o código e a separar responsabilidades. O Model guarda os dados, a View customizada cuida da célula e os Controllers controlam a galeria e os detalhes."

"O resultado final é uma galeria visual e interativa que valoriza artistas curitibanos e diferentes áreas culturais da cidade."

"Obrigado!"

---

## Checklist rápido antes de gravar

- Rodar o app no simulador ou device.
- Mostrar a galeria inicial.
- Pesquisar `poty`, `joao`, `rap` e `teatro`.
- Abrir uma obra do Poty.
- Abrir um perfil de artista.
- Testar o botão Compartilhar.
- Mostrar no Xcode:
  - `ObraDeArte.swift`
  - `GaleriaViewController.swift`
  - `ObraCollectionViewCell.swift`
  - `DetalheViewController.swift`
  - `DesignSystem.swift`
- Garantir que cada integrante fale apenas no seu bloco.
- Manter o vídeo entre 10 e 20 minutos.

