//
//  FunctorOptional.swift
//  Patron_Functor
//
//  Created by spychatter mx on 1/15/18.
//  Copyright © 2018 spychatter. All rights reserved.
//
//==Patron Functor =
// Un patron coomun de los opcionales es la notificación de errores, se utilizan para decirle a una función que no pudo realizar su trabajo debido a una razon.
// Cualquier contenedor que tenga un valor asociado, y una funcion que transforme ese valor asociado usando el mismo tipo de contenedor, es un Functor. Debido a esta propiedad, se suele decir que map preserva el contenedor que envuelve el valor, esto quiere decir que map, nunca va a cambiar el tipo del contenedor.

import UIKit

enum Optionall<T>{
	case none
	case some(_:T)
	
	func map<S>(_ transform: (T) -> S) -> Optionall<S>{
		switch self {
		case .none:
			return .none
		case .some(let t):
			return .some(transform(t))
		}
	}
}

struct Account {
	let name: String
	let accountType: String
	let email: String
	let url: String
}

class FunctionOptional: UIViewController{
	
	let configuration = "{" +
		"\"name\":\"Alex\"," +
		"\"accountType\":\"Premium\"," +
		"\"email\":\"alex@swiftfuncional.com\"," +
		"\"url\":\"www.swiftfuncional.com\"," +
	"}"
	
	override func viewDidLoad() {
		super.viewDidLoad()

		_ = jsonToAccount(dic: parseJSON(json: configuration)).map(showAccount)
		
	}
	
	func showAccount(account: Account){
		print(account)
	}
	
	func jsonToAccount(dic: NSDictionary?) -> Optional<Account>{
		guard let name = dic?["name"] as? String,
			let accountType = dic?["accountType"] as? String,
			let email = dic?["email"] as? String,
			let url = dic?["url"] as? String else{
			return .none
		}
		return .some(Account(name: name, accountType: accountType, email: email, url: url))
	}
	
	func parseJSON(json: String) -> NSDictionary?{
		return try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: []) as? NSDictionary
		
	}
	
	
}

