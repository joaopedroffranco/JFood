//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

class FakeRestaurantsService: RestaurantsServiceProtocol {
	let restaurants: [Restaurant]?
	let recommendations: [Restaurant]?
	let moreRestaurants: [Restaurant]?
	
	init(restaurants: [Restaurant]?, recommendations: [Restaurant]?, moreRestaurants: [Restaurant]? = nil) {
		self.restaurants = restaurants
		self.recommendations = recommendations
		self.moreRestaurants = moreRestaurants
	}
	
	func getAll() async -> [Restaurant]? {
		restaurants
	}
	
	func getMore() async -> [Restaurant]? {
		moreRestaurants
	}
	
	func getRecommendations() async -> [Restaurant]? {
		recommendations
	}
	
	func getDetails(for id: String) async -> Restaurant? {
		restaurants?.first { $0.id == id }
	}
}
