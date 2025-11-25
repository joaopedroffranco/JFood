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
	
	init() {
		NavigationBarAppearance.setup()
	}
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeScreenView()
			}
		}
	}
}
