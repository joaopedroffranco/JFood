//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public enum RemoteDataSourceError: Error {
	case invalidRequest
	case decodeError
	case requestFailed
}

public class RemoteDataSource: RemoteDataSourceProtocol {
	let session: URLSession
	
	public init(session: URLSession = .shared) {
		self.session = session
	}
	
	public func fetch<T: Decodable>(request: Requestable) async throws -> T {
		guard let request = request.request else {
			throw RemoteDataSourceError.invalidRequest
		}
		
		do {
			let (data, _) = try await session.data(for: request)
			return try JSONDecoder().decode(T.self, from: data)
		} catch {
			throw RemoteDataSourceError.decodeError
		}
	}
}
