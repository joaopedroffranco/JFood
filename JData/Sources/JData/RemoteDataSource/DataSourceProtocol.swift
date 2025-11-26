//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public protocol RemoteDataSourceProtocol: AnyObject {
  func fetch<T: Decodable>(request: Requestable) async throws -> T
}
