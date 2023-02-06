//
//  URLBuilder.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

protocol URLBuilder {
    func build(withScheme sceme: String,
               host: String,
               path: String,
               queryParameters: [String: String]?) -> URL?
}
