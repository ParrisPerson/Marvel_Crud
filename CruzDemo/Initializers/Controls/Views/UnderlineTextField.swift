//
//  UnderlineTextField.swift
//   
//
//   
//

import UIKit

protocol UnderLineTextFieldDelegate: UITextFieldDelegate {
    func textFieldBackward(_ textField: UnderlineTextField)
}

class UnderlineTextField: UITextField {
    private weak var textChangedDelegate: UnderLineTextFieldDelegate?
    private var previousValue: String?
    private var _icon: UIImage?
    private var padding: UIEdgeInsets!
    var placeholderColorWithText: UIColor?
    var placeholderColorWithoutText: UIColor?
    var validateExpression: [String: String]?
    
    private let infoLabel: UILabel = {
        return LabelBuilder(frame: .zero)
            .font(UIFont(name: "OpenSans-Regular", size: 12)!)
            .textColor(.red)
            .build()
    }()
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        return imageView
    }()
    
    private let bottomLine: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    var placeholderColor: UIColor? {
        didSet {
            updatePlaceHolderAttributed()
        }
    }
    
    var icon: UIImage? {
        get { return _icon }
        set {
            _icon = newValue
            let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 17))
            self.iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 17, height: 17))
            self.iconImageView.image = _icon
            self.iconImageView.contentMode = .scaleAspectFit
            iconContainer.addSubview(self.iconImageView)
            self.leftViewMode = .always
            self.leftView = iconContainer
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        if icon == nil {
          return bounds
        }
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0))
    }
    
    convenience init(frame: CGRect, validateExpressions: [String: String]?) {
        self.init(frame: frame)
        self.validateExpression = validateExpressions
    }
    
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
        validateExpression = [String: String]()
        updateUnderline(height: 1)
        layer.addSublayer(bottomLine)
        addSubview(infoLabel)
        infoLabel.alpha = 0
        updatePlaceHolderAttributed()
        self.font = UIFont(name: "OpenSans-Regular", size: 16)!
        
        /*NotificationCenter.default.addObserver(self, selector: #selector(UnderlineTextField.displayPlaceholderIfNeeded),
                                               name: UITextField.textDidEndEditingNotification, object: self)*/
    }
    
    @objc private func displayPlaceholderIfNeeded(_: NSNotification) {
        if self.previousValue != self.text {
            self.updatePlaceHolderAttributed()
        }
        
        self.previousValue = self.text
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUnderline(height: 1)
        updateErrorLabel()
    }
    
    private func updatePlaceHolderAttributed() {
        let attributeString = [NSAttributedString.Key.foregroundColor: placeholderColor ?? UIColor.lightGray]
        self.attributedPlaceholder = NSAttributedString(string: placeholder ?? String.empty, attributes: attributeString)
        self.bottomLine.backgroundColor = placeholderColor?.cgColor ?? UIColor.lightGray.cgColor
        
        if let text = text, text.count > 0 {
            self.bottomLine.backgroundColor = self.tintColor.cgColor
        } else {
            self.bottomLine.backgroundColor = placeholderColor?.cgColor ?? UIColor.lightGray.cgColor
        }
    }
    
    public func updateUnderlineColor(with color: UIColor, height: CGFloat) {
        self.updateUnderline(height: height)
        bottomLine.backgroundColor = color.cgColor
    }
    
    private func updateUnderline(height: CGFloat) {
        bottomLine.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
    }
    
    private func updateErrorLabel() {
        infoLabel.frame = CGRect(x: 0, y: -5, width: frame.width, height: 12)
    }
    
    public func setInfoLabel(with message: String, color: UIColor) {
        infoLabel.text = message
        infoLabel.textColor = color
    
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.infoLabel.alpha = 1
        }, completion: nil)
    }
    
    func removeInfoLabel() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.infoLabel.alpha = 0
        }, completion: {_ in self.infoLabel.text = String.empty})
    }
    
    public func updateDesign() {
        if self.text!.count > 0 {
            setInfoLabel(with: self.placeholder!, color: self.tintColor)
            updateUnderlineColor(with: self.tintColor, height: 2)
        }
        else {
            removeInfoLabel()
            updateUnderlineColor(with: self.placeholderColor ?? UIColor.lightGray, height: 1)
        }
    }
    
    @discardableResult
    public func validate(withMessage: Bool = false) -> Bool {
        guard let expression = validateExpression else {return true}
        var passCount = 0
        for (key, value) in expression {
            let predicate = NSPredicate(format: "SELF MATCHES %@", value)
            if text?.count != 0 && !predicate.evaluate(with: text!) {
                if withMessage && passCount == 0 {
                    self.infoLabel.text = String.empty
                    setInfoLabel(with: key, color: UIColor.errorColor)
                    self.updateUnderlineColor(with: UIColor.errorColor, height: 2)
                }
            } else {
                passCount += 1
            }
        }
        if passCount > 0 { // Status
            //removeInfoLabel()
        }
        return passCount > 0 && text?.count != 0
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        guard let delegate = self.delegate as? UnderLineTextFieldDelegate else {return}
        delegate.textFieldBackward(self)
    }
    
    struct CommonExpressions {
        public static let generic = #"^(?!\s*$)[a-zA-ZA-Za-zÀ-ÖØ-öø-ÿ0-9\.\-\s]{1,}$"#
        public static let genericNumber = #"^[0-9]{1,}$"#
        public static let email = #"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"#
        public static let password = #"(?=^.{8,15}$)(?=.*\d)(?=.*\W?)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"#
        public static let phone = #"\+?[0-9]{10,15}$"#
    }
    
    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(select(_:)) || action == #selector(selectAll(_:)) {
            return true
        }

        return false
    }
    
    @IBAction func togglePassword(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
    }
}

// MARK: UnderLineTextFieldDelegate
extension UnderLineTextFieldDelegate {
    func textFieldBackward(_ textField: UnderlineTextField) {
        //This method is called when the user press the delete button on the keyboard
    }
}

