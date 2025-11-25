//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import JData



class PreviewFakeRestaurantsService: RestaurantsServiceProtocol {
	var state: PreviewState
	
	init(_ state: PreviewState) {
		self.state = state
	}
	
	private let instance = Restaurant(
		id: "1",
		name: "Pizzaria Napoli",
		rating: 4.7,
		numberOfRatings: 1280,
		deliveryPrice: 7.99,
		eta: "30–45 min",
		dishes: [
			Dish(id: "d1", name: "Margherita", price: 25.0, description: "Molho de tomate, muçarela e manjericão"),
			Dish(id: "d2", name: "Pepperoni", price: 28.0, description: "Molho de tomate, muçarela e pepperoni"),
			Dish(id: "d3", name: "Quatro Queijos", price: 30.0, description: "Muçarela, gorgonzola, parmesão e provolone")
		]
	)
	
	func getAll() async -> [Restaurant]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
	
	func getMore() async -> [Restaurant]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
	
	func getRecommendations() async -> [Restaurant]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
}
