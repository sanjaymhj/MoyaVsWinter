//
//  HeaderComposer.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation

struct HeadersComposer {
  
  static func getShortHeader() -> [String: String] {
    var returnHeaders: [String: String] = [:]
    guard let token = TokenManager.sharedInstance.token else { return returnHeaders }
    returnHeaders["access-token"] = token.accessToken
    return returnHeaders
  }
  
  static func getHeaderWithRefreshToken() -> [String: String] {
    var returnHeaders: [String: String] = [:]
    guard let token = TokenManager.sharedInstance.token else { return returnHeaders }
    returnHeaders["refreshToken"] = token.refreshToken
    return returnHeaders
  }
  
  static func getHeaderWithAccessAndRefreshToken() -> [String: String] {
    var returnHeaders: [String: String] = [:]
    guard let token = TokenManager.sharedInstance.token else { return returnHeaders }
    returnHeaders["access-token"] = token.accessToken
    returnHeaders["refresh-token"] = token.refreshToken
    return returnHeaders
  }
  
}
