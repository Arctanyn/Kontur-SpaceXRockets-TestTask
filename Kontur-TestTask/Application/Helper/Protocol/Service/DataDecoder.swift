//
//  DataDecoder.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import Foundation

protocol DataDecoder {
    func decode<Model: Decodable>(data: Data, to model: Model.Type) throws -> Model
}
