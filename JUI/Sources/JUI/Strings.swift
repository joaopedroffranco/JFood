//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import JFoundation

public enum Strings {
	public static let home = "Bem-vindo"
	public static let menu = "Menu"
	
	public static let recommendations = "Recomendações"
	public static let banners = "Promoções"
	public static let allRestaurants = "Perto de você"
	public static let dishes = "Pratos"
	
	public static let deliveryPrice = "Taxa de entrega"
	public static let deliveryTime = "Tempo de entrega"
	public static let addedToCart = "Adicionado ao carrinho"
	
	public static func restaurantDescription(deliveryPrice: Decimal, deliveryTime: String) -> String { "\(self.deliveryPrice): \(deliveryPrice.asString) • \(deliveryTime)" }

	public static let errorLoadingData = "Erro ao carregar os dados :/"
	public static let tryAgain = "Tentar novamente"
}
