//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import SwiftUI

enum AppRoute: Hashable {
	case home
	case restaurantDetail(id: String)
}

extension AppRoute: View {
	var body: some View {
		switch self {
		case let .restaurantDetail(id):
			RestaurantDetailScreenView(restaurantId: id)
		case .home:
			HomeScreenView()
		}
	}
}
