import UIKit

/// Controller principal — exibe a grade de obras de arte curitibanas
class GaleriaViewController: UIViewController {

    private let backgroundGradientLayer = CAGradientLayer()

    /// Todas as obras do catálogo
    private let todasObras = CatalogoDeObras.obras

    /// Obras filtradas pela busca (exibidas na collection)
    private var obrasFiltradas: [ObraDeArte] = []

    /// Flag para saber se a busca está ativa
    private var buscaAtiva: Bool {
        return !(searchController.searchBar.text?.isEmpty ?? true)
    }

    /// CollectionView principal
    private lazy var collectionView: UICollectionView = {
        let layout = criarLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(
            top: DesignSystem.Espacamento.margemPequena,
            left: 0,
            bottom: DesignSystem.Espacamento.margemGrande,
            right: 0
        )
        cv.register(ObraCollectionViewCell.self, forCellWithReuseIdentifier: ObraCollectionViewCell.identifier)
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    /// Header com título do app
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let appTituloLabel: UILabel = {
        let label = UILabel()
        label.text = "Galeria de Artistas Curitibanos"
        label.font = DesignSystem.Tipografia.tituloApp()
        label.textColor = DesignSystem.Cores.textoPrincipal
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subTituloLabel: UILabel = {
        let label = UILabel()
        label.text = "ARTES VISUAIS, MÚSICA E CENA"
        label.font = DesignSystem.Tipografia.detalhe()
        label.textColor = DesignSystem.Cores.laranja
        label.letterSpacing(1.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let contadorLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystem.Tipografia.secao()
        label.textColor = DesignSystem.Cores.textoSecundario
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// SearchController para filtrar obras
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Buscar obra ou artista..."
        sc.searchBar.tintColor = DesignSystem.Cores.laranja
        sc.searchBar.searchTextField.backgroundColor = DesignSystem.Cores.fundoCelula
        sc.searchBar.searchTextField.textColor = DesignSystem.Cores.textoPrincipal
        sc.searchBar.searchTextField.leftView?.tintColor = DesignSystem.Cores.textoSecundario
        return sc
    }()

    /// View exibida quando nenhuma busca tem resultado
    private lazy var emptyStateView: UIView = criarEmptyStateView()

    override func viewDidLoad() {
        super.viewDidLoad()
        obrasFiltradas = todasObras
        setupUI()
        setupNavigationBar()
        atualizarContador()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = false
        // Anima entrada das células
        animarEntradaDaCelulas()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundGradientLayer.frame = view.bounds
        // Recalcula layout ao rotacionar
        collectionView.collectionViewLayout.invalidateLayout()
    }

    private func setupUI() {
        view.backgroundColor = DesignSystem.Cores.fundoPrincipal
        adicionarGradienteDeFundo()

        view.addSubview(headerView)
        headerView.addSubview(subTituloLabel)
        headerView.addSubview(appTituloLabel)
        headerView.addSubview(contadorLabel)

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DesignSystem.Espacamento.margem),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -DesignSystem.Espacamento.margem),

            subTituloLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            subTituloLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            subTituloLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),

            appTituloLabel.topAnchor.constraint(equalTo: subTituloLabel.bottomAnchor, constant: 6),
            appTituloLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            appTituloLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),

