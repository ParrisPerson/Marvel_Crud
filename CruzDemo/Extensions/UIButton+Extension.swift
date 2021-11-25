//
//  UIButton+Extension.swift
//   
//
 
//

import UIKit.UIButton

extension UIButton {
    
    func setStatus(isEnabled: Bool, colors: [UIColor]? = nil) {
        self.isEnabled = isEnabled
        var col = colors
        if col == nil {
            col = [UIColor.mainColor]
        }
        
        self.linearGradientBackground(angleInDegs: 108, colors: col!, radius: self.layer.cornerRadius)
        if self.isEnabled {
            self.alpha = 1
        }
        else {
            self.alpha = 0.5
        }
    }
    
    func setTitleWithActualAttributted(_ title: String, for state: UIButton.State) {
        if let attributed = attributedTitle(for: state) as? NSMutableAttributedString {
            setAttributedTitle(nil, for: state)
            attributed.replaceCharacters(in: NSRange(location: 0, length: attributed.length), with: title)
            setAttributedTitle(attributed, for: state)
        }
    }
    
}

