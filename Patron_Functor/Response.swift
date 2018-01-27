//
//  Response.swift
//  Patron_Functor
//
//  Created by spychatter mx on 1/18/18.
//  Copyright © 2018 spychatter. All rights reserved.
//

import Foundation
public final class Response: CustomDebugStringConvertible, Equatable{
	
	public var error: String
	
	public init(error: String){
		self.error = error
	}
	
	public var description: String{
		return "Error de response: \(error)"
	}
	
	public var debugDescription: String{
		return description
	}
	
	public static func ==(lhs: Response, rhs: Response) -> Bool {
		return lhs.error == rhs.error
	}
	
}

