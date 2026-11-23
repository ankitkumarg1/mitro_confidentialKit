//
//  SessionManager.swift
//  mitro_app
//
//  Created by Ankit on 30/08/26.
//
import Foundation
import Combine
import ConfidentialKit

enum EndPoint: String {
    
    private static let baseURL = Secrets.$baseURL//"https://dummyjson.com/"
    private static let type : String = "1234567abc"
    case product = "products/search"

    var url: String {
        return Self.baseURL + self.rawValue
    }
}

enum HTTPMethod: String {
    case get = "GET"
}

class SessionManager : NSObject {

    func api<T: Codable>(endPoint: EndPoint,httpMethod: HTTPMethod,request: [String: Any]? = nil) -> any Publisher<T, Error> {
        guard let url = URL(string: endPoint.url) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in

                guard let httpResponse = response as? HTTPURLResponse,
                      200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }

                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
