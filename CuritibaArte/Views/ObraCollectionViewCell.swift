import UIKit

/// Célula customizada para exibir uma obra de arte na grade
class ObraCollectionViewCell: UICollectionViewCell {

    static let identifier = "ObraCollectionViewCell"

    // MARK: - Subviews

    /// Container com sombra
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Cores.fundoCelula
        view.layer.cornerRadius = DesignSystem.Borda.medio
        view.clipsToBounds = false
        view.layer.shadowColor = DesignSystem.Cores.laranja.cgColor
        view.layer.shadowOpacity = 0.18
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// Imagem da obra com clipping
    private let imagemView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = DesignSystem.Borda.medio
        iv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        iv.backgroundColor = UIColor(white: 0.15, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    /// Overlay gradiente sutil na imagem
    private let gradienteOverlay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()

    /// Container das infos textuais
    private let infoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// Título da obra
    private let tituloLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystem.Tipografia.tituloObra()
        label.textColor = DesignSystem.Cores.textoPrincipal
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Nome do artista
    private let artistaLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystem.Tipografia.nomeArtista()
        label.textColor = DesignSystem.Cores.laranja
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// Linha decorativa laranja
    private let linhaDourada: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Cores.laranja
        view.layer.cornerRadius = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        contentView.addSubview(containerView)
        containerView.addSubview(imagemView)
        imagemView.addSubview(gradienteOverlay)
        containerView.addSubview(infoContainer)
        infoContainer.addSubview(linhaDourada)
        infoContainer.addSubview(tituloLabel)
        infoContainer.addSubview(artistaLabel)

        NSLayoutConstraint.activate([
            // Container
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

            // Imagem — ocupa 68% da altura
            imagemView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imagemView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imagemView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imagemView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.65),

            // Overlay cobre toda a imagem
            gradienteOverlay.topAnchor.constraint(equalTo: imagemView.topAnchor),
            gradienteOverlay.leadingAnchor.constraint(equalTo: imagemView.leadingAnchor),
            gradienteOverlay.trailingAnchor.constraint(equalTo: imagemView.trailingAnchor),
            gradienteOverlay.bottomAnchor.constraint(equalTo: imagemView.bottomAnchor),

            // Info container
            infoContainer.topAnchor.constraint(equalTo: imagemView.bottomAnchor),
            infoContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            infoContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            // Linha dourada
            linhaDourada.topAnchor.constraint(equalTo: infoContainer.topAnchor, constant: 12),
            linhaDourada.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 12),
            linhaDourada.widthAnchor.constraint(equalToConstant: 20),
            linhaDourada.heightAnchor.constraint(equalToConstant: 2),

            // Título
            tituloLabel.topAnchor.constraint(equalTo: linhaDourada.bottomAnchor, constant: 8),
            tituloLabel.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 12),
            tituloLabel.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor, constant: -8),

            // Artista
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 4),
            artistaLabel.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 12),
            artistaLabel.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor, constant: -8),
            artistaLabel.bottomAnchor.constraint(lessThanOrEqualTo: infoContainer.bottomAnchor, constant: -12)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        adicionarGradiente()
        containerView.layer.shadowPath = UIBezierPath(
            roundedRect: containerView.bounds,
            cornerRadius: DesignSystem.Borda.medio
        ).cgPath
    }

    /// Adiciona gradiente sutil na base da imagem para legibilidade
    private func adicionarGradiente() {
        gradienteOverlay.layer.sublayers?.removeAll()
        let gradiente = CAGradientLayer()
        gradiente.frame = gradienteOverlay.bounds
        gradiente.colors = [
            UIColor.clear.cgColor,
            DesignSystem.Cores.fundoPrincipal.withAlphaComponent(0.45).cgColor
        ]
        gradiente.locations = [0.5, 1.0]
        gradienteOverlay.layer.addSublayer(gradiente)
    }
    
    /// Popula a célula com dados de uma obra de arte
    func configurar(com obra: ObraDeArte) {
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista.uppercased()

        // Tenta carregar imagem do Assets; usa placeholder se não existir
        if let imagem = UIImage(named: obra.imagemNome) {
            imagemView.image = imagem
        } else {
            imagemView.image = criarPlaceholder(para: obra)
        }
    }

    /// Cria uma imagem placeholder baseada nas iniciais do artista
    private func criarPlaceholder(para obra: ObraDeArte) -> UIImage {
        let tamanho = CGSize(width: 300, height: 200)
        let renderer = UIGraphicsImageRenderer(size: tamanho)
        return renderer.image { ctx in
            // Fundo com cor baseada no hash do nome
            let hue = CGFloat(abs(obra.artista.hashValue) % 100) / 100.0
            UIColor(hue: hue * 0.12 + 0.24, saturation: 0.50, brightness: 0.24, alpha: 1).setFill()
            ctx.fill(CGRect(origin: .zero, size: tamanho))

            DesignSystem.Cores.laranja.withAlphaComponent(0.26).setFill()
            ctx.cgContext.fillEllipse(in: CGRect(x: tamanho.width * 0.58, y: -36, width: 130, height: 130))

            // Iniciais centralizadas
            let iniciais = obra.artista.components(separatedBy: " ")
                .compactMap { $0.first }
                .prefix(2)
                .map { String($0) }
                .joined()

            let atributos: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Georgia-Bold", size: 48) ?? UIFont.boldSystemFont(ofSize: 48),
                .foregroundColor: UIColor(white: 1, alpha: 0.15)
            ]
            let texto = NSAttributedString(string: iniciais, attributes: atributos)
            let tamanhoTexto = texto.size()
            let origem = CGPoint(
                x: (tamanho.width - tamanhoTexto.width) / 2,
                y: (tamanho.height - tamanhoTexto.height) / 2
            )
            texto.draw(at: origem)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animarToque(selecionado: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animarToque(selecionado: false)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animarToque(selecionado: false)
    }

    /// Animação sutil de escala ao tocar
    private func animarToque(selecionado: Bool) {
        UIView.animate(
            withDuration: 0.18,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [.allowUserInteraction],
            animations: {
                self.transform = selecionado
                    ? CGAffineTransform(scaleX: 0.95, y: 0.95)
                    : .identity
                self.containerView.layer.shadowOpacity = selecionado ? 0.08 : 0.18
            }
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imagemView.image = nil
        tituloLabel.text = nil
        artistaLabel.text = nil
        transform = .identity
        containerView.layer.shadowOpacity = 0.18
    }
}
