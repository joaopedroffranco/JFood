//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct HomeScreenView: View {
	@EnvironmentObject private var router: MainRouter
	@StateObject private var viewModel: HomeViewModel = .init()
	
	var body: some View {
		HomeView(viewModel: viewModel)
			.padding(.vertical, DesignSystem.Spacings.margin)
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle(Strings.home)
			.navigationBarBackButtonHidden(false)
			.background(DesignSystem.Colors.background)
	}
}
