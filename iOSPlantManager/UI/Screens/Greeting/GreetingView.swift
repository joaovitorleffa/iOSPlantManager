//
//  WelcomeView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import UIKit

class GreetingView: UIView {
    let contentStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .titleLarge
        $0.textColor = .heading
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "Gerencie suas plantas de forma fácil"
        return $0
    }(UILabel())
    
    let imageView: UIImageView = {
        $0.image = UIImage(named: "greeting")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let descriptionLabel: UILabel = {
        $0.font = .headingLarge
        $0.textColor = .body
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "Não esqueça mais de regar suas plantas. Nós cuidamos de lembrar você sempre que precisar."
        return $0
    }(UILabel())
    
    let nextButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 16
        $0.tintColor = .white
        $0.backgroundColor = .green
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .shape
    }
}

extension GreetingView: ViewCode {
    func buildViewHierarchy() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(nextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 42),
            contentStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            nextButton.widthAnchor.constraint(equalToConstant: 56),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
