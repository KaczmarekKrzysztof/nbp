//
//  CurrencyRepository.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 24/01/2021.
//

import Foundation

enum CurrencyTable: String {
    case a, b, c
}

enum NetworkError: Error {
    case brokenURL
    case requestFailed
}

struct CurrencyResponse: Codable {
    let currencies: [Currency]
    let effectiveDate: String
    
    enum CodingKeys: String, CodingKey {
        case currencies = "rates"
        case effectiveDate
    }
}

struct RatesResponse: Codable {
    let rates: [Rate]
}

class CurrencyRepository {
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    func getCurrencies(for table: CurrencyTable, completion: @escaping (Result<CurrencyResponse, Error>) -> Void) {
        dataTask?.cancel()
        guard let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/\(table.rawValue)/?format=json") else {
            completion(.failure(NetworkError.brokenURL))
            return
        }
        
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let currencyResponse = try? JSONDecoder().decode([CurrencyResponse].self, from: data),
                  !currencyResponse.isEmpty
            else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.requestFailed))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(currencyResponse.first!))
            }
        }
        dataTask?.resume()
    }
    
    func getRates(for currency: Currency, table: CurrencyTable, fromDate: Date, toDate: Date, completion: @escaping (Result<RatesResponse, Error>) -> Void) {
        dataTask?.cancel()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let from = formatter.string(from: fromDate)
        let to = formatter.string(from: toDate)
        guard let url = URL(string: "https://api.nbp.pl/api/exchangerates/rates/\(table.rawValue)/\(currency.code)/\(from)/\(to)/?format=json") else {
            completion(.failure(NetworkError.brokenURL))
            return
        }
        
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let ratesResponse = try? JSONDecoder().decode(RatesResponse.self, from: data)
            else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.requestFailed))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(ratesResponse))
            }
        }
        dataTask?.resume()
    }
    
}
