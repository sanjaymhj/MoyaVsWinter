//
//  User.swift
//
//  Created by Sanjay Maharjan on 11/2/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//
import SwiftyJSON
import Foundation

class User: NSObject, NSCoding {
  
  fileprivate(set) var readTerms: String
  fileprivate(set) var lastname: String
  fileprivate(set) var notifyOnlyPrescription: String
  fileprivate(set) var status: String
  fileprivate(set) var firstname: String
  fileprivate(set) var dateOfBirth: String
  fileprivate(set) var storeNumber: String
  fileprivate(set) var latitude: String
  fileprivate(set) var address: String
  fileprivate(set) var city: String
  fileprivate(set) var state: USState
  fileprivate(set) var zip: String
  fileprivate(set) var securityQuestionId: String
  fileprivate(set) var resetToken: String
  fileprivate(set) var id: String
  fileprivate(set) var patientId: String
  fileprivate(set) var notifyAll: String
  fileprivate(set) var email: String
  fileprivate(set) var longitude: String
  fileprivate(set) var phone: String
  fileprivate(set) var relationTypeId: Int
  fileprivate(set) var createdDate: String
  fileprivate(set) var parentUserId: String
  fileprivate(set) var createdBy: String
  fileprivate(set) var groupId: String
  fileprivate(set) var isLegacyUser: Bool
  fileprivate(set) var familyMemberToken: String
  
  var fullName: String {
    return "\(firstname) \(lastname)".uppercased()
  }
  
