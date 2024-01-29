//
//  ViewController.swift
//  Countries
//
//  Created by Sudha on 27/01/24.
//

import UIKit

class CountryListViewController: UIViewController {
    // ViewModel instance
    private var viewModel: CountryListViewModel!
    
    @IBOutlet var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize ViewModel with network and data storage services. Applied Single Responsibility for each class
        let networkService = RestCountriesNetworkService()
        let dataStorageService = UserDefaultsDataStorageService()
        viewModel = CountryListViewModel(networkService: networkService, dataStorageService: dataStorageService)
        
        
        // Fetch data from the ViewModel
        viewModel.fetchData { [weak self] in
            // Reload UI on the main thread after data is fetched
            DispatchQueue.main.async {
                self?.tableview?.reloadData()
            }
        }
    }
    
}

extension CountryListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCountries().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell 
        let country = viewModel.getCountries()[indexPath.row]
        cell.textLabel?.text = country.name?.common
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to a detailed view
        let selectedCountry = viewModel.getCountries()[indexPath.row]
        let  vc = self.storyboard?.instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        vc.country =  selectedCountry
        self.present(vc, animated: true, completion: nil)

    }
}


