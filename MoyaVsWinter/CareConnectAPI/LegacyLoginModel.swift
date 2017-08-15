//
//  LegacyLoginModel.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/14/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LegacyLoginModel {
  
  init(with data: Data) {
    let json = JSON(data: data)
    
  }
  
  static func getLegacyLoginResource(email: String, password: String) -> Resource<LegacyLoginModel> {
    
    let resource = Resource<LegacyLoginModel>(
      url: ConnectURLConstant.legacyLogin,
      parseJSON: { (data) -> LegacyLoginModel? in
        // Token handling
        let json = JSON(data: data)
      
        let id = json["_id"].stringValue
        let accessToken = json["access_token"].stringValue
        let refreshToken = json["refresh_token"].stringValue
        
        return nil//LegacyLoginModel(with: data)
    },
    method: .post,
    parameterEncoding: .json,
    parameters: ["email": email, "password": password],
    headers: nil)
    return resource
  }
}
