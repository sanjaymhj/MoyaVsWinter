//
//  TokenHandlerService.swift
//
//  Created by Sanjay Maharjan on 10/24/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//

import SwiftyJSON

/* Singleton object */
/**
 Token Manager
 
 **Singleton Object**
 
 It manages the token for user session persistance.
 */
class TokenManager {

  var token: Token?
  
  static let sharedInstance = TokenManager()
  
  fileprivate init() {
    guard let tokenObject = TokenManager.fromNSUserDefaults() else {
      token = nil
      return
    }
    self.token = tokenObject
  }
  
}

extension TokenManager {
  
  class func fromNSUserDefaults() -> Token? {
    return UserDefaults.getObjectAfterUnarchiving(withKey: UserDefaultsKeyConstants.token) as? Token
  }
  
  func saveData() {
    guard let token = token else { return }
    UserDefaults.saveWithArchiving(token, withKey: UserDefaultsKeyConstants.token)
  }
  
  func update(_ token: Token) {
    self.token = token
    saveData()
  }
  
  class func deleteTokenData() {
    UserDefaults.deleteObject(forKey: UserDefaultsKeyConstants.token)
  }
  
}
