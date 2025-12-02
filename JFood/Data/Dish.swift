//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JUI
import JData

struct Dish: Hashable, Sendable, DishProtocol {
	let name: String
	let price: Decimal
	let description: String
	
	init(name: String, price: Decimal, description: String) {
		self.name = name
		self.price = price
		self.description = description
	}
	
	init(from dish: DishDTO) {
		self.init(
			name: dish.name,
			price: dish.price,
			description: dish.description
		)
	}
}
