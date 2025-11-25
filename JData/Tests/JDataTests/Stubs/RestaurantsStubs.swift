//
//  Created by Joao Pedro Fabiano Franco.
//

import Foundation
import JData

enum RestaurantsStubs {
	static let pizzaNapoli = Restaurant(
		id: "1",
		name: "Pizzaria Napoli",
		rating: 4.7,
		numberOfRatings: 1280,
		deliveryPrice: 7.99,
		eta: "30–45 min",
		dishes: [
			Dish(id: "d1", name: "Margherita", price: 25.0, description: "Molho de tomate, muçarela e manjericão"),
			Dish(id: "d2", name: "Pepperoni", price: 28.0, description: "Molho de tomate, muçarela e pepperoni"),
			Dish(id: "d3", name: "Quatro Queijos", price: 30.0, description: "Muçarela, gorgonzola, parmesão e provolone")
		]
	)
	
	static let burgerHouse = Restaurant(
		id: "2",
		name: "Burger House",
		rating: 4.5,
		numberOfRatings: 920,
		deliveryPrice: 5.50,
		eta: "25–35 min",
		dishes: [
			Dish(id: "d4", name: "Cheeseburger", price: 18.0, description: "Hambúrguer, queijo, alface e tomate"),
			Dish(id: "d5", name: "Bacon Burger", price: 20.0, description: "Hambúrguer, bacon, queijo e molho especial"),
			Dish(id: "d6", name: "Veggie Burger", price: 19.0, description: "Hambúrguer de grão-de-bico com salada")
		]
	)
}
