//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JFoundation

public protocol RestaurantProtocol {
	var id: String { get }
	var name: String { get }
	var rating: Float { get }
	var numberOfRatings: Int { get }
	var deliveryPrice: Decimal { get }
	var eta: String { get }
	var image: String { get }

	associatedtype Dish: DishProtocol
	var dishes: [Dish]? { get }
}

public extension RestaurantProtocol {
	var imageUrl: URL? { image.asUrl }
	var description: String { Strings.restaurantDescription(deliveryPrice: deliveryPrice, deliveryTime: eta) }
}
