//
//  CustomCVCell.swift
//  perepisyvau
//
//  Created by Денис Сташков on 18.11.2023.
//

import UIKit

class CustomCVCell: UICollectionViewCell {
    @IBOutlet weak var margaritesName: UILabel!
    @IBOutlet weak var margaritesImage: UIImageView!
    
    private let networkManager = NetworkManager.shared
    
    func setCell(with drink: Drink) {
        margaritesName.text = drink.strDrink
        networkManager.fetchImage(from: URL(string: drink.strDrinkThumb ?? "oh god") ?? Link.imageMargarita.url) { result in
            switch result {
            case .success(let drink):
                self.margaritesImage.image = UIImage(data: drink)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
