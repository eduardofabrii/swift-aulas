import UIKit

/// Tela de detalhes de uma obra de arte selecionada
class DetalheViewController: UIViewController {

    private let obra: ObraDeArte

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// Imagem principal da obra — ocupa parte superior da tela
    private let imagemView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    /// Gradiente sobre a imagem para transição suave
    private let gradienteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()

    /// Card de informações flutuante sobre a imagem
    private let infoCard: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Cores.fundoCelula
        view.layer.cornerRadius = DesignSystem.Borda.grande
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.shadowColor = DesignSystem.Cores.laranja.cgColor
        view.layer.shadowOpacity = 0.16
        view.layer.shadowOffset = CGSize(width: 0, height: -4)
        view.layer.shadowRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// Linha decorativa laranja
    private let linhaDourada: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Cores.laranja
        view.layer.cornerRadius = 1.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tituloLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia-Italic", size: 26) ?? UIFont.italicSystemFont(ofSize: 26)
        label.textColor = DesignSystem.Cores.textoPrincipal
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let artistaLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystem.Tipografia.nomeArtista()
        label.textColor = DesignSystem.Cores.laranja
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Separador horizontal
    private let separador: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Cores.separador
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// Stack de metadados (ano + estilo)
    private let metaStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 16
        sv.alignment = .top
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let descricaoLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystem.Tipografia.corpo()
        label.textColor = DesignSystem.Cores.textoSecundario
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Botão de compartilhamento
    private lazy var compartilharButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Compartilhar"
        config.image = UIImage(systemName: "square.and.arrow.up")
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.baseBackgroundColor = DesignSystem.Cores.laranja
        config.baseForegroundColor = DesignSystem.Cores.fundoPrincipal
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 24, bottom: 14, trailing: 24)

        let btn = UIButton(configuration: config)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.addTarget(self, action: #selector(compartilharObra), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    init(obra: ObraDeArte) {
        self.obra = obra
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        popularDados()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animarEntrada()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adicionarGradienteNaImagem()
    }

    private func setupUI() {
        view.backgroundColor = DesignSystem.Cores.fundoPrincipal
        setupNavBar()

        view.addSubview(imagemView)
        imagemView.addSubview(gradienteView)

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(infoCard)
        infoCard.addSubview(linhaDourada)
        infoCard.addSubview(tituloLabel)
        infoCard.addSubview(artistaLabel)
        infoCard.addSubview(separador)
        infoCard.addSubview(metaStack)
        infoCard.addSubview(descricaoLabel)
        infoCard.addSubview(compartilharButton)

        // Popula a stack de metadados
        metaStack.addArrangedSubview(criarMetaItem(icone: "calendar", valor: String(obra.ano), rotulo: "Ano"))
        metaStack.addArrangedSubview(criarMetaItem(icone: "paintpalette", valor: obra.estilo, rotulo: "Estilo"))

        setupConstraints()
    }

    private func setupNavBar() {
        title = ""
        navigationController?.navigationBar.tintColor = DesignSystem.Cores.laranja

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    private func setupConstraints() {
        let alturaImagem: CGFloat = UIScreen.main.bounds.height * 0.45
        let sobreposicao: CGFloat = 28 // card sobe sobre a imagem

        NSLayoutConstraint.activate([
            // Imagem
            imagemView.topAnchor.constraint(equalTo: view.topAnchor),
            imagemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imagemView.heightAnchor.constraint(equalToConstant: alturaImagem),

            // Gradiente sobre imagem
            gradienteView.topAnchor.constraint(equalTo: imagemView.topAnchor),
            gradienteView.leadingAnchor.constraint(equalTo: imagemView.leadingAnchor),
            gradienteView.trailingAnchor.constraint(equalTo: imagemView.trailingAnchor),
            gradienteView.bottomAnchor.constraint(equalTo: imagemView.bottomAnchor),

            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Content view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Info card começa próximo ao fim da imagem
            infoCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: alturaImagem - sobreposicao),
            infoCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            // Linha dourada
            linhaDourada.topAnchor.constraint(equalTo: infoCard.topAnchor, constant: 24),
            linhaDourada.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: DesignSystem.Espacamento.margemGrande),
            linhaDourada.widthAnchor.constraint(equalToConstant: 32),
            linhaDourada.heightAnchor.constraint(equalToConstant: 3),

            // Título
            tituloLabel.topAnchor.constraint(equalTo: linhaDourada.bottomAnchor, constant: 12),
            tituloLabel.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: DesignSystem.Espacamento.margemGrande),
            tituloLabel.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -DesignSystem.Espacamento.margemGrande),

            // Artista
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 6),
            artistaLabel.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: DesignSystem.Espacamento.margemGrande),
            artistaLabel.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -DesignSystem.Espacamento.margemGrande),

            // Separador
            separador.topAnchor.constraint(equalTo: artistaLabel.bottomAnchor, constant: 20),
            separador.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: DesignSystem.Espacamento.margemGrande),
            separador.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -DesignSystem.Espacamento.margemGrande),
            separador.heightAnchor.constraint(equalToConstant: 1),

            // Meta stack
            metaStack.topAnchor.constraint(equalTo: separador.bottomAnchor, constant: 16),
            metaStack.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: DesignSystem.Espacamento.margemGrande),
            metaStack.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -DesignSystem.Espacamento.margemGrande),

            // Descrição
            descricaoLabel.topAnchor.constraint(equalTo: metaStack.bottomAnchor, constant: 24),
            descricaoLabel.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: DesignSystem.Espacamento.margemGrande),
            descricaoLabel.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -DesignSystem.Espacamento.margemGrande),

            // Botão compartilhar
            compartilharButton.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 32),
            compartilharButton.centerXAnchor.constraint(equalTo: infoCard.centerXAnchor),
            compartilharButton.bottomAnchor.constraint(equalTo: infoCard.bottomAnchor, constant: -40)
        ])
    }

    private func popularDados() {
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista.uppercased()
        artistaLabel.letterSpacing(1.8)
        descricaoLabel.text = obra.descricao

        // Configura line height do texto de descrição
        let paragrafo = NSMutableParagraphStyle()
        paragrafo.lineSpacing = 6
        let atributos: [NSAttributedString.Key: Any] = [
            .font: DesignSystem.Tipografia.corpo(),
            .foregroundColor: DesignSystem.Cores.textoSecundario,
            .paragraphStyle: paragrafo
        ]
        descricaoLabel.attributedText = NSAttributedString(string: obra.descricao, attributes: atributos)

        // Imagem
        if let imagem = UIImage(named: obra.imagemNome) {
            imagemView.image = imagem
        } else {
            imagemView.backgroundColor = UIColor(white: 0.15, alpha: 1)
            imagemView.image = criarPlaceholderDetalhes()
        }
    }

    private func criarPlaceholderDetalhes() -> UIImage {
        let tamanho = CGSize(width: 400, height: 300)
        let renderer = UIGraphicsImageRenderer(size: tamanho)
        return renderer.image { ctx in
            let hue = CGFloat(abs(obra.artista.hashValue) % 100) / 100.0
            UIColor(hue: hue * 0.12 + 0.24, saturation: 0.52, brightness: 0.24, alpha: 1).setFill()
            ctx.fill(CGRect(origin: .zero, size: tamanho))

            DesignSystem.Cores.laranja.withAlphaComponent(0.28).setFill()
            ctx.cgContext.fillEllipse(in: CGRect(x: tamanho.width * 0.60, y: -42, width: 170, height: 170))

            let iniciais = obra.artista.components(separatedBy: " ")
                .compactMap { $0.first }
                .prefix(2)
                .map { String($0) }
                .joined()

            let atributos: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Georgia-Bold", size: 80) ?? UIFont.boldSystemFont(ofSize: 80),
                .foregroundColor: UIColor(white: 1, alpha: 0.10)
            ]
            let texto = NSAttributedString(string: iniciais, attributes: atributos)
            let tamanhoTexto = texto.size()
            texto.draw(at: CGPoint(
                x: (tamanho.width - tamanhoTexto.width) / 2,
                y: (tamanho.height - tamanhoTexto.height) / 2
            ))
        }
    }

    private func adicionarGradienteNaImagem() {
        gradienteView.layer.sublayers?.removeAll()
        let gradiente = CAGradientLayer()
        gradiente.frame = gradienteView.bounds
        gradiente.colors = [
            UIColor.black.withAlphaComponent(0.15).cgColor,
            DesignSystem.Cores.fundoCelula.cgColor
        ]
        gradiente.locations = [0.5, 1.0]
        gradienteView.layer.addSublayer(gradiente)
    }

    /// Cria um item de metadado (ícone + valor + rótulo)
    private func criarMetaItem(icone: String, valor: String, rotulo: String) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let iconView = UIImageView(image: UIImage(systemName: icone))
        iconView.tintColor = DesignSystem.Cores.laranja
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false

        let rotuloLabel = UILabel()
        rotuloLabel.text = rotulo.uppercased()
        rotuloLabel.font = DesignSystem.Tipografia.secao()
        rotuloLabel.textColor = DesignSystem.Cores.textoSecundario
        rotuloLabel.translatesAutoresizingMaskIntoConstraints = false

        let valorLabel = UILabel()
        valorLabel.text = valor
        valorLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        valorLabel.textColor = DesignSystem.Cores.textoPrincipal
        valorLabel.numberOfLines = 0
        valorLabel.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(iconView)
        container.addSubview(rotuloLabel)
        container.addSubview(valorLabel)

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: container.topAnchor),
            iconView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 16),
            iconView.heightAnchor.constraint(equalToConstant: 16),
            rotuloLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            rotuloLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 6),
            valorLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 4),
            valorLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            valorLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            valorLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])

        return container
    }
    
    /// Anima entrada dos elementos do card
    private func animarEntrada() {
        let elementos: [UIView] = [linhaDourada, tituloLabel, artistaLabel, separador, metaStack, descricaoLabel, compartilharButton]
        elementos.enumerated().forEach { index, view in
            view.alpha = 0
            view.transform = CGAffineTransform(translationX: 0, y: 16)
            UIView.animate(
                withDuration: 0.5,
                delay: 0.15 + Double(index) * 0.07,
                usingSpringWithDamping: 0.88,
                initialSpringVelocity: 0,
                options: [],
                animations: {
                    view.alpha = 1
                    view.transform = .identity
                }
            )
        }
    }

    /// Abre UIActivityViewController para compartilhar a obra
    @objc private func compartilharObra() {
        let mensagem = "Conheça \"\(obra.titulo)\", de \(obra.artista). Descubra mais artistas curitibanos no app Arte de Curitiba."
        let vc = UIActivityViewController(activityItems: [mensagem], applicationActivities: nil)

        // Suporte para iPad (necessário para não crashar)
        if let popover = vc.popoverPresentationController {
            popover.sourceView = compartilharButton
            popover.sourceRect = compartilharButton.bounds
        }

        // Animação no botão ao compartilhar
        UIView.animate(withDuration: 0.1, animations: {
            self.compartilharButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.compartilharButton.transform = .identity
            }
        }

        present(vc, animated: true)
    }
}
