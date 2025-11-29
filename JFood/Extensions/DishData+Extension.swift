//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JUI
import JData

extension DishData {
	public init(from dish: Dish) {
		self.init(
			name: dish.name,
			price: dish.price,
			description: dish.description
		)
	}
}
