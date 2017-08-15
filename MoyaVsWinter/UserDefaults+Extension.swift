//
//  UserDefaults+Extension.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//
//  NSUserDefaults+Extension.swift

import Foundation

extension UserDefaults {
  
  /// Archives the object into NSUserDefaults
  @discardableResult
  class func saveWithArchiving(_ object: AnyObject?, withKey key: String) -> Bool {
    guard let object = object else { return false }
    let data  = NSKeyedArchiver.archivedData(withRootObject: object)
    let defaults = UserDefaults.standard
    defaults.set(data, forKey: key)
    return UserDefaults.standard.synchronize()
    //    return true
  }
  
  
  /// Unarchives object from NSUserDefaults
  class func getObjectAfterUnarchiving(withKey key: String) -> AnyObject? {
    
    guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
      return nil
    }
    return NSKeyedUnarchiver.unarchiveObject(with: data) as AnyObject
  }
  
  /// Delete object from NSUserDefaults
  class func deleteObject(forKey key: String) {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: key)
  }
  
  /// Save object to NSUserDefaults
  @discardableResult
  class func save(_ key: String, value: AnyObject?) -> Bool {
    UserDefaults.standard.setValue(value, forKey: key)
    return UserDefaults.standard.synchronize()
  }
  /// Get object from NSUserDefaults
  class func getValue(_ key: String) -> AnyObject? {
    return UserDefaults.standard.object(forKey: key) as AnyObject
  }
  
}
