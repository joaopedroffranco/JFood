//
//  Created by Joao Pedro Fabiano Franco.
//

import SwiftUI
import JUI

struct DishView: View {
	private let name: String
	private let price: String
	private let description: String
	
	init(name: String, price: String, description: String) {
		self.name = name
		self.price = price
		self.description = description
	}
	
	init(from data: DishDataProtocol) {
		self.init(name: data.name, price: data.priceAsString, description: data.description)
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: DesignSystem.Spacings.small) {
			Text(name)
				.font(DesignSystem.Fonts.subtitle)
				.foregroundStyle(DesignSystem.Colors.textPrimary)
			
			Text(price)
				.font(DesignSystem.Fonts.description)
				.foregroundStyle(DesignSystem.Colors.textSecondary)
			
			Text(description)
				.font(DesignSystem.Fonts.default)
				.foregroundStyle(DesignSystem.Colors.textTertiary)
		}
	}
}

#Preview("Normal") {
	Group {
		DishView(
			name: "Margherita",
			price: "R$ 25",
			description: "Molho de tomate, muçarela e manjericão"
		)
	}
}

#Preview("Descrição Longa") {
	DishView(
		name: "Margherita",
		price: "R$ 25",
		description: "Molho de tomate, muçarela e manjericão com uma descricao muito grande"
	)
}
