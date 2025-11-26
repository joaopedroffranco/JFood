//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI

public struct JSectionView<Content: View>: View {
	public let title: String
	public let contentView: () -> Content
	
	public init(_ title: String, content: @escaping () -> Content) {
		self.title = title
		self.contentView = content
	}
	
	public var body: some View {
		VStack(alignment: .leading, spacing: DesignSystem.Spacings.default) {
			Text(title)
				.font(DesignSystem.Fonts.title)
				.foregroundStyle(DesignSystem.Colors.textPrimary)
				.padding(.leading, DesignSystem.Spacings.margin)
			
			contentView()
		}
	}
}

#Preview {
	JSectionView("My Title") {
		HStack {
			Rectangle().fill(Color.blue)
				.frame(width: 100, height: 100)
			Rectangle().fill(Color.red)
				.frame(width: 100, height: 100)
		}
	}
}
