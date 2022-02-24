//
//  PopUpConfirmationView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import UIKit
import SnapKit

class PopUpConfirmationView: UIView {
    let container: UIView = {
        $0.backgroundColor = .background
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        return $0
    }(UIView())
    
    let stack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        return $0
    }(UIStackView())
    
    let imageWrapperView: UIView = {
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        $0.backgroundColor = .shape
        return $0
    }(UIView())

    let imageView: UIImageView = {
        $0.contentMode = .center
        return $0
    }(UIImageView())
    
    let messageLabel: UILabel = {
        $0.textColor = .heading
        $0.font = .headingLarge
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    let footerStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    let cancelBtn: ButtonSecondary = {
        $0.configure(with: .init(text: "Cancelar", variant: .normal))
        return $0
    }(ButtonSecondary())
    
    let deleteBtn: ButtonSecondary = {
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
        container.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.45)
        }
        
        stack.snp.makeConstraints { make in
            make.leading.top.equalTo(container).offset(32)
            make.center.equalToSuperview()
        }
        
        imageWrapperView.snp.makeConstraints { make in
            make.size.equalTo(120)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.centerX.leading.top.equalTo(imageWrapperView)
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.width.equalTo(96)
        }
        
        deleteBtn.snp.makeConstraints { make in
            make.width.equalTo(96)
        }
    }
}

protocol PopUpConfimationViewDelegate: AnyObject {
    func onDelete(id: Int)
}

class PopUpConfirmationViewController: BaseViewController<PopUpConfirmationView> {
    weak var delegate: PopUpConfimationViewDelegate?
    
    private var id: Int
    
    init(imageUrl: String, message: NSAttributedString, id: Int) {
        self.id = id
        
        super.init()
        
        customView.imageView.loadImage(from: imageUrl)
        customView.messageLabel.attributedText = message
        customView.deleteBtn.addTarget(self, action: #selector(onDelete), for: .touchUpInside)
        customView.cancelBtn.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func onCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func onDelete() {
        delegate?.onDelete(id: id)
        self.dismiss(animated: true, completion: nil)
    }
}
