//
//  ConfigData.swift
//  Countries
//
//  Created by Sudha on 28/01/24.
//

import Foundation
 class ConfigurationData
{
    static func getServerURL() -> String
    {
        if let infoDict = Bundle.main.infoDictionary,
           let apiKey = infoDict["SERVERURL"] as? String {
            return apiKey
        }
        return ""
    }
}

