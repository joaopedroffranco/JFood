//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

@main
struct JFoodApp: App {
	@StateObject private var router: MainRouter = .init()
	@StateObject private var toastManager: ToastManager = .init()
	
	init() {
		NavigationBarAppearance.setup()
	}
	
	var body: some Scene {
		WindowGroup {
			NavigationStack(path: $router.path) {
				homeScreenView
			}
			.tint(DesignSystem.Colors.white)
			.toast(message: toastManager.message)
		}
	}
}

private extension JFoodApp {
	@ViewBuilder var homeScreenView: some View {
		AppRoute.home
			.environmentObject(router)
			.environmentObject(toastManager)
			.navigationDestination(for: AppRoute.self) {
				$0
					.environmentObject(router)
					.environmentObject(toastManager)
			}
	}
}
