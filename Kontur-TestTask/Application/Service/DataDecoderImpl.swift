//
//  DataDecoderImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import Foundation

struct DataDecoderImpl: DataDecoder {
    
    enum DataDecoderError: LocalizedError {
        case decodingError(Error)
    }
    
    //MARK: Properties
    
    let decoder: JSONDecoder
    
    //MARK: - Methods
    
    func decode<Model>(data: Data, to model: Model.Type) throws -> Model where Model : Decodable {
        do {
            let decodedModel = try decoder.decode(model.self, from: data)
            return decodedModel
        } catch {
            throw DataDecoderError.decodingError(error)
        }
    }
}
