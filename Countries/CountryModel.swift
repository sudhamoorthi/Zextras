//
//  CountryModel.swift
//  Country
//
//  Created by Sudha on 27/01/24.
//
import Foundation

struct Country: Codable {
    struct Name: Codable {
        let common: String?
        let official: String?
        struct NativeName: Codable {
            let cat: Cat?
            
            struct Cat: Codable {
                let official: String?
                let common: String?
            }
        }
    }
    
    let name: Name?
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    
    struct Currencies: Codable {
        let EUR: Currency?
        
        struct Currency: Codable {
            let name: String?
            let symbol: String?
        }
    }
    
    let idd: Idd?
    
    struct Idd: Codable {
        let root: String?
        let suffixes: [String]?
    }
    
    let capital: [String]?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let languages: [String: String]?
    
    struct Translations: Codable {
        let ara: Translation?
        let bre: Translation?
        
        struct Translation: Codable {
            let official: String?
            let common: String?
        }
    }
    
    let translations: Translations?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Float?
    let demonyms: [String: Demonym]?
    
    struct Demonym: Codable {
        let eng: CommonAndorran?
        let fra: CommonAndorran?
        
        struct CommonAndorran: Codable {
            let f: String?
            let m: String?
        }
    }
    
    let flag: String?
    let maps: Maps?
    
    struct Maps: Codable {
        let googleMaps: String?
        let openStreetMaps: String?
    }
    
    let population: Int?
    let fifa: String?
    
    struct Car: Codable {
        let signs: [String]?
        let side: String?
    }
    
    let car: Car?
    let timezones: [String]?
    let continents: [String]?
    let flags: FlagUrls?
    let coatOfArms: CoatOfArmsUrls?
    let startOfWeek: String?
    
    struct FlagUrls: Codable {
        let png: String?
        let svg: String?
        let alt: String?
    }
    
    struct CoatOfArmsUrls: Codable {
        let png: String?
        let svg: String?
    }
    
    let capitalInfo: CapitalInfo?
    
    struct CapitalInfo: Codable {
        let latlng: [Double]?
    }
    
    let postalCode: PostalCode?
    
    struct PostalCode: Codable {
        let format: String?
        let regex: String?
    }
}

