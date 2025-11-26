//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct JButton: View {
	private let title: String
	private let action: () -> Void
	
	public init(title: String, action: @escaping () -> Void = {}) {
		self.title = title
		self.action = action
	}
	
	public var body: some View {
		Button(action: action) {
			Text(title)
				.font(DesignSystem.Fonts.default)
				.foregroundColor(DesignSystem.Colors.white)
				.padding(DesignSystem.Spacings.default)
				.background(DesignSystem.Colors.primary)
				.cornerRadius(DesignSystem.Radius.small)
				.shadow(radius: 2)
		}
	}
}

#Preview {
	JButton(title: "Clique aqui")
}
