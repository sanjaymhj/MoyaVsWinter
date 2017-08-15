
import Foundation

/**
 String Constants
 - CommonConstants
 - RegisterConstants
 - ValidationConstants
 - TabBar
 - SideBar
 - UserModelConstants
 - DateFormatConstants
 - DateAndTime
 - RefillPrescriptionConstants
 - RequestPrescriptionConstants
 - GuestTransferTVCConstants
 - RxRequestedStatusConstants
 - EmailValidationConstants
 - MixPanelTrackKeyword
 - RelationConstants
 - phoneNumberFormatUSA
 */

enum StringConstants {
  
  enum CommonConstants {
    static let firstName = NSLocalizedString("First Name", comment: "First Name")
    static let lastName = NSLocalizedString("Last Name", comment: "Last Name")
    static let password = NSLocalizedString("Password", comment: "Password")
    static let confirmPassword = NSLocalizedString("Confirm Password", comment: "Confirm Password")
    static let phone = NSLocalizedString("Phone", comment: "Phone")
    static let rxNumber = NSLocalizedString("RX Number", comment: "RX Number")
    static let chooseStore = NSLocalizedString("Choose Pickup Location", comment: "Choose Pickup Location")
    static let comments = NSLocalizedString("Comments", comment: "Comments")
    static let failed = NSLocalizedString("Failed", comment: "Failed")
    static let success = NSLocalizedString("Success", comment: "Success")
    static let email = NSLocalizedString("Email", comment: "Email")
    static let confirmEmail = NSLocalizedString("Confirm Email", comment: "Confirm Email")
    static let dateOfBirth = NSLocalizedString("Birthdate", comment: "Birthdate")
    static let verify = NSLocalizedString("Verify", comment: "Verify")
    static let invite = NSLocalizedString("Add a Person", comment: "Add a Person")
    static let cancel = NSLocalizedString("Cancel", comment: "Cancel")
    static let location = NSLocalizedString("Location", comment: "Location")
    static let accountAccess = NSLocalizedString("Account Access", comment: "Access Account")
    static let refill = NSLocalizedString("Refill", comment: "Refill")
    static let address = NSLocalizedString("Address", comment: "Address")
    static let city = NSLocalizedString("City", comment: "City")
    static let state = NSLocalizedString("State", comment: "State")
    static let zip = NSLocalizedString("Zip", comment: "Zip")
    static let policies = NSLocalizedString("Policies", comment: "Policies")
    
    static let birthDatePlaceHolder = NSLocalizedString("\(StringConstants.CommonConstants.dateOfBirth) (\(StringConstants.DateFormatConstants.dateToShowUser.uppercased()))", comment: "Birth Date Placeholder")
    
    static let relationType = NSLocalizedString("Relation Type", comment: "Relation Type")
    static let pickYourAddress = NSLocalizedString("Pick Your Address", comment: "Pick Your Address")
    static let submit = NSLocalizedString("Submit", comment: "Submit")
    static let changePickupLocation = NSLocalizedString("Change Pickup Location", comment: "Change Pickup Location")
    static let pickALocation = NSLocalizedString("Pick a Location", comment: "Pick a Location")
    
    static let privacyStatement = NSLocalizedString("Privacy Statement", comment: "Privacy Statement")
    static let termsOfUse = NSLocalizedString("Terms of Use", comment: "Terms of Use")
  }
  
  enum ValidationConstants {
    static let emptyPostFix = NSLocalizedString(" is not valid.", comment: "Not Valid")
    static let emailDontMatch = NSLocalizedString("Email doesnot match.", comment: "Email doesnot match.")
    static let passwordDontMatch = NSLocalizedString("Password doesnot match.", comment: "Password doesnot match.")
    static let newPasswordDontMatch = NSLocalizedString("New password doesnot match.", comment: "New password doesnot match")
    static let securityQuestionEmpty = NSLocalizedString("Please select a security question.", comment: "Select Security Question")
    
    static func getInvalidMessage(_ prefix: String) -> String {
      return prefix + ValidationConstants.emptyPostFix
    }
    
  }
  
