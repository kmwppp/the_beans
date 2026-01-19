//
//  LoginViewVM.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import Foundation
import Combine
import SwiftUI

class LoginViewVM: ObservableObject {
    
    private var store = Set<AnyCancellable>()
    
    @Published var backgroundScale = CurrentValueSubject<CGFloat, Never>(1.0)
    @Published var id = CurrentValueSubject<String, Never>("")
    @Published var password = CurrentValueSubject<String, Never>("")
    @Published var clickLoginButton = CurrentValueSubject<Bool, Never>(false)
    @Published var loginType = CurrentValueSubject<String, Never>("")
    
    @Published var pageNum = 1
    @Published var firstClicked = false
    @Published var clickLoginBtn = false
    
    @Published var findPassword = false
    @Published var signUp = false
    
    func clickedStartButton() -> Void{
        if firstClicked == false {
            withAnimation{
                self.pageNum = 2
                self.backgroundScale.value += 0.3
            }
        }
        firstClicked = true
    }
    
    func clickedBackButton() -> Void {
        withAnimation(.easeOut(duration: 1)){
            clickLoginButton.value = false
            clickLoginBtn = false
            loginType.value = ""
            id.value = ""
            password.value = ""
        }
    }
    
    //LoginSelectButtonView
    func clickedSelectButton(_ loginType:String) -> Void {
        withAnimation(.easeInOut(duration: 1)){
            clickLoginButton.value = true
            clickLoginBtn = true
        }
        self.loginType.value = loginType
    }
    
    func clickedLoginButton() -> Void {
        print(id.value)
        print(password.value)
    }
    
    func clickedFindPassword() -> Void {
        findPassword = true
    }
    
    func clickedSignUp() -> Void {
        signUp = true
    }
}
