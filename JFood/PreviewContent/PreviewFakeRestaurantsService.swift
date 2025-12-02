//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import JData

#if DEBUG
class PreviewFakeRestaurantsService: RestaurantsServiceProtocol {
	private let state: PreviewState
	
	init(_ state: PreviewState) {
		self.state = state
	}
	
	private let instance = RestaurantDTO(
		id: "1",
		name: "Pizzaria Napoli",
		rating: 4.7,
		numberOfRatings: 1280,
		deliveryPrice: 7.99,
		eta: "30–45 min",
		image: "https://picsum.photos/200/800",
		dishes: [
			DishDTO(id: "d1", name: "Margherita", price: 25.0, description: "Molho de tomate, muçarela e manjericão"),
			DishDTO(id: "d2", name: "Pepperoni", price: 28.0, description: "Molho de tomate, muçarela e pepperoni"),
			DishDTO(id: "d3", name: "Quatro Queijos", price: 30.0, description: "Muçarela, gorgonzola, parmesão e provolone")
		]
	)
	
	func getAll() async -> [RestaurantDTO]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
	
	func getMore() async -> [RestaurantDTO]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
	
	func getRecommendations() async -> [RestaurantDTO]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
	
	func getDetails(for id: String) async -> JData.RestaurantDTO? {
		switch state {
		case .loading, .loaded: return instance
		case .error: return nil
		}
	}
}
#endif
