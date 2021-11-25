//
//  String+Extension.swift
//  Lendu
//
//   
//

import Foundation
import UIKit

extension String {
    
    static let empty = ""
    static let platform = "ios"
    static let productionEnv = "production"
    static let initialDate = "1970-01-01"
    
    static func getLocalizable(_ from: AnyClass, for key: String) -> String {
        NSLocalizedString("\(String(describing: from)).\(key)", comment: String.empty)
    }
    
    static func getLocalizable(_ key: String) -> String {
        NSLocalizedString(key, comment: String.empty)
    }
    
}
