//
//  JFoodApp.swift
//  JFood
//
//  Created by Joao Pedro Fabiano Franco on 25/11/25.
//

import SwiftUI
import JUI

@main
struct JFoodApp: App {
	@StateObject private var router: MainRouter = .init()
	
	init() {
		NavigationBarAppearance.setup()
	}
	
	var body: some Scene {
		WindowGroup {
			NavigationStack(path: $router.path) {
				homeScreenView
			}
			.tint(DesignSystem.Colors.white)
		}
	}
}

private extension JFoodApp {
	@ViewBuilder var homeScreenView: some View {
		HomeScreenView()
			.environmentObject(router)
			.navigationDestination(for: JFoodAppRoute.self) { $0.environmentObject(router) }
	}
}
