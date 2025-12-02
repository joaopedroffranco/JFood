//
//  Created by Joao Pedro Fabiano Franco.
//

import Combine
import JData
import JUI

enum RestaurantDetailViewState: Equatable {
	case loading
	case loaded(restaurant: Restaurant)
	case error
}

@MainActor
class RestaurantDetailViewModel: ObservableObject {
	private let restaurantsService: RestaurantsServiceProtocol
	private let restaurantId: String

	@Published var state: RestaurantDetailViewState = .loading
	
	init(restaurantId: String, restaurantsService: RestaurantsServiceProtocol = RestaurantsService()) {
		self.restaurantId = restaurantId
		self.restaurantsService = restaurantsService
	}
	
	func loadContent() {
		Task { await fetch() }
	}
}


private extension RestaurantDetailViewModel {
	func fetch() async {
		state = .loading

		if let restaurant = await fetchRestaurant() {
			self.state = .loaded(restaurant: restaurant)
		} else {
			self.state = .error
		}
	}
	
	func fetchRestaurant() async -> Restaurant? {
		guard let restaurant = await restaurantsService.getDetails(for: restaurantId) else { return nil }
		return Restaurant(from: restaurant)
	}
}