  enum TabBar {
    static let prescription = NSLocalizedString("Prescriptions", comment: "Prescriptions")
    static let weeklyAds = NSLocalizedString("Weekly Ad", comment: "Weekly Ad")
    static let storeLocator = NSLocalizedString("Store Locator", comment: "Store Locator")
    static let familyMembers = NSLocalizedString("Family Members", comment: "Family Members")
    static let myStore = NSLocalizedString("My store", comment: "My Store")
    static let transferPrescription = NSLocalizedString("Transfer Prescription", comment: "Transfer Prescription")
  }
  
  enum SideBar {
    static let allPrescriptions = NSLocalizedString("All Prescriptions", comment: "All Prescriptions")
    static let transferPrescription = NSLocalizedString("Transfer Prescription", comment: "Transfer Prescription")
    static let weeklyAd = NSLocalizedString("Weekly Ad", comment: "Weekly Ad")
    static let storeLocator = NSLocalizedString("Store Locator", comment: "Store Locator")
    static let guestRefill = NSLocalizedString("Scan To Refill", comment: "")
    static let policies = NSLocalizedString("Policies", comment: "Policies")
    static let settings = NSLocalizedString("My Account", comment: "My Account")
    static let logout = NSLocalizedString("Logout", comment: "Logout")
  }
  
  enum UserModelConstants {
    static let userModelNSDefaultName = NSLocalizedString("userModelNSDefaultName", comment: "userModelNSDefaultName")
    static let readTerms = NSLocalizedString("readTerms", comment: "readTerms")
    static let lastname = NSLocalizedString("lastname", comment: "lastname")
    static let notifyOnlyPrescription = NSLocalizedString("notifyOnlyPrescription", comment: "notifyOnlyPrescription")
    static let status = NSLocalizedString("status", comment: "status")
    static let firstname = NSLocalizedString("firstname", comment: "firstname")
    static let dateOfBirth = NSLocalizedString("dateOfBirth", comment: "dateOfBirth")
    static let latitude = NSLocalizedString("latitude", comment: "latitude")
    static let address = NSLocalizedString("address", comment: "address")
    static let city = NSLocalizedString("city", comment: "city")
    static let state = NSLocalizedString("state", comment: "state")
    static let zip = NSLocalizedString("zip", comment: "zip")
    static let securityQuestionId = NSLocalizedString("securityQuestionId", comment: "securityQuestionId")
    static let id = NSLocalizedString("id", comment: "id")
    static let patientId = NSLocalizedString("patientId", comment: "patientId")
    static let notifyAll = NSLocalizedString("notifyAll", comment: "notifyAll")
    static let email = NSLocalizedString("email", comment: "email")
    static let longitude = NSLocalizedString("longitude", comment: "longitude")
    static let phone = NSLocalizedString("phone", comment: "phone")
    static let relationTypeId = NSLocalizedString("relationTypeId", comment: "relationTypeId")
    static let relationDescription = NSLocalizedString("relationDescription", comment: "relationDescription")
    static let preferredStoreNumber = NSLocalizedString("preferredStoreNumber", comment: "preferredStoreNumber")
    static let parentUserId = NSLocalizedString("parentUserId", comment: "parentUserId")
    static let createdDate = NSLocalizedString("createdDate", comment: "createdDate")
    static let securityAnswer = NSLocalizedString("securityAnswer", comment: "securityAnswer")
    static let groupId = NSLocalizedString("groupId", comment: "groupId")
    static let createdBy = NSLocalizedString("createdBy", comment: "createdBy")
    static let storeNumber = NSLocalizedString("storeNumber", comment: "storeNumber")
    static let resetToken = NSLocalizedString("resetToken", comment: "resetToken")
    static let legacyUser = NSLocalizedString("legacyuser", comment: "legacyuser")
    static let familyMemberToken = NSLocalizedString("familymembertoken", comment: "familymembertoken")
  }
  
  enum DateFormatConstants {
    static let nsDateFormat = NSLocalizedString("yyyy-MM-dd", comment: "yyyy-MM-dd")
    static let serverDateFormat = NSLocalizedString("MM/dd/yyyy", comment: "MM/dd/yyyy")
    static let dateToShowUser = NSLocalizedString("MM-dd-yyyy", comment: "MM-dd-yyyy")
    static let pickupDateFormat = NSLocalizedString("EEE, MMM dd", comment: "EEE, MMM dd")
    static let pickupTimeFormat = NSLocalizedString("hh:mm a", comment: "hh:mm a")
    static let bulkRefillPickupTimeFormat = NSLocalizedString("h:mm a", comment: "hh:mm a")
    static let utcFormat = NSLocalizedString("yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ", comment: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ")
  }
  
