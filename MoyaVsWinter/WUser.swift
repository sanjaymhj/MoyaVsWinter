//
//  WUser.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Resoursable {
  var resource: Resource<Self> { get }
}

extension User {
  static func loginResource(email: String, password: String) -> Resource<User> {
    return Resource<User>(
      url: URLConstants.login,
      parseJSON: {
        (result) in
        print("got the result")
        dump(JSON(data: result))
        return User(withData: result)
      },
      method: .post,
      parameterEncoding: .json,
      parameters: ["email": email, "password": password],
      headers: nil)
  }
  
}
