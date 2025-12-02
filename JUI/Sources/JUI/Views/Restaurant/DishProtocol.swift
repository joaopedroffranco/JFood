//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JFoundation

public protocol DishProtocol {
	var name: String { get }
	var price: Decimal { get }
	var description: String { get }
}

public extension DishProtocol {
	var priceAsString: String { price.asString }
}
