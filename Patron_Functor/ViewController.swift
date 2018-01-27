//
//  ViewController.swift
//  Patron_Functor
//
//  Created by spychatter mx on 1/15/18.
//  Copyright © 2018 spychatter. All rights reserved.
//
//==Patron Functor =
// Un patron coomun de los opcionales es la notificación de errores, se utilizan para decirle a una función que no pudo realizar su trabajo debido a una razon.
// Cualquier contenedor que tenga un valor asociado, y una funcion que transforme ese valor asociado usando el mismo tipo de contenedor, es un Functor. Debido a esta propiedad, se suele decir que map preserva el contenedor que envuelve el valor, esto quiere decir que map, nunca va a cambiar el tipo del contenedor.


import UIKit
import Foundation
import Result



//enum ResultType<T>{
//	case failure(Errors)
//	case success(T)
//}

enum Errors{
	case connectionError(desc:String)
	case parserError(desc:String)
	case notDataFromManager(desc:String)
}

enum Optionals<T>{
	case success(_:T)
	case failure(Errors)
	
	func map<S>(_ transform: (T) -> S) -> Optionals<S>{
		switch self {
		
		case .success(let t):
			return .success(transform(t))
		case .failure(let error):
			return .failure(error)
		}
	}
	
}

struct Accounts {
	var name: String
	var accountType: String
	var email:String
	var url:String
}
enum ClassName{
	case viewController
	case otroViewController
}
enum funcFromViewController{
	
}


enum JSONError: Error{
	case connection(ClassName,String)
	case serverError(ClassName,String)
}

extension JSONError{
	public var errorDescription: String {
		switch self {
		case .connection(let vc, let function):
			return " ❌ No internet connection from: \(vc), fromFuncton: \(function)"
		case .serverError(let vc, let function):
			return "❌ No Data from Manager from: \(vc), fromFuncton: \(function)"
		}
	}
}


typealias JSONObject = [String: Any]
typealias Completion = (_ result:Result<Account, JSONError>) -> Void

class ViewController: UIViewController {
	
	let configuration = "{" +
		"\"url_name\":\"Alex\"," +
		"\"accountType\":\"Premium\"," +
		"\"email\":\"alex@swiftfuncional.com\"," +
		"\"url\":\"www.swiftfuncional.com\"," +
	"}"
	override func viewDidLoad() {
		super.viewDidLoad()
		getAccount(dic: getJSON(json: configuration)){ result in
			switch result{
			case .success(let response):
				print(response.email)
			case .failure(let error):
				print(error.errorDescription)
			}
		}
		
	}
	
	func  showAccount(account: Account){
		print(account)
	}
	
	func getAccount(dic: NSDictionary, completion: @escaping Completion){
		guard let name = dic["name"] as? String,
			let accountType = dic["accountType"] as? String,
			let email = dic["email"] as? String,
			let url = dic["url"] as? String else{
				return completion(.failure(.connection(.viewController, "getAccount")))
		}
		
		completion(.success(Account(name: name, accountType: accountType, email: email, url: url)))
	}
	
	

	func getJSON(json: String) -> NSDictionary{
		return try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: []) as! NSDictionary
	}
	
	

}

