//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public protocol RestaurantsServiceProtocol {
	func getAll() async -> [Restaurant]?
	func getMore() async -> [Restaurant]?
	func getRecommendations() async -> [Restaurant]?
}

public class RestaurantsService: RestaurantsServiceProtocol {
	private let dataSource: RemoteDataSourceProtocol
	private var currentPage: Int
	
	public init(dataSource: RemoteDataSourceProtocol = RemoteDataSource()) {
		self.dataSource = dataSource
		self.currentPage = 1
	}
	
	public func getAll() async -> [Restaurant]? {
		self.currentPage = 1
		guard let restaurants: [Restaurant] = try? await dataSource.fetch(request: RestaurantRequest.fetchAll), !restaurants.isEmpty else { return nil }

		return restaurants
	}
	
	public func getMore() async -> [Restaurant]? {
		let nextPage = currentPage + 1
		guard let restaurants: [Restaurant] = try? await dataSource.fetch(request: RestaurantRequest.fetchMore(page: nextPage)), !restaurants.isEmpty else { return nil }

		self.currentPage = nextPage
		return restaurants
	}
	
	public func getRecommendations() async -> [Restaurant]? {
		guard let recommendations: [Restaurant] = try? await dataSource.fetch(request: RestaurantRequest.recommendations), !recommendations.isEmpty else { return nil }
		return recommendations
	}
}
