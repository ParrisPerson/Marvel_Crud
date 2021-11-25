//
//  UserPreferences.swift
//   
//
//   
//

import Foundation

class UserPreferences {
    struct Keys {
        static let biometricLogin = "biometricLogin"
        static let maintainSession = "maintainSession"
    }
    
    static func set(_ value: Any?, forKey: String) {
        UserDefaults.standard.setValue(value, forKey: forKey)
    }
    
    static func get<Type>(defaultValue: Type?, forKey: String) -> Type? {
        if let object = UserDefaults.standard.object(forKey: forKey) as? Type {
            return exist(forKey) ? object : defaultValue
        }
        return defaultValue
    }
    
    static func get<Type>(forKey: String) -> Type? {
        if let object = UserDefaults.standard.object(forKey: forKey) as? Type {
            return exist(forKey) ? object : nil
        }
        return nil
    }
    
    static func exist(_ key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

}
