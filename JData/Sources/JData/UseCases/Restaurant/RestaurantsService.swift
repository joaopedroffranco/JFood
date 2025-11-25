//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public protocol RestaurantsServiceProtocol {
	func getAll() async -> [Restaurant]?
	func getRecommendations() async -> [Restaurant]?
}

public class RestaurantsService: RestaurantsServiceProtocol {
	private let dataSource: RemoteDataSourceProtocol
	
	public init(dataSource: RemoteDataSourceProtocol = RemoteDataSource()) {
		self.dataSource = dataSource
	}
	
	public func getAll() async -> [Restaurant]? {
		guard let restaurants: [Restaurant] = try? await dataSource.fetch(request: RestaurantRequest.fetchAll), !restaurants.isEmpty else { return nil }
		return restaurants
	}
	
	public func getRecommendations() async -> [Restaurant]? {
		guard let recommendations: [Restaurant] = try? await dataSource.fetch(request: RestaurantRequest.recommendations), !recommendations.isEmpty else { return nil }
		return recommendations
	}
}
