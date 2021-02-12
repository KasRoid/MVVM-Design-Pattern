//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Kas Song on 2/12/21.
//

import Foundation

final class WeatherService {
    // MARK: - Properties
    static let shared = WeatherService()
    
    // MARK: - Lifecycle
    private init() {}
}

// MARK: - Helpers
extension WeatherService {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: resource.url,
                                   completionHandler: { data, response, error in
                                    if let error = error {
                                        completion(.failure(error))
                                    } else if let data = data {
                                        do {
                                            let weather = try JSONDecoder().decode(T.self, from: data)
                                            DispatchQueue.main.async {
                                                completion(.success(weather))
                                            }
                                        } catch {
                                            completion(.failure(error))
                                        }
                                    }
                                   }
        ).resume()
    }
}
