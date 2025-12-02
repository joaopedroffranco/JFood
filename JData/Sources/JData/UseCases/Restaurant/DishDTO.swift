//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation

public struct DishDTO: Identifiable {
	public let id: String
	public let name: String
	public let price: Decimal
	public let description: String
	
	public init(
		id: String,
		name: String,
		price: Decimal,
		description: String
	) {
		self.id = id
		self.name = name
		self.price = price
		self.description = description
	}
}

extension DishDTO: Codable, Sendable {}
