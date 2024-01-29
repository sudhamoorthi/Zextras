//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Sudha on 27/01/24.
//

import Foundation

protocol NetworkService {
    func fetchData(completion: @escaping ([Country]?, Error?) -> Void)
}

class RestCountriesNetworkService: NetworkService {
    func fetchData(completion: @escaping ([Country]?, Error?) -> Void) {
        guard let url = URL(string: ConfigurationData.getServerURL()) else { return  }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            do {
                let country = try JSONDecoder().decode([Country].self, from: data)
                completion(country, nil)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}


// DataStorageService.swift
protocol DataStorageService {
    func saveData(_ data: [Country])
    func getData() -> [Country]
}

class UserDefaultsDataStorageService: DataStorageService {
    private let key = "countriesKey"
    
    func saveData(_ data: [Country]) {
        // Convert to Data and save to UserDefaults
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    func getData() -> [Country] {
        // Retrieve data from UserDefaults and decode
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decodedData = try? JSONDecoder().decode([Country].self, from: savedData) {
            return decodedData
        }
        return []
    }
}

// ViewModel.swift
class CountryListViewModel {
    private let networkService: NetworkService
    private let dataStorageService: DataStorageService
    private var countries: [Country] = []
    
    init(networkService: NetworkService, dataStorageService: DataStorageService) {
        self.networkService = networkService
        self.dataStorageService = dataStorageService
    }
    
    func fetchData(completion: @escaping () -> Void) {
        networkService.fetchData { [weak self] data, error in
            guard let self = self else { return }
            
            if let data = data {
                self.countries = data
                self.dataStorageService.saveData(data)
            } else {
                // Handle error
            }
            completion()
        }
    }
    
    func getCountries() -> [Country] {
        return countries.isEmpty ? dataStorageService.getData() : countries
    }
}

