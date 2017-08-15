//
//  String+Extensions.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation
extension String {
  func addingPercentEncodingForURLQueryValue() -> String? {
    let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
    
    return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
  }
}
