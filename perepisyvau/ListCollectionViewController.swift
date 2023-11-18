//
//  ListCollectionViewController.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import UIKit
//enum UserAction: CaseIterable {
//    case Margarita
//    case BlueMargarita
//    case TommysMargarita
//    case WhiteCapMargarita
//    case StroberyMargarita
//    case SnashedWatermelon
//    
//    var title: String {
//        switch self {
//        case .Margarita:
//            "Classic Margarita"
//        case .BlueMargarita:
//            "Blue Margarita"
//        case .TommysMargarita:
//            "Tommy's Margarita"
//        case .WhiteCapMargarita:
//            "White Cap Margarita"
//        case .StroberyMargarita:
//            "Strobbery Margarita"
//        case .SnashedWatermelon:
//            "Snashed Margarita"
//        }
//    }
//}

//private let userActions = UserAction.allCases
private let reuseIdentifier = "cell"

class ListCollectionViewController: UICollectionViewController {
    private let networkManager = NetworkManager.shared
    private var margarites: [Drink] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        fetchData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        margarites.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CustomCVCell else { return UICollectionViewCell() }
        
        let drink = margarites[indexPath.item]
        cell.setCell(with: drink)
        
        return cell
    }

    private func fetchData() {
        networkManager.fetchDrinks(from: Link.API.url) { result in
            switch result {
            case .success(let data):
                self.margarites = data.drinks
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
