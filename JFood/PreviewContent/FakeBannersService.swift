//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

#if DEBUG
class PreviewFakeBannerService: BannersServiceProtocol {
	var state: PreviewState
	
	init(_ state: PreviewState) {
		self.state = state
	}
	
	private let instance = Banner(id: "123", text: "50% de desconto apenas hoje!", color: "#FE2346")
	
	func get() async -> [Banner]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
}
#endif

