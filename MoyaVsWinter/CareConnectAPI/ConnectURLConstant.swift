//
//  ConnectURLConstant.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/14/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation


enum ConnectURLConstant {
  
  static var baseURL: String {
    return "http://52.34.176.81:8602/api/"
  }
  static let legacyLogin = ConnectURLConstant.baseURL + "auth/login_legacy"
}
