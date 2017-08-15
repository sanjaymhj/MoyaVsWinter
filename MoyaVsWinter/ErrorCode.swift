//
//  ErrorCode.swift
//  MoyaVsWinter
//
//  Created by Sanjay Maharjan on 8/10/17.
//  Copyright © 2017 Leapfrog. All rights reserved.
//

/**
 This is a enum collection of all the server specific errors.
 Error in the response.
 
 ErrorCode noResponse: 1 for no Respose.
 */
enum ErrorCode: Int {
  
  // custom error codes
  case noResponse = 1
  
  case invalidInputParameter = 1000
  case postgres = 2000
  case joiValidation = 3000
  
  case invalidPassword = 10001
  case errorGeneratingToken = 10002
  case errorSendingEmail = 10003
  case errorCreatingPDF = 10004
  case errorPasswordEncryption = 10005
  case notAccountHolder = 10006
  case userDoesNotExist = 10007
  case prescriptionInfoNotAvailable = 10008
  case prescriptionInfoListNotAvailable = 10009
  case orderInfoDoesNotExist = 10010
  case patientDoesNotExist = 10011
  case patientProfileNotFound = 10012
  case notRefillable = 10013
  case invalidStoreInfo = 10014
  case newPasswordIdenticalToOldPassword = 10015
  case incorrectAnswer = 10016
  case userAlreadyExists = 10017
  case familyMemberAccountHolder = 10018
  case userAccontHolder = 10019
  case parentDoesNotExist = 10020
  case multipleToken = 10021
  case tokenNotFound = 10022
  case selfFamilyInvitation = 10023
  case notTransferable = 10024
  case firstnameMismatch = 10025
  case lastnameMismatch = 10026
  case dOBMismatch = 10027
  case emailExists = 10028
  case patientIdExists = 10029
  case faxError = 10030
  case deleteChildError = 10031
  case inactiveAccount = 10032
  case invalidPatient = 10033
  case invalidCredential = 10034
  case invalidFile = 10035
  case noPerscriptionStatement = 10036
  
  // Prescription Status Error
  case refillInProgress = 2
  case drugClassProhibitsRefill = 3
  case noRefillRemaining = 4
  case prescriptionExpired = 5
  case prescriptionHasBeenTransferred = 6
  case patientInactive = 7
  case tooSoonRefill = 8
  case noProductAssociatedWithPrescription = 10
  case mckessenFacility = 12
  
  static func getErrorMessageForCode(_ errorCode: Int) -> String {
    guard let error = ErrorCode(rawValue: errorCode) else { return "Unable to perform operation requested. ErrorCode: \(errorCode)" }
    var errorMessage = String()
    switch (error) {
    case .noResponse:
      return "There was problem connecting to internet. Please try again later."
    case invalidInputParameter:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .postgres:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .joiValidation:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .invalidPassword:
      errorMessage = "Incorrect username or password." //Update
    case .errorGeneratingToken:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .errorSendingEmail:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .errorCreatingPDF:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .errorPasswordEncryption:
      errorMessage = "There was an issue with your request. Please try again later." //Update
    case .notAccountHolder:
      errorMessage = "There is no user associated with that email address." //Update
    case .userDoesNotExist:
      errorMessage = "There is no user associated with that email address." //Update
    case .prescriptionInfoNotAvailable:
      errorMessage = "Prescription information not available." //Update
    case .prescriptionInfoListNotAvailable:
      errorMessage = "Prescription information not available." //Update
    case .orderInfoDoesNotExist:
      errorMessage = "Prescription information not available." //Update
    case .patientDoesNotExist:
      errorMessage = "Patient information not available." //Update
    case .patientProfileNotFound:
      errorMessage = "Patient information not available." //Update
    case .notRefillable:
      errorMessage = "Your Prescription is not refillable. Please contact your pharmacy." //Update
    case .invalidStoreInfo:
      errorMessage = "Invalid store information." //Update
    case .newPasswordIdenticalToOldPassword:
      errorMessage = "Your new password must be different than your current password." //Update
    case .incorrectAnswer:
      errorMessage = "Incorrect answer." //Update
    case .userAlreadyExists:
      errorMessage = "User already exists." //Update
    case .familyMemberAccountHolder:
      errorMessage = "User already associated with another family." //Update
    case .userAccontHolder:
      errorMessage = "There was an issue with your request. Please try again later."
    case .parentDoesNotExist:
      errorMessage = "There was an issue with your request. Please try again later."
    case .multipleToken:
      errorMessage = "There was an issue with your request. Please try again later."
    case .tokenNotFound:
      errorMessage = "There was an issue with your request. Please try again later."
    case .selfFamilyInvitation:
      errorMessage = "You are already the managing account holder for this family."
    case .notTransferable:
      errorMessage = "You cannot change the pickup location for this prescription."
    case .firstnameMismatch:
      errorMessage = "[REMOVE THIS ERROR]"
    case .lastnameMismatch:
      errorMessage = "Your last name must match as shown on medication container. Include any characters (EXAMPLES: #, *)."
    case .dOBMismatch:
      errorMessage = "Your birthdate does not match our records."
    case .emailExists:
      errorMessage = "This email already exists in the system."
    case .patientIdExists:
      errorMessage = "This user already exists in our system."
    case .faxError:
      errorMessage = "There was an issue with your request. Please try again later."
    case .deleteChildError:
      errorMessage = "There was an issue with your request. Please try again later."
    case .inactiveAccount:
      errorMessage = "There was an issue with your request. Please try again later."
    case .invalidPatient:
      errorMessage = "There was an issue with your request. Please try again later."
    case .invalidCredential:
      errorMessage = "The email address and/or password could not be found. Please enter a valid email address and password combination."
    case .invalidFile:
      errorMessage = "Invalid Legacy User excel file."
    case .noPerscriptionStatement:
      errorMessage = "No prescription statement found."
    case refillInProgress:
      errorMessage = "This prescription is currently being filled."
    case drugClassProhibitsRefill:
      errorMessage = "Drug class prohibits refills."
    case noRefillRemaining:
      errorMessage = "Prescription has no refills remaining."
    case prescriptionExpired:
      errorMessage = "Prescription is out of date or expired."
    case prescriptionHasBeenTransferred:
      errorMessage = "Prescription has been transferred."
    case patientInactive:
      errorMessage = "Prescription, patient or prescriber is inactive."
    case tooSoonRefill:
      errorMessage = "It is too soon to refill this prescription."
    case noProductAssociatedWithPrescription:
      errorMessage = "There is no product associated with this prescription."
    case mckessenFacility:
      errorMessage = "Store Information not available."
    }
    return errorMessage + " (Error Code: \(String(errorCode)))"
  }
  
  static let invalidLocation = "Invalid location selected."
  
}

