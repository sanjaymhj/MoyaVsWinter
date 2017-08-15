//
//  URLConstants.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

import Foundation

/**
 API endpoints used in the app
 
 Constants
 - weeklyAds
 - login
 - register
 - securityQuestionList
 - validateSecurityQuestion
 - forgotPassword
 - resetPassword
 - familyMembers
 - logout
 - accessToken
 - familyMemberTypeList
 - refill
 - transfer
 - storeLocator
 - rxInfo
 - decodeToken
 - validateEmail
 
 
 Functions
 - getBaseURL
 - getBaseURL(withUserIDOf: User) -> String
 - updatePassword
 - inviteFamilyMember
 - updateSecurityQuestion
 - detachParent
 - updateUserInformation
 - updatePreferredStore
 - detachFamilyMember
 - userInfoFor
 - parentInfoOf
 - getPatientProfileUrlFor
 - inviteExistingUser
 - addFamilyMember
 - resetFamilyMemberToken
 */
enum URLConstants {
  
  /**
   Base URL
   
   According on the scheme selected
   */
  static func getBaseURL() -> String {
    //Put you base url here
    return "baseURL"
  }
  
  static func getBaseURL(withUserIDOf user: User) -> String {
    return URLConstants.getBaseURL() + "users/\(user.id)/"
  }
  
  /**
   Login Endpoint
   
   Base URL + Login Endpoint
   */
  static let login = URLConstants.getBaseURL() + "auth/login"
  
  /**
   Register Endpoint
   
   Base URL + Register Endpoint
   */
  static let register = URLConstants.getBaseURL() + "auth/register"
  
  /**
   Security Question List EndPoint
   
   List of security questions
   */
  static let securityQuestionList = URLConstants.getBaseURL() + "security-questions"
  
  /**
   Validating Security Question
   
   This API validates the security question and answer given by user.
   */
  static let validateSecurityQuestion = URLConstants.getBaseURL() + "users/validate-security-question-answer"
  
  /**
   Forgot Password Endpoint
   
   This API sends email to the provided email for resetting password, without requirement of the old password.
   */
  static let forgotPassword = URLConstants.getBaseURL() + "users/forgot-password"
  
  /**
   Reset Password Endpoint
   
   Requires reset token
   This API changes password without old password.
   */
  static let resetPassword = URLConstants.getBaseURL() + "users/reset-password"
  
  /**
   Logout Endpoint
   */
  static let logout = URLConstants.getBaseURL() + "auth/logout"
  
  /**
   Access Token Endpoint
   
   Gets new the access token.
   */
  static let accessToken = URLConstants.getBaseURL() + "auth/access-token"
  
  /**
   Family Member Type list
   
   This API gives the type of the relation to be associated with the other family.
   */
  static let familyMemberTypeList = URLConstants.getBaseURL() + "relations"
  
  /**
   RxStatus Endpoint
   
   This API gives the type of detail of provided rx. Can be hit as a guest.
   */
  static let rxStatus = URLConstants.getBaseURL() + "mckesson/status"
  
  /**
   Family Member List EndPoint
   
   List the family member
   */
  static var familyMembers: String? {
    get {
//      guard let user = User.getSavedUserData() else { return nil }
//      let url = URLConstants.getBaseURL(withUserIDOf: user) + "family-members"
//      return url
      return nil
    }
  }
  
  /**
   Update Password Endpoint
   
   This API updates the password by verifying old password.
   
   Parameters -
   - User - User Object of whose password is to be changed.
   
   Returns -
   - String
   */
  static func updatePassword(_ user: User) -> String {
    let url = URLConstants.getBaseURL(withUserIDOf: user) + "password"
    return url
  }
  
  /**
   Invite Family Member End Point
   
   This API invites(send invitaion email) new family member for signup.
   */
  static func inviteFamilyMember(ofUser user: User) -> String {
    let url = URLConstants.getBaseURL(withUserIDOf: user) + "invite-new-user"
    return url
  }
  
