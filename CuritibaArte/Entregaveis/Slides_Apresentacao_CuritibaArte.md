# Slides de Apoio - Galeria de Artistas Curitibanos

## Slide 1 - Título

Galeria de Artistas Curitibanos  
Projeto UIKit Avançado  
Eduardo, João 1, João 2 e Roberto

## Slide 2 - Objetivo do App

Apresentar uma galeria interativa de artistas, obras e personalidades culturais ligadas a Curitiba.

Pontos-chave:

- UIKit com View Code
- UICollectionView em grade
- Imagens locais no Assets Catalog
- Busca, detalhes, animações e compartilhamento

## Slide 3 - Recorte Cultural

O catálogo reúne artes visuais, música e cena.

Exemplos:

- Poty Lazzarotto e João Turin
- Arte urbana e pintura contemporânea
- Música, teatro, televisão e performance

## Slide 4 - Arquitetura MVC

Model:

- ObraDeArte
- CatalogoDeObras

View:

- ObraCollectionViewCell
- DesignSystem

Controller:

- GaleriaViewController
- DetalheViewController

## Slide 5 - Tela Principal

A galeria usa UICollectionView com DataSource e Delegate.

Fluxo:

- numberOfItemsInSection define a quantidade
- cellForItemAt configura cada célula
- didSelectItemAt abre a tela de detalhes
- UICollectionViewFlowLayout ajusta o tamanho das células

## Slide 6 - Busca e Detalhes

Busca:

- UISearchController
- filtro por título, artista e estilo
- ignora acentos e maiúsculas/minúsculas

Detalhes:

- imagem ampliada
- título, artista, ano, estilo e descrição
- botão de compartilhamento com UIActivityViewController

## Slide 7 - UI, UX e Animações

Decisões de design:

- paleta verde e laranja
- cards visuais
- imagens grandes
- tipografia editorial
- navegação simples

Animações:

- entrada das células
- toque com escala
- entrada dos elementos na tela de detalhes

## Slide 8 - Dificuldades e Soluções

Dificuldades:

- referência antiga ao Main.storyboard
- organização das imagens locais
- busca com acentos
- layout responsivo

Soluções:

- View Code com SceneDelegate
- Assets Catalog revisado
- normalização de busca
- cálculo dinâmico de colunas

## Slide 9 - Encerramento

O app atende aos requisitos:

- UIKit
- UICollectionView
- DataSource e Delegate
- layout responsivo
- tela de detalhes
- busca
- animações
- compartilhamento

