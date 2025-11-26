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
		image: "https://",
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
		image: "https://",
		dishes: [
			Dish(id: "d4", name: "Cheeseburger", price: 18.0, description: "Hambúrguer, queijo, alface e tomate"),
			Dish(id: "d5", name: "Bacon Burger", price: 20.0, description: "Hambúrguer, bacon, queijo e molho especial"),
			Dish(id: "d6", name: "Veggie Burger", price: 19.0, description: "Hambúrguer de grão-de-bico com salada")
		]
	)
	
	static let sushiPrime = Restaurant(
		id: "3",
		name: "Sushi Prime",
		rating: 4.8,
		numberOfRatings: 2100,
		deliveryPrice: 9.90,
		eta: "40–55 min",
		image: "https://",
		dishes: [
			Dish(id: "d7", name: "Combo Sushi 16 peças", price: 42.0, description: "Nigiri, sashimi e hossomaki variados"),
			Dish(id: "d8", name: "Temaki Salmão", price: 23.0, description: "Cone de alga com salmão fresco e cebolinha")
		]
	)
	
	static let tacoLocos = Restaurant(
		id: "4",
		name: "Taco Locos",
		rating: 4.6,
		numberOfRatings: 780,
		deliveryPrice: 6.99,
		eta: "20–30 min",
		image: "https://",
		dishes: [
			Dish(id: "d9", name: "Taco de Carne", price: 15.0, description: "Carne temperada, cheddar e alface"),
			Dish(id: "d10", name: "Burrito Clássico", price: 22.0, description: "Arroz, feijão, carne e queijo"),
			Dish(id: "d11", name: "Nachos Supreme", price: 18.0, description: "Tortilhas crocantes com guacamole e cheddar derretido")
		]
	)
	
	static let pastaBella = Restaurant(
		id: "5",
		name: "Pasta Bella",
		rating: 4.4,
		numberOfRatings: 1340,
		deliveryPrice: 8.50,
		eta: "35–50 min",
		image: "https://",
		dishes: [
			Dish(id: "d12", name: "Fettuccine Alfredo", price: 32.0, description: "Massa fresca com molho cremoso"),
			Dish(id: "d13", name: "Lasanha Bolonhesa", price: 29.0, description: "Camadas de massa, carne e molho de tomate"),
			Dish(id: "d14", name: "Ravioli de Ricota", price: 27.0, description: "Recheado com ricota e espinafre")
		]
	)
	
	static let healthyBowl = Restaurant(
		id: "6",
		name: "Healthy Bowl",
		rating: 4.3,
		numberOfRatings: 610,
		deliveryPrice: 4.99,
		eta: "20–30 min",
		image: "https://",
		dishes: [
			Dish(id: "d15", name: "Bowl Proteico", price: 26.0, description: "Frango grelhado, quinoa e legumes"),
			Dish(id: "d16", name: "Bowl Vegano", price: 24.0, description: "Tofu, arroz integral e vegetais frescos"),
			Dish(id: "d17", name: "Salada César", price: 18.0, description: "Alface, frango e molho césar"),
			Dish(id: "d18", name: "Wrap de Frango", price: 20.0, description: "Frango grelhado com molho leve")
		]
	)
}
