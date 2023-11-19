//
//  NetworkManager.swift
//  perepisyvau
//
//  Created by Денис Сташков on 17.11.2023.
//

import Foundation

enum NetworkError: Error{
    case noData
    case invalidURL
}

enum Link {
    case imageMargarita
    case imageBlueMargarita
    case imageTommysMargarita
    case imageWhiteCapMargarita
    case imageStroberyMargarita
    case imageSnashedWatermelon
    case API
    
    var url: URL {
        switch self {
        case .imageMargarita:
            URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")!
        case .API:
            URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!
        case .imageBlueMargarita:
            URL(string: "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg")!
        case .imageTommysMargarita:
            URL(string: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg")!
        case .imageWhiteCapMargarita:
            URL(string: "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg")!
        case .imageStroberyMargarita:
            URL(string: "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg")!
        case .imageSnashedWatermelon:
            URL(string: "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg")!
        }
        
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchDrinks(from url: URL, completion: @escaping (Result<Drinks,NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
            return
            }
            do {
                let drink = try self.decoder.decode(Drinks.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(drink))
                }
            }
            catch {
                completion(.failure(.invalidURL))
            }
        }.resume()
    }
}
