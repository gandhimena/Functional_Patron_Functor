//
//  FunctorCollection.swift
//  Patron_Functor
//
//  Created by spychatter mx on 1/19/18.
//  Copyright © 2018 spychatter. All rights reserved.
//
/*
== Functor Collection ==
- Con las colecciones, lo que vamos a poder ignorar es el numero de elementos de la colección, haciendo equivalente la presencia o no de un valor.
//Ventajas de los Functores:
- Ignoramos variaciones en el contenedor
- simplificamos el código
- Nos abstraemos de un patron de transformación/iteración muy comun en los lenguajes.

Caracteristicas para ser functor Collection:
- poder utilizar map pero sin hacer ningun cambio.
- cumplir con la ley de la composición: que dice, que podemos hacer varios mapeos en uno solo.
*/

import UIKit

class FunctorCollection: UIViewController{
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		
		let numbers1 = Array(1...10).map{suma(value: $0)}.map{suma(value: $0)}
		let numbers2 = Array(1...10)
		
		print(numbers1)
	}

	func suma(value: Int) -> Int{
		return value + 2
	}
	
}
