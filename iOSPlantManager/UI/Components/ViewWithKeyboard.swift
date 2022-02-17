//
//  ViewWithKeyboard.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import UIKit
import Combine

struct AnimationInfo {
    enum NotificationKind {
        case willShow
        case willHide
    }
    
    let frame: CGRect
    let duration: Double
    let curve: UIView.AnimationCurve
    let notificationKind: NotificationKind
    
    init?(from userInfo: [AnyHashable: Any], kind: NotificationKind) {
        guard let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return nil
        }
        self.notificationKind = kind
        self.frame = frame
        self.duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.3
        self.curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UIView.AnimationCurve ?? .easeInOut
    }
    
    var keyboardHeight: CGFloat {
        switch notificationKind {
        case .willShow:
            return frame.height
        case .willHide:
            return 0
        }
    }
    
    var animationCurve: UIView.AnimationOptions {
        switch curve {
        case .easeIn:
            return .curveEaseIn
        case .easeOut:
            return .curveEaseOut
        case .easeInOut:
            return .curveEaseInOut
        case .linear:
            return .curveLinear
        @unknown default:
            return .curveEaseInOut
        }
    }
    
    var animationOptions: UIView.AnimationOptions {
        return [self.animationCurve]
    }
}

class ViewWithKeyboard: UIView {
    private var cancellables: Set<AnyCancellable> = []
    let customKeyboardLayoutGuide = UILayoutGuide()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addLayoutGuide(customKeyboardLayoutGuide)
        
        NSLayoutConstraint.activate([
            customKeyboardLayoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            customKeyboardLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            customKeyboardLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            customKeyboardLayoutGuide.heightAnchor.constraint(equalToConstant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupKeyboardBinding() {
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillShowNotification)
            .sink { notification in
                self.handleKeyboardUpdate(with: notification, notificationKind: .willShow)
            }
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillHideNotification)
            .sink { notification in
                self.handleKeyboardUpdate(with: notification, notificationKind: .willHide)
            }
            .store(in: &cancellables)
    }
    
    fileprivate func handleKeyboardUpdate(
        with notification: NotificationCenter.Publisher.Output,
        notificationKind: AnimationInfo.NotificationKind
    ) {
        guard
            let userInfo = notification.userInfo,
            let animation = AnimationInfo(from: userInfo, kind: notificationKind)
        else {
            return
        }
        
        let constraint = self.customKeyboardLayoutGuide.constraintsAffectingLayout(for: .vertical).first {
            $0.firstAttribute == .height
        }
        
        constraint?.constant = animation.keyboardHeight
        
        setNeedsLayout()
        
        UIView.animate(withDuration: animation.duration, delay: 0, options: animation.animationOptions) {
            self.layoutIfNeeded()
        }
    }
}

