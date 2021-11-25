//
//  CommonControls.swift
//   
//
//   
//

import UIKit

/// This class is a helper to generate controls that are repeated throughout the project with the same properties
final class CommonControls {
    
    /// Called for generate an UIImageView
    /// - Parameters:
    ///   - image: the image that the image view contains
    ///   - contentMode: the content mode
    /// - Returns: UIButton
    static func generateImageView(with image: UIImage?, contentMode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = contentMode
        return imageView
    }
    
    /// Called for generate an UITableView
    /// - Parameters:
    ///   - style: the style for the table view
    ///   - cellClass: the cell type for register
    ///   - identifier: identifier for reusable cell
    /// - Returns: UIButton
    static func generateTableView(style: UITableView.Style, cellClass: AnyClass, identifier: String) -> UITableView {
        
        let tableView = UITableView(frame: .zero, style: style)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cellClass, forCellReuseIdentifier: identifier)
        return tableView
    }
    
    /// Called for generate a button with the main style
    /// - Parameters:
    ///   - color: color for the background
    ///   - title: the text for the button label
    ///   - titleColor: the color for the label title
    /// - Returns: UIButton
    static func generateButton(withBackgroundColor colors: [UIColor], title: String, titleColor: UIColor,
                               accessibilityIdentifier: String? = nil) -> UIButton {
        return ButtonBuilder(type: .system)
            .backgroundColor(colors)
            .cornerRadius(23)
            .accessibilityIdentifier(accessibilityIdentifier)
            .attributedTitle(NSMutableAttributedString(string: title, attributes:
                                                    [
                                                        NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 16)!,
                                                        NSAttributedString.Key.foregroundColor: titleColor
                                                    ]), for: .normal)
            .build()
        
    }
    
    static func generateBorderButton(withBackgroundColor color: UIColor, title: String, titleColor: UIColor,
                               accessibilityIdentifier: String? = nil) -> UIButton {
        ButtonBuilder(type: .system)
            .backgroundColor([.clear])
            .borderColor(color)
            .cornerRadius(23)
            .accessibilityIdentifier(accessibilityIdentifier)
            .attributedTitle(NSMutableAttributedString(string: title, attributes:
                                                    [
                                                        NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 16)!,
                                                        NSAttributedString.Key.foregroundColor: titleColor
                                                    ]), for: .normal)
            .build()
    }
    
    /// Called for the  generate a button without  background  color
    /// - Parameters:
    ///   - title: the text for the buttono label
    ///   - titleColor: the color for the label title
    /// - Returns: UIButton
    static func generateButton(for title: String, accessibilityIdentifier: String? = nil, titleColor: UIColor) -> UIButton {
        ButtonBuilder(type: .system)
            .titleColor(titleColor, for: .normal)
            .attributedTitle(NSAttributedString(string: title,
                                                attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Bold", size: 14)!]),
                             for: .normal)
            .build()
    }
    
    /// Called for the  generate a label with a bold font size 30
    /// - Parameter:  the text for thee label
    /// - Returns: UILabel
    static func generateTitleLabel(with text: String = String.empty) -> UILabel {
        LabelBuilder(frame: .zero)
            .text(text)
            .textColor(.mainBlack)
            .font(UIFont(name: "OpenSans-Bold", size: 20)!)
            .build()
    }
    
    /// Called for the  generate a label with a font size 16
    /// - Parameter:  the text for thee label
    /// - Returns: UILabel
    static func generateInfoLabel(with text: String) -> UILabel {
        LabelBuilder(frame: .zero)
            .text(text)
            .textColor(.middleBlack)
            .font(UIFont(name: "OpenSans-Regular", size: 14)!)
            .build()
    }
}
