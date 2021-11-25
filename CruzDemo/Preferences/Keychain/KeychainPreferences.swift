//
//  KeychainPreferences.swift
//   
//
//   
//

import Foundation

class KeychainPreferences {
    
    static let sharedInstance = KeychainPreferences()
    
    struct KeychainConstants {
        static let sessionTokenName = "sessionToken"
        static let biometricTokenName = "biometricToken"
        static let userIdentName = "userIdent"
    }
    
    static var tokenSession: String? {
        set (tokSess) {
            if tokSess != nil { KeychainWrapper.standard.set(tokSess!, forKey: KeychainConstants.sessionTokenName) }
            else { KeychainWrapper.standard.removeObject(forKey: KeychainConstants.sessionTokenName)}
        }
        get {
            return KeychainWrapper.standard.string(forKey: KeychainConstants.sessionTokenName)
        }
    }
    
    static var tokenBiometric: String? {
        set (tokSess) {
            if tokSess != nil { KeychainWrapper.standard.set(tokSess!, forKey: KeychainConstants.biometricTokenName) }
            else { KeychainWrapper.standard.removeObject(forKey: KeychainConstants.biometricTokenName)}
        }
        get {
            return KeychainWrapper.standard.string(forKey: KeychainConstants.biometricTokenName)
        }
    }
    
    static var userIdent: String? {
        set (userI) {
            if userI != nil { KeychainWrapper.standard.set(userI!, forKey: KeychainConstants.userIdentName) }
            else { KeychainWrapper.standard.removeObject(forKey: KeychainConstants.userIdentName)}
        }
        get {
            return KeychainWrapper.standard.string(forKey: KeychainConstants.userIdentName)
        }
    }
}
