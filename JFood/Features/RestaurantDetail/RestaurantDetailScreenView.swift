//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct RestaurantDetailScreenView: View {
	@StateObject private var viewModel: RestaurantDetailViewModel
	
	init(restaurantId: String) {
		self._viewModel = StateObject(wrappedValue: .init(restaurantId: restaurantId))
	}
	
	var body: some View {
		RestaurantDetailView(viewModel: viewModel)
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarBackButtonHidden(false)
			.background(DesignSystem.Colors.background)
	}
}
