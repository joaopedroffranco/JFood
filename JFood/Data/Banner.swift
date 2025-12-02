//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

struct Banner: Hashable, Sendable {
	let id: String
	let text: String
	let color: String
	
	init(id: String, text: String, color: String) {
		self.id = id
		self.text = text
		self.color = color
	}
	
	init(from banner: BannerDTO) {
		self.init(
			id: banner.id,
			text: banner.text,
			color: banner.color
		)
	}
}
