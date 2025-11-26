//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct ErrorView: View {
	private let message: String
	private let onTriedAgain: () -> Void
	
	public init(_ message: String, onTriedAgain: @escaping () -> Void = {}) {
		self.message = message
		self.onTriedAgain = onTriedAgain
	}
	
	public var body: some View {
		VStack(spacing: DesignSystem.Spacings.default) {
			LocalImage(named: DesignSystem.Assets.warning)
				.frame(width: 48, height: 48)
			
			Text(message)
			
			JButton(title: Strings.tryAgain) { onTriedAgain() }
				.padding(.top, DesignSystem.Spacings.default)
		}
	}
}

#Preview {
	ErrorView("Ocorreu um erro por aqui :/")
}
