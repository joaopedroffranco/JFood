// Created in 2025

import Foundation
import JFoundation

public enum Strings {
	public static let home = "Bem-vindo"
	public static let menu = "Menu"
	
	public static let recommendations = "Recomendaçoes"
	public static let banners = "Promoções"
	public static let allRestaurants = "Perto de você"
	public static let dishes = "Pratos"
	
	public static let deliveryPrice = "Preço da entrega"
	public static let deliveryTime = "Previsão de entrega"
	public static let addedToCart = "Adicionado ao carrinho"
	
	public static func restaurantDescription(deliveryPrice: Decimal, deliveryTime: String) -> String { "\(self.deliveryPrice): \(deliveryPrice.asString) • \(deliveryTime)" }
}
