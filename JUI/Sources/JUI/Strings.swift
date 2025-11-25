// Created in 2025

import Foundation
import JFoundation

public enum Strings {
	public static let home = "(Minha localizacao)"
	
	public static let recommendations = "Recomendaçoes"
	public static let banners = "Promoções"
	public static let allRestaurants = "Perto de você"
	
	public static func restaurantDescription(deliveryPrice: Decimal, deliveryTime: String) -> String { "Preço da entrega: \(deliveryPrice.asString) • \(deliveryTime)" }
}
