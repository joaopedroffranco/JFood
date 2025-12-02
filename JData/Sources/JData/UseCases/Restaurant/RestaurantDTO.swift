//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public struct RestaurantDTO: Identifiable {
	public let id: String
	public let name: String
	public let rating: Float
	public let numberOfRatings: Int
	public let deliveryPrice: Decimal
	public let eta: String
	public let image: String
	public let dishes: [DishDTO]?
	
	public init(
		id: String,
		name: String,
		rating: Float,
		numberOfRatings: Int,
		deliveryPrice: Decimal,
		eta: String,
		image: String,
		dishes: [DishDTO]? = nil
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
}

extension RestaurantDTO: Codable, Sendable {}
