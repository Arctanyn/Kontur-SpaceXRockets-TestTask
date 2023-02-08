//
//  RocketAPIServiceImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

final class RocketAPIServiceImpl: RocketAPIService {

    //MARK: Properties

    private let session: URLSession
    private let urlBuilder: URLBuilder
    
    //MARK: - Initialization

    init(session: URLSession = .shared, urlBuilder: URLBuilder) {
        self.session = session
        self.urlBuilder = urlBuilder
    }
    
    //MARK: - Methods

    func getRockets() async throws -> Data {
        guard let url = createURL(route: .rockets) else {
            throw HttpError.invalidURL
        }
        return try await fetchData(from: url)
    }
    
    func getRocketLaunches() async throws -> Data {
        guard let url = createURL(route: .lauches) else {
            throw HttpError.invalidURL
        }
        return try await fetchData(from: url)
    }
}

//MARK: - Private

private extension RocketAPIServiceImpl {
    enum APIBase {
        static let scheme = "https"
        static let host = "api.spacexdata.com"
        static let version = "v4"
    }
    
    enum APIRoute {
        case rockets
        case lauches
        
        var path: String {
            switch self {
            case .rockets:
                return "/\(APIBase.version)/rockets"
            case .lauches:
                return "/\(APIBase.version)/launches"
            }
        }
    }
    
    //MARK: - Private methods
    
    func fetchData(from url: URL) async throws -> Data {
        do {
            let (data, response) = try await session.data(from: url)
            try handleResponse(response)
            return data
        } catch let error where error is HttpError {
            throw error
        } catch {
            throw HttpError.networkError(error)
        }
    }
    
    func createURL(route: APIRoute,
                   queryParameters: [String: String]? = nil) -> URL? {
        urlBuilder.build(
            withScheme: APIBase.scheme,
            host: APIBase.host,
            path: route.path,
            queryParameters: queryParameters
        )
    }
    
    func handleResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HttpError.nonHttpRequest
        }
        
        let statusCode = httpResponse.statusCode
        
        switch statusCode {
        case (400..<500):
            throw HttpError.clientError(statusCode: statusCode)
        case (500..<600):
            throw HttpError.serverError(statusCode: statusCode)
        default:
            break
        }
    }
    
}
