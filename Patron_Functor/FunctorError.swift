//
//  FunctorError.swift
//  Patron_Functor
//
//  Created by spychatter mx on 1/18/18.
//  Copyright © 2018 spychatter. All rights reserved.
//

import Foundation

enum FunctorError: Swift.Error{
	case connection(Response)
	case parseError(Response)
	case noDataFromManager(Response)
}

extension FunctorError{
	var response: Response?{
		switch self {
		case .connection(let response): return response
		case .noDataFromManager(let resonse): return resonse
		case .parseError(let response): return response
		}
	}
}


extension FunctorError: LocalizedError{
	public var errorDescription: String? {
		switch self {
		case .connection(let desc):
			return " ❌ No internet connection \(desc)"
		case .noDataFromManager(let desc):
			return "❌ No Data from Manager \(desc)"
		case .parseError(let desc):
			return "❌ ParseError \(desc)"
		}
	}
}
