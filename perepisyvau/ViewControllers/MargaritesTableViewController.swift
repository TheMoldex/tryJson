//
//  MargaritesTableViewController.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import UIKit
import Alamofire

class MargaritesTableViewController: UITableViewController {
    // MARK: - private property
    private let network = NetworkManager.shared
    private var margarites: [Drink] = []
    
    // MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchMaragarites()
//        tryJSONManual()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else {return}
        
        detailsVC.margarita = margarites[index.row]
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        margarites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinks", for: indexPath)
        guard let cell = cell as? CustomCell else {  return UITableViewCell() }
        
        let drink = margarites[indexPath.row]
        cell.setCell(with: drink)
        return cell
    }
    // MARK: - private func's
    private func fetchMaragarites() {
        network.fetchDrinks(from: Link.API.url) { result in
            switch result {
            case .success(let drinks):
                self.margarites = drinks.drinks
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    private func tryJSONManual() {
//        AF.request(Link.API.url)
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    self.margarites = Drink.getDrinks(from: value)
//                    self.tableView.reloadData()
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//    }
   
}
