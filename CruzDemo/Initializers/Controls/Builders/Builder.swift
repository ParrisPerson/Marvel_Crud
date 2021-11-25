//
//  Builder.swift
//  Lendu
//
//   
//

import Foundation

protocol Builder: AnyObject {
    associatedtype TypeBuilder
    var object: TypeBuilder! { get set }
    func build() -> TypeBuilder
}
