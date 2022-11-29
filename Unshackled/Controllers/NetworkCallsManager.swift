//
//  NetworkCallsManager.swift
//  Unshackled
//
//  Created by Bradlee King on 29/11/2022.
//

import Foundation

class Network {
    func getCountries(completion:@escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "https://restcountries.com/v2/all") else {
            print("invalid URL!"); return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do {
                let countries = try! JSONDecoder().decode([Country].self, from: data!)
                completion(.success(countries))
                print(countries)
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
}