  enum DateAndTime {
    static let datePlaceHolder = NSLocalizedString("Choose Date", comment: "Choose Date")
    static let timePlaceHolder = NSLocalizedString("Choose Time", comment: "Choose Time")
  }
  
  enum RefillPrescriptionConstants {
    static let requestRefill = NSLocalizedString("Request Refill", comment: "Request Refill")
    static var requestRefillCapitalized: String {
      return StringConstants.RefillPrescriptionConstants.requestRefill.uppercased()
    }
    static let refill = NSLocalizedString("Refill", comment: "Refill")
    static var refillCapitalized: String {
      return StringConstants.RefillPrescriptionConstants.refill.uppercased()
    }
    static var refillNowCapitalized: String {
      return StringConstants.RefillPrescriptionConstants.refillNow.uppercased()
    }
    static var refillNow: String {
      return "Refill Now"
    }
    static let selectPickupDate = NSLocalizedString("Select pickup date", comment: "")
    static let selectPickupTime = NSLocalizedString("Select pickup time", comment: "")
    static let rxAttributeNotSelected = NSLocalizedString("RxAttribute not selected", comment: "")
    static let storeNotSelected = NSLocalizedString("Store not selected", comment: "")
    static let cannotRefillPrescription = NSLocalizedString("Cannot refill prescription", comment: "")
  }
  
  enum RequestPrescriptionConstants {
    static let requestPrescription = NSLocalizedString("Request Refill", comment: "")
  }
  
  enum GuestTransferTVCConstants {
    static let transfer = NSLocalizedString("Transfer", comment: "")
    static let transferPrescription = NSLocalizedString("Transfer Prescription", comment: "")
    static let guestTransferSuccessful = NSLocalizedString("Guest Transfer Success", comment: "")
    static let cannotTransferPrescription = NSLocalizedString("Cannot Transfer Prescription", comment: "")
    static let rxNumber = NSLocalizedString("RX Number", comment: "")
    static let rxNumberPlaceHolder = NSLocalizedString("Prescription Number or Prescription Name", comment: "")
    static let rxName = NSLocalizedString("RX Name (Optional)", comment: "")
    static let selectRxStatus = NSLocalizedString("Select RX Status", comment: "")
    static let previousStoreName = NSLocalizedString("Pharmacy Name", comment: "")
    static let previousStorePhone = NSLocalizedString("Pharmacy Phone Number", comment: "")
    static let selectPickupDate = NSLocalizedString("Select pickup date", comment: "")
    static let contactDoctor = NSLocalizedString("Contact Doctor if no refill (This may take 24-48 hours to complete)", comment: "")
    static let doctorName = NSLocalizedString("Doctor's Name", comment: "")
    static let doctorPhone = NSLocalizedString("Doctor's Phone Number", comment: "")
  }
  
  enum RxRequestedStatusConstants {
    static let fillPrescription = NSLocalizedString("Fill Prescription", comment: "")
    static let holdForFutureUse = NSLocalizedString("Hold for future use", comment: "")
  }
  
  enum EmailValidationConstants {
    static let userExistsTitle = NSLocalizedString("User already exists", comment: "")
    static func userExistsMessageWithEmail(_ email: String) -> String {
      return "Do you want to invite \(email) as a family member?"
    }
  }
  
  enum MixPanelTrackKeyword {
    static let refillAsUser = NSLocalizedString("User Refill", comment: "")
    static let refillAsGuest = NSLocalizedString("Guest Refill", comment: "")
    static let transferAsUser = NSLocalizedString("User Transfer", comment: "")
    static let transferAsGuest = NSLocalizedString("Guest Transfer", comment: "")
    static let successfulLogin = NSLocalizedString("Successful login", comment: "")
    static let successfulRegister = NSLocalizedString("Successful Registration", comment: "")
  }
  
  static let emailSectionHeader = NSLocalizedString("Unique email that is not associated with any current user.", comment: "")
  
  static let phoneNumberFormatUSA = NSLocalizedString("(***) ***-****", comment: "")
  static let NA = "N/A"
    
  enum ButtonConstants {
    static let submitAllRefillButtonText = NSLocalizedString("Submit All", comment: "")
  }
  
}
//
//  StringConstants.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/11/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation
