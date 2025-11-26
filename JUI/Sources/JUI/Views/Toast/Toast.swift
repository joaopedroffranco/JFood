//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct Toast: View {
	private let message: String
	
	public init(_ message: String) {
		self.message = message
	}
	
	public var body: some View {
		Text(message)
			.font(DesignSystem.Fonts.default)
			.foregroundColor(DesignSystem.Colors.white)
			.padding(.horizontal, DesignSystem.Spacings.default)
			.padding(.vertical, 2*DesignSystem.Spacings.default)
			.frame(maxWidth: .infinity)
			.background(DesignSystem.Colors.dark)
			.cornerRadius(DesignSystem.Radius.small)
			.shadow(radius: 4)
	}
}

#Preview {
	Toast("A toast message")
}
