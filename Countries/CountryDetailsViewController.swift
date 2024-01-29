//
//  CountryDetailsViewController.swift
//  Countries
//
//  Created by Sudha on 27/01/24.
//

import UIKit

class CountryDetailsViewController : UIViewController
{
    let detailsCount :  Int = 5 //Display 5 properties from the country details
    var country : Country?
    @IBOutlet var tableview : UITableView?
    override func viewWillAppear(_ animated: Bool) {
    }
}

extension CountryDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Name: \(country?.name?.common ?? "")"
        case 1:
            cell.textLabel?.text = "Official Name: \(country?.name?.official ?? "")"
        case 2:
            cell.textLabel?.text = "Region: \(country?.region ?? "")"
        case 3:
            cell.textLabel?.text = "Population: \(country?.population ?? 0)"
        case 4:
            cell.textLabel?.text = "Start of the week: \(country?.startOfWeek ?? "")"
        default:
            cell.textLabel?.text = "Flag: \(country?.flag ?? "")"
        }
        
        return cell
    }
    
    // TODO: Not used for now due to time constraint.  To get the count of properties in the Country model
    private func getPropertyCount(for country: Country?) -> Int {
        let mirror = Mirror(reflecting: country)
        return mirror.children.count
    }
    
    // TODO: Not used for now due to time constraint. To get the property in the Country model
    private func getProperty(for country: Country?, index: Int) -> (label: String, value: Any)? {
        let mirror = Mirror(reflecting: country)
        let children = mirror.children
        
        guard index >= 0, index < children.count else {
            return nil
        }
        
        let property = children[children.index(children.startIndex, offsetBy: index)]
        return (label: property.label ?? "", value: property.value)
    }
}
