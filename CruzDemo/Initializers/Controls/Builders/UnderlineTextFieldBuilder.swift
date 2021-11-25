//
//  UnderlineTextFieldBuilder.swift
//  Lendu
//
 
//

import UIKit.UITextField

protocol UITextFieldBuilder: AnyObject {
    func placeholder(_ text: String) -> Self
    func tintColor(_ color: UIColor) -> Self
    func isSecureText(_ isSecure: Bool) -> Self
    func isSecurePinCode(_ isSecure: Bool) -> Self
    func keyboardType(_ type: UIKeyboardType) -> Self
    func textAligment(_ textAligment: NSTextAlignment) -> Self
    func font(_ font: UIFont) -> Self
    func icon(_ icon: UIImage?) -> Self
}

class UnderLineTextFieldBuilder<T: UnderlineTextField>: Builder, UITextFieldBuilder {
    var object: UnderlineTextField!
    
    init(frame: CGRect, validateExpressions: [String: String]?) {
        object = UnderlineTextField(frame: frame, validateExpressions: validateExpressions)
        object.autocapitalizationType = .none
        object.autocorrectionType = .no
        object.clearButtonMode = .whileEditing
        object.translatesAutoresizingMaskIntoConstraints = false
        object.returnKeyType = .continue
    }
    
    convenience init(frame: CGRect) {
        self.init(frame: frame, validateExpressions: nil)
    }
    
    func build() -> UnderlineTextField {
        return object
    }
    
    @discardableResult
    func placeholder(_ text: String) -> Self {
        object.placeholder = text
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        object.tintColor = color
        return self
    }
    
    @discardableResult
    func isSecureText(_ isSecure: Bool) -> Self {
        if isSecure == true {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "passHideIcon"), for: .selected)
            button.setImage(UIImage(named: "passShowIcon"), for: .normal)
            button.alpha = 0.4
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            if #available(iOS 13, *) {
                button.frame = CGRect(x: CGFloat(object.frame.size.width - 16), y: CGFloat(5), width: CGFloat(16), height: CGFloat(16))
            }
            else {
                button.frame = CGRect(x: CGFloat(object.frame.size.width - 32), y: CGFloat(5), width: CGFloat(32), height: CGFloat(32))
            }
            button.addTarget(object, action: #selector(self.togglePassword), for: .touchUpInside)
            object.rightView = button
            object.rightViewMode = .always
        }
        object.isSecureTextEntry = isSecure
        return self
    }
    
    @discardableResult
    func addIcon(_ icon: UIImage) -> Self {
        let button = UIButton(type: .custom)
        button.setImage(icon, for: .normal)
        button.alpha = 0.4
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        if #available(iOS 13, *) {
            button.frame = CGRect(x: CGFloat(object.frame.size.width - 16), y: CGFloat(5), width: CGFloat(16), height: CGFloat(16))
        }
        else {
            button.frame = CGRect(x: CGFloat(object.frame.size.width - 32), y: CGFloat(5), width: CGFloat(32), height: CGFloat(32))
        }
        button.isEnabled = false
        object.rightView = button
        object.rightViewMode = .always
        return self
    }
    
    @discardableResult
    func isSecurePinCode(_ isSecure: Bool) -> Self {
        object.isSecureTextEntry = isSecure
        return self
    }
    
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        object.keyboardType = type
        return self
    }
    
    @discardableResult
    func textAligment(_ textAligment: NSTextAlignment) -> Self {
        object.textAlignment = textAligment
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        object.font = font
        return self
    }
    
    @discardableResult
    func icon(_ icon: UIImage?) -> Self {
        object.icon = icon
        return self
    }
    
    @discardableResult
    func accessibilityIdentifier(_ identifier: String) -> Self {
        object.accessibilityIdentifier = identifier
        return self
    }
    
    @IBAction func togglePassword(_ sender: Any) {
        object.isSecureTextEntry = !object.isSecureTextEntry
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
    }
}

