//
//  Dictionary+Extension.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation

extension Dictionary {
  
  /// Update the value of the existing dictionary with the new dictionary, if key exist update the old value, if key doesnot exists, add new key value pair.
  ///
  /// - Parameter other: Second Dictionary to update to self
  mutating func update(_ other: Dictionary) {
    for (key, value) in other {
      self.updateValue(value, forKey:key)
    }
  }
  
  mutating func updated(_ other: Dictionary) -> Dictionary {
    self.update(other)
    return self
  }
  
  /// Converts the dictionary to query string
  ///
  /// - Returns: Query string
  func stringFromHttpParameters() -> String {
    let parameterArray = self.map { (key, value) -> String in
      let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
      let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
      return "\(percentEscapedKey)=\(percentEscapedValue)"
    }
    
    return parameterArray.joined(separator: "&")
  }
  
}



extension Optional where Wrapped == Dictionary<String, Any> {
  
  /// Update self with the provided dictionary.
  ///
  ///
  /// If `nil`, sets itself to the provided dictionary.
  /// - Parameter other: Second Dictionary to update to self
  mutating func update(_ other: Dictionary<String, Any>) {
    guard self != nil else {
      self = other
      return
    }
    
    self!.update(other)
  }
  
  
  /// <#Description#>
  ///
  /// - Parameter other: <#other description#>
  /// - Returns: <#return value description#>
  mutating func updated(_ other: Dictionary<String, Any>) -> Dictionary<String, Any>? {
    guard self != nil else {
      self = other
      return nil
    }
    
    return self!.updated(other)
  }
}

