//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public protocol RestaurantsServiceProtocol {
	func getAll() async -> [RestaurantDTO]?
	func getMore() async -> [RestaurantDTO]?
	func getRecommendations() async -> [RestaurantDTO]?
	func getDetails(for id: String) async -> RestaurantDTO?
}

public class RestaurantsService: RestaurantsServiceProtocol {
	private let dataSource: RemoteDataSourceProtocol
	private var currentPage: Int
	
	public init(dataSource: RemoteDataSourceProtocol = RemoteDataSource()) {
		self.dataSource = dataSource
		self.currentPage = 1
	}
	
	public func getAll() async -> [RestaurantDTO]? {
		self.currentPage = 1
		guard let restaurants: [RestaurantDTO] = try? await dataSource.fetch(request: RestaurantRequest.fetchAll), !restaurants.isEmpty else { return nil }

		return restaurants
	}
	
	public func getMore() async -> [RestaurantDTO]? {
		let nextPage = currentPage + 1
		guard let restaurants: [RestaurantDTO] = try? await dataSource.fetch(request: RestaurantRequest.fetchMore(page: nextPage)), !restaurants.isEmpty else { return nil }

		self.currentPage = nextPage
		return restaurants
	}
	
	public func getRecommendations() async -> [RestaurantDTO]? {
		guard let recommendations: [RestaurantDTO] = try? await dataSource.fetch(request: RestaurantRequest.fetchRecommendations), !recommendations.isEmpty else { return nil }
		return recommendations
	}
	
	public func getDetails(for id: String) async -> RestaurantDTO? {
		guard let restaurants: [RestaurantDTO] = try? await dataSource.fetch(request: RestaurantRequest.fetchDetails(id: id)), !restaurants.isEmpty else { return nil }
		return restaurants.first
	}
}
