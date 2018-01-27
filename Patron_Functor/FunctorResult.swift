//
//  FunctorResult.swift
//  Patron_Functor
//
//  Created by spychatter mx on 1/19/18.
//  Copyright © 2018 spychatter. All rights reserved.
//
/*
	Uno de los casos mas complicados de solucionar en la programación es el retorno de resultados.
	Ejemplo:
- En los lenjuajes imperativos:
func validate(some: any) -> Bool
func validate(some: any) -> Any?
func validate(some: any) -> Throw

- En los lenguajes funcionales: Es comun utilizar un patro conocido como result.
== Result: es un contenedor que encapsula un resultado. O visto de otro modo, un opcional que en lugar de nil contiene un elemento de otro tipo distinto o podria ser un error, Esto puede ser un exito o un error.


*/



enum ResultError{
	case mostBeInt
}


infix operator |>: AdditionPrecedence

func |> <T,U,V>(_ first: @escaping(T) -> U, second: @escaping (U) -> V ) -> (T) -> V{
	return { second(first($0)) }
}


enum Result<S,E>{
	case success(_:S)
	case failure(_:E)
	
	func map<T>(_ transform:@escaping (S)->T) -> Result<T,E> {
		switch self {
		case .success(let s):
			return .success(transform(s))
		case .failure(let error):
			return .failure(error)
		}
	}
}


import UIKit

class FunctorResult: UIViewController{
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let numbers1 = Array(1...10).map(add2).map(add2)
		let numbers2 = Array(1...10).map(add2 |> add2)
		
		
		let result = convertStringToInt(value: "8")
		switch result {
		case .success(let value):
			print(value)
		case .failure(let error):
			print(error)
		}
		
		
		print(numbers1)
		print(numbers2)
	}
	
	func add2(number: Int) -> Int{
		return number + 2
	}
	
	func double(number: Int) -> Int{
		return number * 2
	}
	
	func convertStringToInt(value: String) -> Result<Int,ResultError> {
		//guard let intValue = Int(value) else { return .failure(.mostBeInt) }
		//return .success(intValue)
		
		return Int(value).flatMap{.success($0)} ?? .failure(.mostBeInt)
	}
}
