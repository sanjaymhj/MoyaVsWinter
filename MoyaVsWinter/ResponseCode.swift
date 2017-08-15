//
//  ResponseCode.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation

enum ResponseCode: Int {
  
  //  200	Generic Sucess
  //  201	Created
  //  400	Bad Request	The request was invalid
  //  401	Authentication Error	Invalid user
  //  403	Forbidden Error	Unauthorized access
  //  404	Not Found	The specified resource does not exist
  //  500	Internal Server Error	The server encountered an internal error. Please retry the request.
  //  498 ERR_TOKEN
  //  409	ERR_CONFLICT
  
  
  //Possible Status code from API Server
  case responseOK = 200
  case created = 201
  case badRequest = 400
  case authenticationError = 401 //Expired Access Token
  case unauthorizedAccess = 403 //Expired Refresh Token
  case noResourceFound = 404
  case internalServerError = 500
  case errorConflict = 409
  case errorToken = 498
  
  func message() -> String {
    switch self {
    case .responseOK:
      return "Success"
    case .created:
      return "Created"
    case .badRequest:
      return "The request was invalid"
    case .authenticationError:
      return "Authentication Error"
    case .unauthorizedAccess:
      return "Unauthorized Access"
    case .noResourceFound:
      return "The specified resource does not exist"
    case .internalServerError:
      return "The server encountered an internal error. Please retry the request"
    case .errorConflict:
      return "Conflicting request"
    case .errorToken:
      return "Invalid token"
    }
  }
  
  func domain() -> String {
    switch self {
    case .responseOK:
      return "Success"
    case .created:
      return "Created"
    case .badRequest:
      return "InvalidRequest"
    case .authenticationError:
      return "AuthenticationError"
    case .unauthorizedAccess:
      return "UnauthorizedAccess"
    case .noResourceFound:
      return "NoResourceFound"
    case .internalServerError:
      return "InternalServerError"
    case .errorConflict:
      return "ConflictingRequest"
    case .errorToken:
      return "InvalidToken"
    }
  }
  
}

