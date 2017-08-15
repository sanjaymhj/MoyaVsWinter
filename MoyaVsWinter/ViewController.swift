//
//  ViewController.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

extension Moya.Response {
  func mapNSArray() throws -> NSArray {
    let any = try self.mapJSON()
    guard let array = any as? NSArray else {
      throw MoyaError.jsonMapping(self)
    }
    return array
  }
}



class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    request()
      // Do any additional setup after loading the view, typically from a nib.
  }
  
  func request() {
//    MProvider.request(.store) {
//      (result) in
//      do {
//        let response = try result.dematerialize()
//        let json = JSON(data: response.data)
//      } catch {
//        
//      }
//    }
    let email = "mohammednaved@lftechnology.com"
    let password = "N@ved123"
//
    MProvider.request(.login(username: email, password: password)) {
      (result) in
      do {
        dump(result)
        let response = try result.dematerialize()
        dump(response.statusCode)
        //          if ResponseCode.suc
        if ResponseCode.responseOK == ResponseCode(rawValue: response.statusCode) {
          let json = JSON(data: response.data)
          
        } else if ResponseCode.authenticationError == ResponseCode(rawValue: response.statusCode) {
          
        }
        let user = User(withData: response.data)
        dump(user)
      } catch let error {
        dump(error)
      }
    }
//    MProvider.request(.prescription) { (result) in
//      do {
//        dump(result)
//        let response = try result.dematerialize()
//        dump(response.statusCode)
//        //          if ResponseCode.suc
//        if ResponseCode.responseOK == ResponseCode(rawValue: response.statusCode) {
//          let json = JSON(data: response.data)
//          
//        } else if ResponseCode.authenticationError == ResponseCode(rawValue: response.statusCode) {
//          // go for refresh token
//        }
//        let user = User(withData: response.data)
//        dump(user)
//      } catch let error {
//        dump(error)
//      }
//
//    }
    let loginResource = User.loginResource(email: email, password: password)
    
    Webservice().request(loginResource) { (result) in
      switch result {
      case .success(let user):
        print("git the user object")
        dump(user)
      case .failure(let error):
        print("got the failure")
        debugPrint(error)
      }
    }
    let cEmail = "sanjaymaharjan@lftechnoloy.com"
    let cPassword = "Sanjay1234"
    let legacyLogin = LegacyLoginModel.getLegacyLoginResource(email: cEmail, password: cPassword)
    Webservice().request(legacyLogin) { (result) in
      switch result {
      case .success(let legacyItem):
        print(legacyItem ?? "")
      case.failure(let error):
        print(error)
      }
    }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

