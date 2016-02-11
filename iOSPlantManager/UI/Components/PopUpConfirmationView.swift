//
//  PopUpConfirmationView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import UIKit

class PopUpConfirmationView: UIView {
    let container: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .background
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        return $0
    }(UIView())
    
    let stack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        return $0
    }(UIStackView())
    
    let imageWrapperView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        $0.backgroundColor = .shape
        return $0
    }(UIView())

    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let messageLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .heading
        $0.font = .headingLarge
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    let footerStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    let cancelBtn: ButtonSecondary = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configure(with: .init(text: "Cancelar", variant: .normal))
        return $0
    }(ButtonSecondary())
    
    let deleteBtn: ButtonSecondary = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configure(with: .init(text: "Deletar", variant: .danger))
        return $0
    }(ButtonSecondary())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopUpConfirmationView: ViewCode {
    func buildViewHierarchy() {
        addSubview(container)
        container.addSubview(stack)
        stack.addArrangedSubview(imageWrapperView)
        stack.addArrangedSubview(messageLabel)
        stack.addArrangedSubview(footerStack)
        footerStack.addArrangedSubview(cancelBtn)
        footerStack.addArrangedSubview(deleteBtn)
        imageWrapperView.addSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45),
            
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 32),
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            imageWrapperView.heightAnchor.constraint(equalToConstant: 120),
            imageWrapperView.widthAnchor.constraint(equalToConstant: 120),
            imageView.leadingAnchor.constraint(equalTo: imageWrapperView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: imageWrapperView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageWrapperView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageWrapperView.centerYAnchor),
            
            cancelBtn.widthAnchor.constraint(equalToConstant: 96),
            deleteBtn.widthAnchor.constraint(equalToConstant: 96)
        ])
    }
}


class PopUpConfirmationViewController: BaseViewController<PopUpConfirmationView> {
    init(imageUrl: String, message: String) {
        super.init()
        customView.imageView.loadImage(from: imageUrl)
        customView.messageLabel.text = message
        customView.deleteBtn.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
        customView.cancelBtn.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func onCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