  var formattedPhoneNumber: String? {
    get {
      return nil//return phone.formattedPhoneNumberIn(StringConstants.phoneNumberFormatUSA)
    }
  }
  
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(readTerms, forKey: StringConstants.UserModelConstants.readTerms)
    aCoder.encode(lastname, forKey: StringConstants.UserModelConstants.lastname)
    aCoder.encode(notifyOnlyPrescription, forKey: StringConstants.UserModelConstants.notifyOnlyPrescription)
    aCoder.encode(status, forKey: StringConstants.UserModelConstants.status)
    aCoder.encode(firstname, forKey: StringConstants.UserModelConstants.firstname)
    aCoder.encode(dateOfBirth, forKey: StringConstants.UserModelConstants.dateOfBirth)
    aCoder.encode(latitude, forKey: StringConstants.UserModelConstants.latitude)
    aCoder.encode(address, forKey: StringConstants.UserModelConstants.address)
    aCoder.encode(city, forKey: StringConstants.UserModelConstants.city)
    aCoder.encode(state.rawValue, forKey: StringConstants.UserModelConstants.state)
    aCoder.encode(zip, forKey: StringConstants.UserModelConstants.zip)
    aCoder.encode(securityQuestionId, forKey: StringConstants.UserModelConstants.securityQuestionId)
    aCoder.encode(id, forKey: StringConstants.UserModelConstants.id)
    aCoder.encode(patientId, forKey: StringConstants.UserModelConstants.patientId)
    aCoder.encode(notifyAll, forKey: StringConstants.UserModelConstants.notifyAll)
    aCoder.encode(email, forKey: StringConstants.UserModelConstants.email)
    aCoder.encode(longitude, forKey: StringConstants.UserModelConstants.longitude)
    aCoder.encode(phone, forKey: StringConstants.UserModelConstants.phone)
    aCoder.encode(String(relationTypeId), forKey: StringConstants.UserModelConstants.relationTypeId)
    aCoder.encode(parentUserId, forKey: StringConstants.UserModelConstants.parentUserId)
    aCoder.encode(createdDate, forKey: StringConstants.UserModelConstants.createdDate)
    aCoder.encode(groupId, forKey: StringConstants.UserModelConstants.groupId)
    aCoder.encode(createdBy, forKey: StringConstants.UserModelConstants.createdBy)
    aCoder.encode(storeNumber, forKey: StringConstants.UserModelConstants.storeNumber)
    aCoder.encode(resetToken, forKey: StringConstants.UserModelConstants.resetToken)
    aCoder.encode(isLegacyUser ? "true": "false", forKey: StringConstants.UserModelConstants.legacyUser)
    aCoder.encode(familyMemberToken, forKey: StringConstants.UserModelConstants.familyMemberToken)
  }
  
  required init?(coder aDecoder: NSCoder) {
    guard let readTerms = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.readTerms) as? String,
      let lastname = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.lastname) as? String,
      let notifyOnlyPrescription = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.notifyOnlyPrescription) as? String,
      let status = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.status) as? String,
      let firstname = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.firstname) as? String,
      let dateOfBirth = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.dateOfBirth) as? String,
      let latitude = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.latitude) as? String,
      let address = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.address) as? String,
      let city = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.city) as? String,
      let state = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.state) as? String,
      let zip = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.zip) as? String,
      let securityQuestionId = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.securityQuestionId) as? String,
      let id = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.id) as? String,
      let patientId = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.patientId) as? String,
      let notifyAll = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.notifyAll) as? String,
      let email = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.email) as? String,
      let longitude = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.longitude) as? String,
      let phone = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.phone) as? String,
      let relationTypeId = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.relationTypeId) as? String,
      let parentUserId = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.parentUserId) as? String,
      let createdDate = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.createdDate) as? String,
      let groupId = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.groupId) as? String,
      let createdBy = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.createdBy) as? String,
      let storeNumber = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.storeNumber) as? String,
      let resetToken = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.resetToken) as? String,
      let isLegacyUser = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.legacyUser) as? String,
      let familyMemberToken = aDecoder.decodeObject(forKey: StringConstants.UserModelConstants.familyMemberToken) as? String
      else {
        print("Can't decode")
        return nil
    }
    
    self.readTerms = readTerms
    self.lastname = lastname
    self.notifyOnlyPrescription = notifyOnlyPrescription
    self.status = status
    self.firstname = firstname
    self.dateOfBirth = dateOfBirth
    self.latitude = latitude
    self.address = address
    self.city = city
    self.state = USState.initFromShortHand(state)
    self.zip = zip
    self.securityQuestionId = securityQuestionId
    self.id = id
    self.patientId = patientId
    self.notifyAll = notifyAll
    self.email = email
    self.longitude = longitude
    self.phone = phone
    self.relationTypeId = Int(relationTypeId) ?? 1
    self.parentUserId = parentUserId
    self.createdDate = createdDate
    self.groupId = groupId
    self.createdBy = createdBy
    self.storeNumber = storeNumber
    self.resetToken = resetToken
    self.isLegacyUser = isLegacyUser == "true" ? true: false
    self.familyMemberToken = familyMemberToken
  }
  
  init(withJSON json: JSON) {
    readTerms = json["readTerms"].stringValue
    lastname = json["lastname"].stringValue
    notifyOnlyPrescription = json["notifyOnlyPrescription"].stringValue
    status = json["status"].stringValue
    firstname = json["firstname"].stringValue
    dateOfBirth = json["dateOfBirth"].stringValue
    latitude = json["latitude"].stringValue
    address = json["address"].stringValue
    city = json["city"].stringValue
    state = USState.initFromShortHand(json["state"].stringValue)
    zip = json["zip"].stringValue
    securityQuestionId = json["securityQuestionId"].stringValue
    id = json["id"].stringValue
    patientId = json["patientId"].stringValue
    notifyAll = json["notifyAll"].stringValue
    email = json["email"].stringValue
    longitude = json["longitude"].stringValue
    phone = json["phone"].stringValue
    relationTypeId = json["relationTypeId"].intValue
    parentUserId = json["parentUserId"].stringValue
    createdDate = json["createdDate"].stringValue
    groupId = json["groupId"].stringValue
    createdBy = json["createdBy"].stringValue
    storeNumber = json["storeNumber"].stringValue
    resetToken = json["resetToken"].stringValue
    isLegacyUser = json["isLegacyUser"].boolValue
    familyMemberToken = json["familyMemberToken"].stringValue
    super.init()
  }
  
  func updateStoreNumber(_ storeNumber: String) {
    self.storeNumber = storeNumber
  }
  
}
extension User {
  
  convenience init(withData data: Data) {
    let json = JSON(data: data)
    let dataJSON = json["data"]["userDetail"]
    self.init(withJSON: dataJSON)
  }
  
  func isAccountOwner() -> Bool {
    return parentUserId.isEmpty
  }
  
