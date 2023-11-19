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
    private var ingredientsArray = [String]()
    
    var margarita: Drink!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        coctailsName.text = margarita.strDrink
        howToCocking.text = "\(margarita.strInstructions)" + "\nTake the following ingredients\n\(setupIngredients())"
      
        fetchImage()
    }
    
    private func setupIngredients() -> String {
        ingredientsArray.append(margarita.strIngredient1 ?? "1")
        ingredientsArray.append(margarita.strMeasure1 ?? "1")
        ingredientsArray.append(margarita.strIngredient2 ?? "2")
        ingredientsArray.append(margarita.strMeasure2 ?? "2")
        ingredientsArray.append(margarita.strIngredient3 ?? "3")
        ingredientsArray.append(margarita.strMeasure3 ?? "3")
        ingredientsArray.append(margarita.strIngredient4 ?? " ")
        ingredientsArray.append(margarita.strMeasure4 ?? " ")
        ingredientsArray.append(margarita.strIngredient5 ?? " ")
        ingredientsArray.append(margarita.strMeasure5 ?? " ")
        ingredientsArray.append(margarita.strIngredient6 ?? " ")
        ingredientsArray.append(margarita.strMeasure6 ?? " ")
        
        let stringIngredients = ingredientsArray.joined(separator: " ")
        return stringIngredients
    }
    
    
    private func fetchImage() {
        drinks.fetchImage(from: URL(string:margarita.strDrinkThumb ?? "oh god") ?? Link.imageMargarita.url) { result in
            switch result {
            case .success(let imageData):
                self.drinkImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