  /**
   Update security question
   
   This API updates security question of the user
   */
  static func updateSecurityQuestion(ofUser user: User) -> String {
    let url = URLConstants.getBaseURL(withUserIDOf: user) + "security-question-answer"
    return url
  }
  
  /**
   Update User Personal Information Endpoint
   
   This API endpoint edits the Personal Information
   */
  static func updateUserInformation(_ user: User) -> String {
    let url = URLConstants.getBaseURL(withUserIDOf: user)
    return url
  }
  
  /**
   Update Preferred Store
   
   This API updates the preferred store.
   */
  static func updatePreferredStore(user: User) -> String {
    let url = URLConstants.getBaseURL(withUserIDOf: user) + "store-number"
    return url
  }
  
  /**
   Detach Parent Endpoint
   
   This API detaches current user from the parent associated.
   */
  static func detachParent(_ user: User) -> String {
    return URLConstants.getBaseURL(withUserIDOf: user) + "detach-parent"
  }
  
  /**
   Detach Family Member Endpoint
   
   This API detaches current user and selected family member.
   */
  static func detachFamilyMember(_ user: User) -> String {
    return URLConstants.getBaseURL(withUserIDOf: user) + "detach-family-member"
  }
  
  /**
   User Information Endpoint
   
   This API gives the user information of the user.
   */
  static func userInfoFor(user: User) -> String {
    return URLConstants.getBaseURL() + "users/\(user.id)"
  }
  
  /**
   Parent Information Endpoint
   
   This API gives the parent's information of the user
   */
  static func parentInfoOf(user: User) -> String {
    return URLConstants.getBaseURL(withUserIDOf: user) + "parent"
  }
  
  /**
   Patient Profile Endpoint
   
   This API gives the patient profile of the user/family member.
   */
  static func getPatientProfileUrlFor(_ user: User) -> String {
    let url = URLConstants.getBaseURL(withUserIDOf: user) + "patient-family-profile"
    return url
  }
  
  static let storeLocator = URLConstants.getBaseURL() + "mckesson/store-locator"
  
  /**
   RxInfo Endpoint
   
   This API gives the information of the given rxNumber
   */
  static let rxInfo = URLConstants.getBaseURL() + "mckesson/rxinfo"
  
  /**
   Decode Token Endpoint
   
   This API decodes the token and returns the corresponding JSON.
   */
  static let decodeToken = URLConstants.getBaseURL() + "users/decode-token"
  
  /**
   Validate Email Endpoint
   
   This API validates if given email is registered with any user.
   */
  static let validateEmail = URLConstants.getBaseURL() + "users/validate-email"
  
  /**
   Invite Existing User Endpoint
   
   This API invites the existing user as a family member.
   */
  static func inviteExistingUser(_ user: User) -> String {
    return getBaseURL() + "users/\(user.id)/invite-existing-user"
  }
  
  /**
   Family Member Association Endpoint
   
   This API adds the family member.
   */
  static func addFamilyMember(_ user: User) -> String {
    return getBaseURL(withUserIDOf: user) + "family-member"
  }
  
  /**
   Reset Family Member Association Endpoint
   
   This API reset the family member token. (Reject the family member invitation to be associated.)
   */
  static func resetFamilyMemberToken(_ user: User) -> String {
    return getBaseURL(withUserIDOf: user) + "reset-family-member-token"
  }
  
  /**
   Web View Links
   - privacyPolicy: Privacy Policy Link
   - termsOfUse: Pharmacy Terms of Use
   */
    /// For unarchiving the prescription
  static func unarchivePrescription(_ user: User) -> String {
    return getBaseURL(withUserIDOf: user) + "archive-prescription"
  }
  
  /// For archiving the prescription
  static func archivePrescription(_ user: User) -> String {
    return getBaseURL(withUserIDOf: user) + "archive-prescription"
  }
  
  static let bulkRefill = URLConstants.getBaseURL() + "mckesson/v2/refill"
  
}
