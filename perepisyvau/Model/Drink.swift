//
//  Drink.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import Foundation

struct Drinks: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String?
    let strDrinkAlternate: String?
    let strTags: String?
    let strVideo: String?
    let strCategory: String?
    let strIBA: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String
    let strInstructionsZHHANS: String?
    let strInstructionsZHHANT: String?
    let strDrinkThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strImageSource: String?
    let strImageAttribution: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    enum CodingKey: String {
        case strDrink, strDrinkAlternate, strTags, strVideo, strCategory, strIBA, strAlcoholic, strGlass, strInstructions, strDrinkThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure6, strMeasure7, strMeasure8, strImageSource, strImageAttribution, strCreativeCommonsConfirmed, dateModified
        case strInstructionsZHHANS = "strInstructionsZH-HANS"
        case strInstructionsZHHANT = "strInstructionsZH-HANT"
    }
    
    init(strDrink: String?, strDrinkAlternate: String?, strTags: String?, strVideo: String?, strCategory: String?, strIBA: String?, strAlcoholic: String?, strGlass: String?, strInstructions: String, strInstructionsZHHANS: String?, strInstructionsZHHANT: String?, strDrinkThumb: String?, strIngredient1: String?, strIngredient2: String?, strIngredient3: String?, strIngredient4: String?, strIngredient5: String?, strIngredient6: String?, strIngredient7: String?, strIngredient8: String?, strMeasure1: String?, strMeasure2: String?, strMeasure3: String?, strMeasure4: String?, strMeasure5: String?, strMeasure6: String?, strMeasure7: String?, strMeasure8: String?, strImageSource: String?, strImageAttribution: String?, strCreativeCommonsConfirmed: String?, dateModified: String?) {
        self.strDrink = strDrink
        self.strDrinkAlternate = strDrinkAlternate
        self.strTags = strTags
        self.strVideo = strVideo
        self.strCategory = strCategory
        self.strIBA = strIBA
        self.strAlcoholic = strAlcoholic
        self.strGlass = strGlass
        self.strInstructions = strInstructions
        self.strInstructionsZHHANS = strInstructionsZHHANS
        self.strInstructionsZHHANT = strInstructionsZHHANT
        self.strDrinkThumb = strDrinkThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strImageSource = strImageSource
        self.strImageAttribution = strImageAttribution
        self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
        self.dateModified = dateModified
    }
    
    init(margaritesData: [String: Any]) {
        strDrink = margaritesData["strDrink"] as? String ?? ""
        strDrinkAlternate = margaritesData["strDrinkAlternate"] as? String ?? ""
        strTags = margaritesData["strTags"] as? String ?? ""
        strVideo = margaritesData["strVideo"] as? String ?? ""
        strCategory = margaritesData["strCategory"] as? String ?? ""
        strIBA = margaritesData["strIBA"] as? String ?? ""
        strAlcoholic = margaritesData["strAlcoholic"] as? String ?? ""
        strGlass = margaritesData["strGlass"] as? String ?? ""
        strInstructions = margaritesData["strInstructions"] as? String ?? ""
        strInstructionsZHHANS = margaritesData["strInstructionsZH-HANS"] as? String ?? ""
        strInstructionsZHHANT = margaritesData["strInstructionsZH-HANT"] as? String ?? ""
        strDrinkThumb = margaritesData["strDrinkThumb"] as? String ?? ""
        strIngredient1 = margaritesData["strIngredient1"] as? String ?? ""
        strIngredient2 = margaritesData["strIngredient2"] as? String ?? ""
        strIngredient3 = margaritesData["strIngredient3"] as? String ?? ""
        strIngredient4 = margaritesData["strIngredient4"] as? String ?? ""
        strIngredient5 = margaritesData["strIngredient5"] as? String ?? ""
        strIngredient6 = margaritesData["strIngredient6"] as? String ?? ""
        strIngredient7 = margaritesData["strIngredient7"] as? String ?? ""
        strIngredient8 = margaritesData["strIngredient8"] as? String ?? ""
        strMeasure1 = margaritesData["strMeasure1"] as? String ?? ""
        strMeasure2 = margaritesData["strMeasure2"] as? String ?? ""
        strMeasure3 = margaritesData["strMeasure3"] as? String ?? ""
        strMeasure4 = margaritesData["strMeasure4"] as? String ?? ""
        strMeasure5 = margaritesData["strMeasure5"] as? String ?? ""
        strMeasure6 = margaritesData["strMeasure6"] as? String ?? ""
        strMeasure7 = margaritesData["strMeasure7"] as? String ?? ""
        strMeasure8 = margaritesData["strMeasure8"]  as? String ?? ""
        strImageSource = margaritesData["strImageSource"]  as? String ?? ""
        strImageAttribution = margaritesData["strImageAttribution"]  as? String ?? ""
        strCreativeCommonsConfirmed = margaritesData["strCreativeCommonsConfirmed"]  as? String ?? ""
        dateModified =  margaritesData["dateModified"]  as? String ?? ""
    }
    
    static func getDrinks(from value: Any) -> [Drink] {
        var margarites = [Drink]()
        guard let margaritesData = value as? [[String: Any]] else { return []}
        for drink in margaritesData {
            let margarita = Drink(margaritesData: drink)
            margarites.append(margarita)
        }
        return margarites
    }
}
