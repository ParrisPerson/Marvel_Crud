//
//  ButtonBuilder.swift
//  Lendu
//
 
//

import UIKit.UIButton

protocol UIButtonBuilder: AnyObject {
    func title(_ title: String, for state: UIControl.State) -> Self
    func titleColor(_ color: UIColor, for state: UIControl.State) -> Self
    func attributedTitle(_ attributedTitle: NSAttributedString, for state: UIControl.State) -> Self
}

class ButtonBuilder<T: UIButton>: Builder, UIButtonBuilder {
    internal var object: UIButton!
    
    init(type: UIButton.ButtonType) {
        object = UIButton(type: type)
        object.translatesAutoresizingMaskIntoConstraints = false
        object.tintColor = .clear
    }
    
    func build() -> UIButton {
        return  object
    }

    @discardableResult
    func title(_ title: String, for state: UIControl.State) -> Self {
        object.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, for state: UIControl.State) -> Self {
        object.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: [UIColor]) -> Self {
        object.backgroundColor = color.first
        return self
    }
    
    @discardableResult
    func cornerRadius(_ corner: CGFloat) -> Self {
        object.layer.cornerRadius = corner
        object.clipsToBounds = true
        return self
    }
    
    @discardableResult
    func attributedTitle(_ attributedTitle: NSAttributedString, for state: UIControl.State) -> Self {
        object.setAttributedTitle(attributedTitle, for: state)
        return self
    }
    
    @discardableResult
    func accessibilityIdentifier(_ identifier: String?) -> Self {
        object.accessibilityIdentifier = identifier
        return self
    }
    
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        object.layer.borderColor = color.cgColor
        object.layer.borderWidth = 1
        object.layer.cornerRadius = 23
        return self
    }
}

