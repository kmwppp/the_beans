//
//  SignUpSecondModel.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//
import Foundation
import Combine
import SwiftUI

struct SignUpSecondModel: Codable,Hashable {
    
    var showing = false
    
    var email:String = ""
    var emailCheck:Bool = false
    
    var password:String = ""
    var confirmPassword:String = ""
    var passwordCheck = false
    
    var storeName:String = ""
    var phoneNum:String = ""
    var sendMessage = false
    var regNum:String = ""
    var road:String = ""
    var zipCode:String = ""
    var detailAddress = ""
    
    var secretNum = ""
    var secretNumChk = ""
    var secretNumChkBool = false
}
