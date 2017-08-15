
//  Token.swift
//
//  Created by Sanjay Maharjan on 10/20/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Token
 
 Attributes- 
 - **`accessToken`**: `String`
 - **`refreshToken`**: `String`
 - **`expiryDate`**: `String?`
 */
class Token: NSObject, NSCoding {
  var accessToken: String = ""
  var refreshToken: String = ""
  var expiryDate: String?
  
  override init() {
    super.init()
  }
  
  fileprivate func commonInit(_ accessToken: String, refreshToken: String) {
    self.accessToken = accessToken
    self.refreshToken = refreshToken
  }
  
  required init(coder aDecoder: NSCoder) {
    guard let accessToken = aDecoder.decodeObject(forKey: UserDefaultsKeyConstants.accessToken) as? String, let refreshToken = aDecoder.decodeObject(forKey: UserDefaultsKeyConstants.refreshToken) as? String else {
      return
    }
    self.accessToken = accessToken
    self.refreshToken = refreshToken
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(accessToken, forKey: UserDefaultsKeyConstants.accessToken)
    aCoder.encode(refreshToken, forKey: UserDefaultsKeyConstants.refreshToken)
  }

}

// MARK: Initializer with Paramters, JSON and NSData

extension Token {
  
  convenience init(accessToken: String, refreshToken: String) {
    self.init()
    commonInit(accessToken, refreshToken: refreshToken)
  }
  
  convenience init(withJSON json: JSON) {
    self.init()
    let accessToken = json["data"]["accessToken"].stringValue
    let refreshToken = json["data"]["refreshToken"].stringValue
    commonInit(accessToken, refreshToken: refreshToken)
  }

  convenience init(withData data: Data) {
    let json = JSON(data: data)
    self.init(withJSON: json)
  }

}

//MARK: Refresh Token request resource

extension Token {
  /// Resource for requesting new the access token
  class func requestToken() -> Resource<Token> {
    return Resource<Token>(
      url: URLConstants.accessToken,
      parseJSON: { data in
        let newToken = Token(withData: data)        
        TokenManager.sharedInstance.update(newToken)
        return nil
      },
      method: .post,
      parameterEncoding: .json,
      parameters: HeadersComposer.getHeaderWithRefreshToken() as RequestParameters,
      headers: nil
    )
  }
}
