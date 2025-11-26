//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JUI
import JData

extension RestaurantData {
	public init(from restaurant: Restaurant) {
		self.init(
			id: restaurant.id,
			name: restaurant.name,
			rating: restaurant.rating,
			numberOfRatings: restaurant.numberOfRatings,
			deliveryPrice: restaurant.deliveryPrice,
			eta: restaurant.eta,
			dishes: restaurant.dishes?.map { DishData(from: $0) }
		)
	}
}
