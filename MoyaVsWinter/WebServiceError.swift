//
//  WebServiceError.swift
//
//  Created by Subash Poudel on 1/5/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import SwiftyJSON

/**
 Response of WebService when
 */
class WebServiceError {
  let code: Int
  let message: String
  
  init(code: Int, message: String) {
    self.code = code
    self.message = message
  }
  
}

extension WebServiceError {
  
  convenience init(withJSON json: JSON) {
    let code = json["error"]["code"].intValue
    let message = json["error"]["message"].stringValue
    self.init(code: code, message: message)
  }
  
  convenience init(withData data: Data) {
    let json = JSON(data: data)
    self.init(withJSON: json)
  }
  
}