  // NSUserDefaults methods
//  class func saveUserData(_ user: User) {
//    let isSaved = UserDefaults.saveWithArchiving(user, withKey: StringConstants.UserModelConstants.userModelNSDefaultName)
//    print(isSaved)
//  }
//  
//  class func getSavedUserData() -> User? {
//    guard let user = UserDefaults.getObjectAfterUnarchiving(withKey: StringConstants.UserModelConstants.userModelNSDefaultName) as? User else { return nil }
//    return user
//  }
//  
//  class func isUserLoggedIn() -> Bool {
//    guard let _ = UserDefaults.getObjectAfterUnarchiving(withKey: StringConstants.UserModelConstants.userModelNSDefaultName) as? User else { return false }
//    return true
//  }
//  class func deleteUserData() {
//    UserDefaults.deleteObject(forKey: StringConstants.UserModelConstants.userModelNSDefaultName)
//    TokenManager.deleteTokenData()
//  }
  
}

extension User {
  
  // Resource for login
  static var login = Resource<LoginData>(
    url: URLConstants.login,
    parseJSON: { data in
      let json = JSON(data: data)
      return LoginData(withData: data)
  },
    method: .post,
    parameterEncoding: .json,
    parameters: nil,
    headers: nil)
  
  static func loginParameters(withUserEmail email: String, password: String) -> RequestParameters {
    var parameters = [String: String]()
    parameters["email"] = email
    parameters["password"] = password
    return parameters as RequestParameters
  }
  
//  static func getRegisterResource(registerModel: RegisterModel) -> Resource<User> {
//    let parameters = registerParameters(registerModel)
//    let resource = Resource<User>(
//      url: URLConstants.register,
//      parseJSON: { data -> User? in
//        return User(withData: data)
//    },
//      method: .post,
//      parameterEncoding: .json,
//      parameters: parameters,
//      headers: nil
//    )
//    return resource
//  }
//  
//  static func registerParameters(_ registerModel: RegisterModel) -> RequestParameters {
//    var parameters = [String: String]()
//    guard let storeNumber = registerModel.preferredStore?.storeNumber,
//      let securityQuestionId = registerModel.securityQuestion?.id else { return parameters as RequestParameters }
//    parameters["firstname"] = registerModel.firstName
//    parameters["lastname"] = registerModel.lastName
//    parameters["phone"] = registerModel.phone
//    parameters["dateOfBirth"] = registerModel.dateOfBirthServer
//    parameters["email"] = registerModel.emailAddress
//    parameters["address"] = registerModel.address ?? ""
//    parameters["zip"] = registerModel.zip ?? ""
//    parameters["city"] = registerModel.city ?? ""
//    parameters["state"] = registerModel.state?.shortHand() ?? ""
//    parameters["latitude"] = "" //latitude not required
//    parameters["longitude"] = "" //longitude not required
//    parameters["password"] = registerModel.password
//    parameters["rxNumber"] = registerModel.rxNumber
//    parameters["securityQuestionId"] = String(securityQuestionId)
//    parameters["securityAnswer"] = registerModel.securityAnswer
//    parameters["groupId"] = "1"
//    parameters["relationTypeId"] = registerModel.relationTypeId
//    parameters["storeNumber"] = storeNumber
//    parameters["status"] = "true"
//    if let familyToken = registerModel.familyToken {
//      parameters["familyMemberToken"] = familyToken
//    }
//    return parameters as RequestParameters
//  }
//  
//  static func getResourceForUpdateInfo(user: User, model: MyAccountTableViewModel) -> Resource<User>? {
//    let url = URLConstants.updateUserInformation(user)
//    guard let state = model.location.state else { return nil }
//    var parameters = [String: String]()
//    parameters["phone"] = model.phone
//    parameters["address"] = model.location.address
//    parameters["latitude"] = String(model.location.position.latitude)
//    parameters["longitude"] = String(model.location.position.longitude)
//    parameters["city"] = model.location.city
//    parameters["state"] = state.shortHand()
//    parameters["zip"] = model.location.zip
//    var resource = Resource<User>(
//      url: url,
//      parseJSON: { data -> User? in
//        return User(withData: data)
//    },
//      method: .put,
//      parameterEncoding: .json,
//      parameters: parameters as RequestParameters,
//      headers: HeadersComposer.getShortHeader()
//    )
//    resource.parameters = parameters as RequestParameters
//    return resource
//  }
  
  fileprivate static func resourceForUserWithURL(_ url: String) -> Resource<User> {
    let resource = Resource<User>(
      url: url,
      parseJSON: { data -> User? in
        return User(withData: data)
    },
      method: .get,
      parameterEncoding: .url,
      parameters: nil,
      headers: HeadersComposer.getShortHeader()
    )
    return resource
  }
  