            contadorLabel.topAnchor.constraint(equalTo: appTituloLabel.bottomAnchor, constant: 10),
            contadorLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            contadorLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            contadorLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        view.addSubview(emptyStateView)
        emptyStateView.isHidden = true
        NSLayoutConstraint.activate([
            emptyStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupNavigationBar() {
        title = "Artistas Curitibanos"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true

        // Estilo da navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = DesignSystem.Cores.fundoPrincipal
        appearance.titleTextAttributes = [
            .foregroundColor: DesignSystem.Cores.textoPrincipal,
            .font: DesignSystem.Tipografia.tituloApp()
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: DesignSystem.Cores.textoPrincipal,
            .font: DesignSystem.Tipografia.tituloApp()
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = DesignSystem.Cores.laranja
    }

    /// Gradiente de fundo sutil
    private func adicionarGradienteDeFundo() {
        backgroundGradientLayer.colors = [
            UIColor(red: 0.12, green: 0.30, blue: 0.18, alpha: 1).cgColor,
            DesignSystem.Cores.fundoPrincipal.cgColor
        ]
        backgroundGradientLayer.locations = [0, 0.55]
        view.layer.insertSublayer(backgroundGradientLayer, at: 0)
    }

    /// Cria layout adaptativo para iPhone e iPad
    private func criarLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = DesignSystem.Espacamento.margem
        layout.minimumInteritemSpacing = DesignSystem.Espacamento.margem
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: DesignSystem.Espacamento.margem,
            bottom: 0,
            right: DesignSystem.Espacamento.margem
        )
        return layout
    }

    private func atualizarContador() {
        let total = obrasFiltradas.count
        contadorLabel.text = "\(total) obra\(total == 1 ? "" : "s") no catálogo"
    }

    /// Anima entrada das células com stagger
    private func animarEntradaDaCelulas() {
        let celulas = collectionView.visibleCells
        celulas.enumerated().forEach { index, celula in
            celula.alpha = 0
            celula.transform = CGAffineTransform(translationX: 0, y: 30)
            UIView.animate(
                withDuration: 0.5,
                delay: Double(index) * 0.06,
                usingSpringWithDamping: 0.85,
                initialSpringVelocity: 0,
                options: [.allowUserInteraction],
                animations: {
                    celula.alpha = 1
                    celula.transform = .identity
                }
            )
        }
    }

    /// Cria a view de estado vazio (sem resultados)
    private func criarEmptyStateView() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let emoji = UILabel()
        emoji.text = "🎨"
        emoji.font = .systemFont(ofSize: 52)
        emoji.translatesAutoresizingMaskIntoConstraints = false

        let titulo = UILabel()
        titulo.text = "Nenhuma obra encontrada"
        titulo.font = UIFont(name: "Georgia-Italic", size: 18)
        titulo.textColor = DesignSystem.Cores.textoSecundario
        titulo.translatesAutoresizingMaskIntoConstraints = false

        let sub = UILabel()
        sub.text = "Tente outro título, artista ou estilo"
        sub.font = DesignSystem.Tipografia.detalhe()
        sub.textColor = DesignSystem.Cores.verdeClaro
        sub.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(emoji)
        container.addSubview(titulo)
        container.addSubview(sub)

        NSLayoutConstraint.activate([
            emoji.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            emoji.topAnchor.constraint(equalTo: container.topAnchor),
            titulo.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 16),
            titulo.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            sub.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 6),
            sub.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            sub.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        return container
    }
}

extension GaleriaViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obrasFiltradas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let celula = collectionView.dequeueReusableCell(
            withReuseIdentifier: ObraCollectionViewCell.identifier,
            for: indexPath
        ) as? ObraCollectionViewCell else {
            return UICollectionViewCell()
        }
        celula.configurar(com: obrasFiltradas[indexPath.item])
        return celula
    }
}

extension GaleriaViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obra = obrasFiltradas[indexPath.item]
        let detalheVC = DetalheViewController(obra: obra)
        navigationController?.pushViewController(detalheVC, animated: true)
    }

    /// Anima célula ao aparecer no scroll
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 0,
            options: [.allowUserInteraction],
            animations: {
                cell.alpha = 1
                cell.transform = .identity
            }
        )
    }
}

extension GaleriaViewController: UICollectionViewDelegateFlowLayout {

    /// Calcula tamanho da célula responsivo para iPhone e iPad
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let margem = DesignSystem.Espacamento.margem
        let larguraTotal = collectionView.bounds.width - (margem * 2)
        let colunas = max(2, min(4, floor((collectionView.bounds.width + margem) / 210)))
        let espaco = margem * (colunas - 1)
        let largura = (larguraTotal - espaco) / colunas
        let altura = largura * 1.45
        return CGSize(width: largura, height: altura)
    }
}

extension GaleriaViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let termo = searchController.searchBar.text, !termo.isEmpty else {
            obrasFiltradas = todasObras
            emptyStateView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
            atualizarContador()
            return
        }

        let termoNormalizado = normalizarBusca(termo)

        // Filtra por título, artista ou estilo sem diferenciar maiúsculas e acentos.
        obrasFiltradas = todasObras.filter {
            normalizarBusca($0.titulo).contains(termoNormalizado) ||
            normalizarBusca($0.artista).contains(termoNormalizado) ||
            normalizarBusca($0.estilo).contains(termoNormalizado)
        }

        let semResultados = obrasFiltradas.isEmpty
        emptyStateView.isHidden = !semResultados
        collectionView.isHidden = semResultados

        collectionView.reloadData()
        atualizarContador()
    }

    private func normalizarBusca(_ texto: String) -> String {
        return texto.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
    }
}

extension UILabel {
    /// Aplica letter spacing ao texto atual
    func letterSpacing(_ spacing: CGFloat) {
        guard let texto = text else { return }
        let atributos: [NSAttributedString.Key: Any] = [
            .kern: spacing,
            .font: font as Any,
            .foregroundColor: textColor as Any
        ]
        attributedText = NSAttributedString(string: texto, attributes: atributos)
    }
}
