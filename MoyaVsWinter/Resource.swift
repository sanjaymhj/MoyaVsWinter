
//  Resource.swift
//  NetworkingPop
//
//  Created by Sanjay Maharjan on 10/19/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//

import Foundation
import Alamofire

/**
 Resource
 
 This resource holds all the data required for the API request.
 
 Attributes-
 
 - **`url`**:       `String`: Endpoint of the API
 
 - **`parse`**:       `NSData -> A`: Closure/Function for parsing the NSData to the required model type.
 
 - **`method`**:      `RequestMethod`: Http request method of the request to be done.
 - **`parameterEncoding`**: `Alamofire.ParameterEncoding`:        Alamofire.ParameterEncoding
 - **`parameters`**:      `[String: AnyObject]?`: Parameters for the request
 - **`headers`**:       `[String: String]?`: Request for the request
 */
struct Resource<A> {
  var url: String
  var parse: (Data) -> A?
  var method: HTTPMethod
  var parameterEncoding: Encoding
  var parameters: RequestParameters? = nil
  var headers: [String: String]? = nil
}

extension Resource {
  init(url: String, parseJSON: @escaping (Data) -> A?, method: HTTPMethod, parameterEncoding: Encoding, parameters: RequestParameters?, headers: [String: String]?) {
    self.url = url
    self.parse = { data in
      return parseJSON(data)
    }
    self.method = method
    self.parameterEncoding = parameterEncoding
    self.parameters = parameters
    self.headers = headers
  }
    
  func makeCopy() -> Resource {
    return Resource(withResource: self)
  }
  
  private init(withResource resource: Resource) {
    self.url = resource.url
    self.parse = resource.parse
    self.parameterEncoding = resource.parameterEncoding
    self.method = resource.method
    self.parameters = resource.parameters
    self.headers = resource.headers
  }
  
}

enum Encoding: String {
  
  case url = "URL"
  case json = "JSON"
  
  func scheme() -> ParameterEncoding {
    switch self{
    case .url:
      return URLEncoding.default
    case .json:
      return JSONEncoding.default
    }
  }
  
}
