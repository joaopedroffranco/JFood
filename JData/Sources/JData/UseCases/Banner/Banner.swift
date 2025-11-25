//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation

public struct Banner: Identifiable {
	public let id: String
	public let image: String
	
	public init(
		id: String,
		image: String
	) {
		self.id = id
		self.image = image
	}
}

extension Banner: Codable {}
