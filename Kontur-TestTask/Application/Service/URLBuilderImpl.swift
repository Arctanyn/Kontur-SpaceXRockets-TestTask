//
//  URLBuilderImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

struct URLBuilderImpl: URLBuilder {
    func build(withScheme sceme: String,
               host: String,
               path: String,
               queryParameters: [String : String]?) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = sceme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameters?.map { URLQueryItem(name: $0, value: $1) }
        return urlComponents.url
    }
}
