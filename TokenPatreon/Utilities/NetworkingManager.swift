//
//  NetworkingManager.swift
//  TokenPatreon
//
//  Created by Omid Shojaeian Zanjani on 08/07/24.
//

import Foundation
import Combine

class NetworkingManager {
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .badURLResponse(url: let url):
                return "[🔥] Bad response from URL \(url)"
            case .unknown:
                return "[⚠️] Inknown error occured "
            }
        }
    }
    static func download(_ url:URL) -> AnyPublisher<Data, Error> {
       return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url )})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url:URL) throws -> Data {
        
        guard let respomse = output.response as? HTTPURLResponse,
              respomse.statusCode >= 200 && respomse.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
              }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion{
        case .finished:
            break
        case .failure(let erro):
            print(erro.localizedDescription)
        }
    }
}
