//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation

public protocol BannersServiceProtocol {
	func get() async -> [Banner]?
}

public class BannersService: BannersServiceProtocol {
	private let dataSource: RemoteDataSourceProtocol
	
	public init(dataSource: RemoteDataSourceProtocol = RemoteDataSource()) {
		self.dataSource = dataSource
	}
	
	public func get() async -> [Banner]? {
		guard let banners: [Banner] = try? await dataSource.fetch(request: BannerRequest.fetch), banners.count > 0 else { return nil }
		return banners
	}
}
