//
//  Environment.swift
//  Lendu
//
//   
//

import Foundation
public enum Environment {
    // MARK: - Keys
    enum PlistKeys {
        static let serverURL = "ServerUrl"
        static let environment = "Environment"
        static let apiKey = "ApiKey"
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found, please check.")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let serverURL: URL = {
        guard let serverURLstring = Environment.infoDictionary[PlistKeys.serverURL] as? String else {
            fatalError("Root server URL not set in plist file for this environment.")
        }
        guard let url = URL(string: serverURLstring) else {
            fatalError("Root URL is not valid.")
        }
        return url
    }()
    
    static let currentEnviroment: String = {
        guard let currentEnvironment = Environment.infoDictionary[PlistKeys.environment] as? String else {
            fatalError("Can not read the current environment variable for this build.")
        }
        return currentEnvironment
    }()
    
    static let currentApiKey: String = {
        guard let currentApiKey = Environment.infoDictionary[PlistKeys.apiKey] as? String else {
            fatalError("Can not read the current environment variable for this build.")
        }
        return currentApiKey
    }()
}
