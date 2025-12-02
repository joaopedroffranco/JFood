//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation

public struct BannerDTO: Identifiable {
	public let id: String
	public let text: String
	public let color: String
	
	public init(
		id: String,
		text: String,
		color: String
	) {
		self.id = id
		self.text = text
		self.color = color
	}
}

extension BannerDTO: Codable, Sendable {}
