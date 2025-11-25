//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public struct Restaurant: Identifiable {
	public let id: String
	public let name: String
	public let rating: Float
	public let numberOfRatings: Int
	public let deliveryPrice: Decimal
	public let eta: String
	public let dishes: [Dish]?
	
	public init(
		id: String,
		name: String,
		rating: Float,
		numberOfRatings: Int,
		deliveryPrice: Decimal,
		eta: String,
		dishes: [Dish]? = nil
	) {
		self.id = id
		self.name = name
		self.rating = rating
		self.numberOfRatings = numberOfRatings
		self.deliveryPrice = deliveryPrice
		self.eta = eta
		self.dishes = dishes
	}
}

extension Restaurant: Codable {}
