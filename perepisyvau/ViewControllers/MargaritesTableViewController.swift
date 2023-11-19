//
//  MargaritesTableViewController.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import UIKit
import Alamofire

class MargaritesTableViewController: UITableViewController {
    private let network = NetworkManager.shared
    //    private let userActions = UserAction.allCases
    private var margarites: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchMaragarites()
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
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    //    // Override to support conditional rearranging of the table view.
    //    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    //        // Return false if you do not want the item to be re-orderable.
    //        return true
    //    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else {return}
        
        detailsVC.margarita = margarites[index.row]
    }
}
