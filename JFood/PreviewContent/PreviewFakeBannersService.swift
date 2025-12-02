//
//  Created by Joao Pedro Fabiano Franco.
//  

import Foundation
import JData

#if DEBUG
class PreviewFakeBannersService: BannersServiceProtocol {
	private let state: PreviewState
	
	init(_ state: PreviewState) {
		self.state = state
	}
	
	private let instance = BannerDTO(id: "123", text: "50% de desconto apenas hoje!", color: "#FE2346")
	
	func get() async -> [BannerDTO]? {
		switch state {
		case .loading, .loaded: return [instance, instance, instance]
		case .error: return nil
		}
	}
}
#endif
