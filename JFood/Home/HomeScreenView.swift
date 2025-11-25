//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct HomeScreenView: View {
	@StateObject var viewModel: HomeViewModel = .init()
	
	var body: some View {
		HomeView(viewModel: viewModel)
			.padding(.vertical, DesignSystem.Spacings.margin)
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle(Strings.home)
			.navigationBarBackButtonHidden(false)
			.background(DesignSystem.Colors.background)
	}
}