  static func resourceForUser(_ user: User) -> Resource<User> {
    let url = URLConstants.userInfoFor(user: user)
    return resourceForUserWithURL(url)
  }
  
  static func resourceForParentOfUser(_ user: User) -> Resource<User> {
    let url = URLConstants.parentInfoOf(user: user)
    return resourceForUserWithURL(url)
  }
  
}


//
//  USState.swift
//
//  Created by Sanjay Maharjang on 12/22/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//

/**
 All the USState
 */
enum USState: String {
  case alabama = "Alabama"
  case alaska = "Alaska"
  case americanSamoa = "American Samoa"
  case arizona = "Arizona"
  case arkansas = "Arkansas"
  case california = "California"
  case colorado = "Colorado"
  case connecticut = "Connecticut"
  case delaware = "Delaware"
  case districtOfColumbia = "District Of Columbia"
  case federatedStatesOfMicronesia = "Federated States Of Micronesia"
  case florida = "Florida"
  case georgia = "Georgia"
  case guam = "Guam"
  case hawaii = "Hawaii"
  case idaho = "Idaho"
  case illinois = "Illinois"
  case indiana = "Indiana"
  case iowa = "Iowa"
  case kansas = "Kansas"
  case kentucky = "Kentucky"
  case louisiana = "Louisiana"
  case maine = "Maine"
  case marshallIslands = "Marshall Islands"
  case maryland = "Maryland"
  case massachusetts = "Massachusetts"
  case michigan = "Michigan"
  case minnesota = "Minnesota"
  case mississippi = "Mississippi"
  case missouri = "Missouri"
  case montana = "Montana"
  case nebraska = "Nebraska"
  case nevada = "Nevada"
  case newHampshire = "New Hampshire"
  case newJersey = "New Jersey"
  case newMexico = "New Mexico"
  case newYork = "New York"
  case northCarolina = "North Carolina"
  case northDakota = "North Dakota"
  case northernMarianaIslands = "Northern Mariana Islands"
  case ohio = "Ohio"
  case oklahoma = "Oklahoma"
  case oregon = "Oregon"
  case palau = "Palau"
  case pennsylvania = "Pennsylvania"
  case puertoRico = "Puerto Rico"
  case rhodeIsland = "Rhode Island"
  case southCarolina = "South Carolina"
  case southDakota = "South Dakota"
  case tennessee = "Tennessee"
  case texas = "Texas"
  case utah = "Utah"
  case vermont = "Vermont"
  case virginIslands = "Virgin Islands"
  case virginia = "Virginia"
  case washington = "Washington"
  case westVirginia = "West Virginia"
  case wisconsin = "Wisconsin"
  case wyoming = "Wyoming"
  
  static let all = [alabama, alaska, americanSamoa, arizona, arkansas, california, colorado, connecticut, delaware, districtOfColumbia, federatedStatesOfMicronesia, florida, georgia, guam, hawaii, idaho, illinois, indiana, iowa, kansas, kentucky, louisiana, maine, marshallIslands, maryland, massachusetts, michigan, minnesota, mississippi, missouri, montana, nebraska, nevada, newHampshire, newJersey, newMexico, newYork, northCarolina, northDakota, northernMarianaIslands, ohio, oklahoma, oregon, palau, pennsylvania, puertoRico, rhodeIsland, southCarolina, southDakota, tennessee, texas, utah, vermont, virginIslands, virginia, washington, westVirginia, wisconsin, wyoming]
  
  func containsFilter(_ string: String) -> Bool {
    return self.rawValue.contains(string)
  }
  
  func longHand() -> String {
    return self.rawValue
  }
  
