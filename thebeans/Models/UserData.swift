//
//  UserDatra.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import Foundation

class UserData: ObservableObject{
    @Published var isLogin:Bool = false
    @Published var login_type:String = ""
    @Published var token:String = ""
    @Published var email:String = ""
    @Published var pw:String = ""
    @Published var business_name:String = ""
    @Published var phone:String = ""
    @Published var reg_number:String = ""
    @Published var address:String = ""
    @Published var address_detail:String = ""
    @Published var zipcode:String = ""
    @Published var MyPage_root:Bool = false
    @Published var FcmToken:String = ""
    @Published var userImageIs:Bool = false
    @Published var buy_root:Bool = false
}
