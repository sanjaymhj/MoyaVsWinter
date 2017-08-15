//
//  MUser.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation
import Moya

var MProvider = MoyaProvider<AppAPI>()

enum MURLs {
  static var login = URL(string: URLConstants.login)!
  static var logout = URL(string: URLConstants.logout)!
  static var register = URL(string: URLConstants.register)!
  static var store = URL(string: URLConstants.securityQuestionList)!
}

//let googleProvider = MoyaProvider<another>()
//
//enum another: TargetType {
//  case .login:
//  
//  var baseURL: URL
//}

enum AppAPI: TargetType {
  case login(username: String, password: String)
  case logout
  case register(params: [String: Any])
  case store
  
  /// The target's base `URL`.
  var baseURL: URL {
    return URL(string: URLConstants.getBaseURL())!
  }
  
  /// The path to be appended to `baseURL` to form the full `URL`.
  var path: String {
    switch self {
    case .login:
      return "auth/login"
    case .logout:
      return "auth/logout"
    case .register:
      return "auth/register"
    case .store:
      return "mckesson/store-locator"
    }}
  
  /// The HTTP method used in the request.
  var method: Moya.Method {
    switch self {
    case .login:
      return .post
    case .logout:
      return .delete
    case .register:
      return .post
    case .store:
      return .get
    }
  }
  
  /// The parameters to be encoded in the request.
  var parameters: [String: Any]? { //[Any]
    switch self {
    case .login(let username, let password):
      return [
        "email": username as Any,
        "password": password as Any
      ]
    case .register(let params):
      return params
    default:
      return nil
    }
  }
  
  var param: [Any]? {
    return nil
  }
  
  /// The method used for parameter encoding.
  var parameterEncoding: ParameterEncoding {
    return URLEncoding.default
  }
  
  /// Provides stub data for use in testing.
  var sampleData: Data {
    return "From Test Data".data(using: String.Encoding.utf8)!
  }
  
  /// The type of HTTP task to be performed.
  var task: Task {
    return .request
  }
  
  /// Whether or not to perform Alamofire validation. Defaults to `false`.
  var validate: Bool { return false }

  
}
