//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JFoundation

public protocol DishDataProtocol {
	var name: String { get }
	var price: Decimal { get }
	var description: String { get }
}

public extension DishDataProtocol {
	var priceAsString: String { price.asString }
}

public struct DishData: Hashable, DishDataProtocol {
	public let name: String
	public let price: Decimal
	public let description: String
	
	public init(name: String, price: Decimal, description: String) {
		self.name = name
		self.price = price
		self.description = description
	}
}
