//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JUI
import JData

struct Restaurant: Hashable, Sendable, RestaurantProtocol {
	let id: String
	let name: String
	let rating: Float
	let numberOfRatings: Int
	let deliveryPrice: Decimal
	let eta: String
	let image: String
	let dishes: [Dish]?
	
	init(
		id: String,
		name: String,
		rating: Float,
		numberOfRatings: Int,
		deliveryPrice: Decimal,
		eta: String,
		image: String,
		dishes: [Dish]? = nil
	) {
		self.id = id
		self.name = name
		self.rating = rating
		self.numberOfRatings = numberOfRatings
		self.deliveryPrice = deliveryPrice
		self.eta = eta
		self.image = image
		self.dishes = dishes
	}
	
	init(from restaurant: RestaurantDTO) {
		self.init(
			id: restaurant.id,
			name: restaurant.name,
			rating: restaurant.rating,
			numberOfRatings: restaurant.numberOfRatings,
			deliveryPrice: restaurant.deliveryPrice,
			eta: restaurant.eta,
			image: restaurant.image,
			dishes: restaurant.dishes?.map { Dish(from: $0) }
		)
	}
}
