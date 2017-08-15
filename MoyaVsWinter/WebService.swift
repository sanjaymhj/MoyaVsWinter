//
//
//  WebService.swift
//  NetworkingPop
//
//  Created by Sanjay Maharjan on 10/19/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias RequestParameters = Any//[String: AnyObject]
typealias RequestMethod = Alamofire.Method

enum MyResult<A> {
  case success(A)
  case failure(NSError)
}

/**
 Webservice
 
 Takes the **`Resource<A>`** and executes the **`(Result<A?, NSError>) -> ()`** completion closure.
 */
final class Webservice {

  
  func request<A>(_ resource: Resource<A>, completion: @escaping (MyResult<A?>) -> ()) {
  
    var newResource = resource.makeCopy()//Resource(withResource: resource)
    
    // Update Header
    let headers = [
      "Content-Type": "application/json"
    ]
//    newResource.headers?.update(headers)

    
    //    if let _ = newResource.headers {
//      newResource.headers!.update(headers)
//    } else {
//      newResource.headers = headers
//    }
    
    newResource.headers = newResource.headers?.updated(headers) ?? headers
    
    var url: URL
    let baseURL: URL = URL(string: newResource.url)!
    
    var newRequest: URLRequest// = URLRequest(url: baseURL)
    var jsonParameter: Data?

    switch newResource.parameterEncoding {
    case .url:
      if let baseParam = (newResource.parameters as? Dictionary<String, String>)?.stringFromHttpParameters() {
        
        url = URL(string: "\(newResource.url)?\(baseParam)")!
        jsonParameter = nil
      } else {
        url = baseURL
      }

    case .json:
      if let parameter = newResource.parameters {
        do {
          jsonParameter = try JSONSerialization.data(withJSONObject: parameter)
        } catch {
          print(error.localizedDescription)
          return
        }
      } else {
        jsonParameter = nil
      }
      url = baseURL
      
    }
    dump(resource)
    // NOTE: Done customly instead of using Alamofire url encoding because Alamofire doesnot support `Any` as Parameter  
    newRequest = URLRequest(url: url)
    newRequest.httpBody = jsonParameter
    newRequest.httpMethod = newResource.method.rawValue
    newRequest.allHTTPHeaderFields = newResource.headers
    
    Alamofire.request(newRequest
      ).responseString { (webResponse) in
      guard let response = webResponse.response else {
        let responseCode = ErrorCode.noResponse
        completion(MyResult.failure(NSError(domain: "NoResponse", code: responseCode.rawValue)))
        return
      }
      guard let data = webResponse.data, let responseCode = ResponseCode(rawValue: response.statusCode) else {
        let responseCode = ErrorCode.noResponse
        completion(MyResult.failure(NSError(domain: "NoResponse", code: responseCode.rawValue)))
        return
      }
      print(JSON(data: data))
      switch responseCode {
      case .responseOK:
        let resourceObject = newResource.parse(data)
        completion(MyResult.success(resourceObject))
        return
      case .authenticationError:
        let refreshTokenResource = Token.requestToken()
        Webservice().request(refreshTokenResource, completion: { result in
          switch result {
          case .success(_):
            newResource.headers?.update(HeadersComposer.getShortHeader())
            Webservice().request(newResource, completion: { result in
              switch result {
              case .success(let resourceObject):
                completion(MyResult.success(resourceObject))
              case .failure(_):
                let webError = WebServiceError(withData: data)
                let error = NSError(domain: responseCode.domain(), code: webError.code)
                completion(MyResult.failure(error))
              }
            })
          case .failure(_):
            let webError = WebServiceError(withData: data)
            let expiredRefresh = ResponseCode.unauthorizedAccess
            let error = NSError(domain: responseCode.domain(), code: webError.code)
            completion(MyResult.failure(error))
            let accessDeniedNotification = Notification(name: Notification.Name(rawValue: expiredRefresh.domain()), object: nil)
            NotificationCenter.default.post(accessDeniedNotification)
          }
        })
      case .unauthorizedAccess, .internalServerError:
        let accessDeniedNotification = Notification(name: Notification.Name(rawValue: responseCode.domain()), object: nil)
        NotificationCenter.default.post(accessDeniedNotification)
        fallthrough
      default:
        let webError = WebServiceError(withData: data)
        let error = NSError(domain: responseCode.domain(), code: webError.code)
        completion(MyResult.failure(error))
      }
      
    }
  }
  
}
