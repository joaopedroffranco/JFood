//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JFoundation

public protocol RestaurantDataProtocol {
	var id: String { get }
	var name: String { get }
	var rating: Float { get }
	var numberOfRatings: Int { get }
	var deliveryPrice: Decimal { get }
	var eta: String { get }
	var image: String { get }

	associatedtype DishData: DishDataProtocol
	var dishes: [DishData]? { get }
}

public extension RestaurantDataProtocol {
	var imageUrl: URL? { image.asUrl }
	var description: String { Strings.restaurantDescription(deliveryPrice: deliveryPrice, deliveryTime: eta) }
}

public struct RestaurantData: Hashable, Sendable, RestaurantDataProtocol {
	public let id: String
	public let name: String
	public let rating: Float
	public let numberOfRatings: Int
	public let deliveryPrice: Decimal
	public let eta: String
	public let image: String
	public let dishes: [DishData]?
	
	public init(
		id: String,
		name: String,
		rating: Float,
		numberOfRatings: Int,
		deliveryPrice: Decimal,
		eta: String,
		image: String,
		dishes: [DishData]? = nil
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
