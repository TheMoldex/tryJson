//
//  CustomSell.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    private let network = NetworkManager.shared
    
    
    func setCell(with drink: Drink) {
        drinkName.text = drink.strDrink
        network.fetchImage(from: URL(string: drink.strDrinkThumb ?? "") ?? Link.imageMargarita.url) { result in
            switch result {
            case .success(let image):
                self.drinkImage.image = UIImage(data: image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
