//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation

public protocol BannersServiceProtocol {
	func get() async -> [BannerDTO]?
}

public class BannersService: BannersServiceProtocol {
	private let dataSource: RemoteDataSourceProtocol
	
	public init(dataSource: RemoteDataSourceProtocol = RemoteDataSource()) {
		self.dataSource = dataSource
	}
	
	public func get() async -> [BannerDTO]? {
		guard let banners: [BannerDTO] = try? await dataSource.fetch(request: BannerRequest.fetch), !banners.isEmpty else { return nil }
		return banners
	}
}
