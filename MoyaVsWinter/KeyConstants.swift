//
//  KeyConstants.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation

/**
 For key for saving data to the UserDefaults
 - token
 - accessToken
 - refreshToken
 - expiryTime
 */

enum UserDefaultsKeyConstants {
  static let token = "token"
  static let accessToken = "accessToken"
  static let refreshToken = "refreshToken"
  static let expiryTime = "expiryTime"
  
  static let showIntroScreen = "showIntroScreen"
}
