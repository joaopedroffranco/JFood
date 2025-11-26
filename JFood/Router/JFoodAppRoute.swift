//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import SwiftUI

enum JFoodAppRoute: Hashable {
	case home
	case restaurantDetail(id: String)
}

extension JFoodAppRoute: View {
	var body: some View {
		switch self {
		case let .restaurantDetail(id):
			RestaurantDetailScreenView(restaurantId: id)
		case .home:
			HomeScreenView()
		}
	}
}