  func shortHand() -> String {
    switch self {
    case .alabama: return "AL"
    case .alaska: return "AK"
    case .americanSamoa: return "AS"
    case .arizona: return "AZ"
    case .arkansas: return "AR"
    case .california: return "CA"
    case .colorado: return "CO"
    case .connecticut: return "CT"
    case .delaware: return "DE"
    case .districtOfColumbia: return "DC"
    case .federatedStatesOfMicronesia: return "FM"
    case .florida: return "FL"
    case .guam: return "GU"
    case .georgia: return "GA"
    case .hawaii: return "HI"
    case .idaho: return "ID"
    case .illinois: return "IL"
    case .indiana: return "IN"
    case .iowa: return "IA"
    case .kansas: return "KS"
    case .kentucky: return "KY"
    case .louisiana: return "LS"
    case .maine: return "ME"
    case .marshallIslands: return "MH"
    case .maryland: return "MD"
    case .massachusetts: return "MA"
    case .michigan: return "MI"
    case .minnesota: return "MN"
    case .mississippi: return "MS"
    case .missouri: return "MO"
    case .montana: return "MT"
    case .nebraska: return "NE"
    case .nevada: return "NV"
    case .newHampshire: return "NH"
    case .newJersey: return "NJ"
    case .newMexico: return "NM"
    case .newYork: return "NY"
    case .northCarolina: return "NC"
    case .northDakota: return "ND"
    case .northernMarianaIslands: return "MP"
    case .ohio: return "OH"
    case .oklahoma: return "OK"
    case .oregon: return "OR"
    case .palau: return "PW"
    case .pennsylvania: return "PA"
    case .puertoRico: return "PR"
    case .rhodeIsland: return "RI"
    case .southCarolina: return "SC"
    case .southDakota: return "SD"
    case .tennessee: return "TN"
    case .texas: return "TX"
    case .utah: return "UT"
    case .vermont: return "VT"
    case .virginIslands: return "VI"
    case .virginia: return "VA"
    case .washington: return "WA"
    case .westVirginia: return "WV"
    case .wisconsin: return "WI"
    case .wyoming: return "WY"
    }
  }
  
  static func initFromShortHand(_ state: String) -> USState {
    switch state {
    case "AL": return .alabama
    case "AK": return .alaska
    case "AS": return .americanSamoa
    case "AZ": return .arizona
    case "AR": return .arkansas
    case "CA": return .california
    case "CO": return .colorado
    case "CT": return .connecticut
    case "DE": return .delaware
    case "DC": return .districtOfColumbia
    case "FM": return .federatedStatesOfMicronesia
    case "FL": return .florida
    case "GU": return .guam
    case "GA": return .georgia
    case "HI": return .hawaii
    case "ID": return .idaho
    case "IL": return .illinois
    case "IN": return .indiana
    case "IA": return .iowa
    case "KS": return .kansas
    case "KY": return .kentucky
    case "LS": return .louisiana
    case "ME": return .maine
    case "MH": return .marshallIslands
    case "MD": return .maryland
    case "MA": return .massachusetts
    case "MI": return .michigan
    case "MN": return .minnesota
    case "MS": return .mississippi
    case "MO": return .missouri
    case "MT": return .montana
    case "NE": return .nebraska
    case "NV": return .nevada
    case "NH": return .newHampshire
    case "NJ": return .newJersey
    case "NM": return .newMexico
    case "NY": return .newYork
    case "NC": return .northCarolina
    case "ND": return .northDakota
    case "MP": return .northernMarianaIslands
    case "OH": return .ohio
    case "OK": return .oklahoma
    case "OR": return .oregon
    case "PW": return .palau
    case "PA": return .pennsylvania
    case "PR": return .puertoRico
    case "RI": return .rhodeIsland
    case "SC": return .southCarolina
    case "SD": return .southDakota
    case "TN": return .tennessee
    case "TX": return .texas
    case "UT": return .utah
    case "VT": return .vermont
    case "VI": return .virginIslands
    case "VA": return .virginia
    case "WA": return .washington
    case "WV": return .westVirginia
    case "WI": return .wisconsin
      
    case "WY": return .wyoming     default: return .washington //includes washington and fallback case
    }
  }
}

//
//  LoginData.swift
//
//  Created by Subash Poudel on 11/23/16.
//  Copyright © 2016 Leapfrog. All rights reserved.
//

import SwiftyJSON

/**
 Login Data
 
 This class holds the authentication data and user info of the loggined user.
 
 This class is the response of the login API
 */
class LoginData {
  
  var refreshToken: String
  var accessToken: String
  var userDetail: User
  var expireTime: String
  
  init(withJSON json: JSON) {
    let dataJson = json["data"]
    refreshToken = dataJson["refreshToken"].stringValue
    accessToken = dataJson["accessToken"].stringValue
    expireTime = dataJson["expireTime"].stringValue
    userDetail = User(withJSON: dataJson["userDetail"])
  }
  
}

extension LoginData {
  
  convenience init(withData data: Data) {
    self.init(withJSON: JSON(data: data))
  }
  
}


