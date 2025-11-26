//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

struct HomeBannerData: Hashable {
	let id: String
	let text: String
	let color: String
	
	init(id: String, text: String, color: String) {
		self.id = id
		self.text = text
		self.color = color
	}
}

extension HomeBannerData {
	init(from banner: Banner) {
		self.init(id: banner.id, text: banner.text, color: banner.color)
	}
}
