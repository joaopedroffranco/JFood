//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public extension View {
	func toast(message: String?) -> some View {
		self.overlay {
			if let message = message {
				VStack {
					Spacer()
					Toast(message)
						.zIndex(1)
				}
				.padding(.horizontal, DesignSystem.Spacings.margin)
				.padding(.bottom, DesignSystem.Spacings.margin)
			} else {
				EmptyView()
			}
		}
	}
}
