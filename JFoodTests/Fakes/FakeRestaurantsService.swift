//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

class FakeRestaurantsService: RestaurantsServiceProtocol {
	let restaurants: [RestaurantDTO]?
	let recommendations: [RestaurantDTO]?
	let moreRestaurants: [RestaurantDTO]?
	
	init(restaurants: [RestaurantDTO]?, recommendations: [RestaurantDTO]?, moreRestaurants: [RestaurantDTO]? = nil) {
		self.restaurants = restaurants
		self.recommendations = recommendations
		self.moreRestaurants = moreRestaurants
	}
	
	func getAll() async -> [RestaurantDTO]? {
		restaurants
	}
	
	func getMore() async -> [RestaurantDTO]? {
		moreRestaurants
	}
	
	func getRecommendations() async -> [RestaurantDTO]? {
		recommendations
	}
	
	func getDetails(for id: String) async -> RestaurantDTO? {
		restaurants?.first { $0.id == id }
	}
}
