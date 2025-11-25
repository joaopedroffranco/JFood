//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public struct Dish: Identifiable {
		public let id: String
		public let name: String
		public let price: Double
		public let description: String
		
		public init(id: String, name: String, price: Double, description: String) {
				self.id = id
				self.name = name
				self.price = price
				self.description = description
		}
}

extension Dish: Codable {}
