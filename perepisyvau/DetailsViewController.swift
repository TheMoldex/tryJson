//
//  ViewController.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import UIKit




final class DetailsViewController: UIViewController {
    @IBOutlet weak var coctailsName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var howToCocking: UITextView!
    
    private let drinks = NetworkManager.shared
    private var margarites: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDrinks()
      
    }
    private func fetchDrinks() {
        drinks.fetchDrinks(from: Link.API.url) { result in
            switch result {
            case .success(let drinks):
                self.margarites = drinks.drinks
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "details", for: indexPath)
        return cell
    }
    
    
}

extension DetailsViewController: UITableViewDelegate {
    
}
