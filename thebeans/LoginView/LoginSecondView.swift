//
//  LoginSecondView.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import Foundation
import SwiftUI

struct LoginSecondView: View {
    
    @EnvironmentObject var userData:UserData
    @ObservedObject var viewModel: LoginViewVM
    
    init(_ viewModel: LoginViewVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            
        VStack(spacing:0){
            VStack(spacing:25){
                HStack(spacing:25){
                    Rectangle()
                        .frame(width:UIScreen.main.bounds.width/2-70,height:1)
                        .foregroundColor(Color.white)
                    Text("시작하기")
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                    
                    Rectangle()
                        .frame(width:UIScreen.main.bounds.width/2-70,height:1)
                        .foregroundColor(Color.white)
                    
                }
                
                if(viewModel.clickLoginBtn == false){
                    LoginSelectButtonView(viewModel)
                }else{
                    LoginInsertView(viewModel)
//                        Insert_Login_info(isLogin: $isLogin, now_login: $now_login, login_type: $login_type).environmentObject(self.store)
                }
                
                    
                VStack(spacing:10){
                    Rectangle()
                        .frame(width:UIScreen.main.bounds.width-40,height:1)
                        .foregroundColor(Color.white)
                        
                    
                    HStack{
                        Text("아직 회원이 아니신가요?")
                            .font(.system(size: 12))
                            .foregroundColor(Color.white)
                        
                        
                        
                        NavigationLink(destination:
                                        SignUpFirstView().environmentObject(userData),isActive: $viewModel.signUp ,label: {
                            Text("회원가입")
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                                .underline()
                        })
                        
                    }
                    
                    if viewModel.clickLoginButton.value == true{
                        Button(action: viewModel.clickedBackButton){
                            Text("돌아가기")
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                                .underline()
                        }
                    }
                    
                    
                }
                
                .padding(.bottom,60)
                    
            }
        }
    }
}

struct LoginSelectButtonView: View {
    
    @ObservedObject var viewModel:LoginViewVM
    
    init(_ viewModel: LoginViewVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing:25){
            
            Button(action: {
                viewModel.clickedSelectButton("user")
            }, label: {
                Text("구독자")
                    .font(.system(size: 14))
                    .frame(width:UIScreen.main.bounds.width-80,height: 45)
                    .background(Color.white)
                    .cornerRadius(30)
                    .foregroundColor(Color.black)
                    .padding(.horizontal,20)
            })
            
            Button(action: {
                viewModel.clickedSelectButton("brand")
            }, label: {
                Text("로스터리")
                    .font(.system(size: 14))
                    .frame(width:UIScreen.main.bounds.width-80,height: 45)
                    .background(Color.white)
                    .cornerRadius(30)
                    .foregroundColor(Color.black)
                    .padding(.horizontal,20)
            })
            
        }
    }
}

struct LoginInsertView: View {
    
    @ObservedObject var viewModel:LoginViewVM
    
    init(_ viewModel: LoginViewVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing:15){
            VStack(alignment:.leading,spacing:10){
                Text("이메일")
                    .foregroundColor(Color.white)
                    .font(.system(size: 14))
                
                TextField("",text: $viewModel.id.value)
                    .disableAutocorrection(true) // 자동수정 비활성화
                    .font(.system(size: 14))
                    .padding(.horizontal,20)
                    .frame(width:UIScreen.main.bounds.width-80,height: 45)
                    .background(ColorCodes.loginInsertBackColor.color())
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    
            }
            
            VStack(alignment:.leading,spacing:10){
                Text("비밀번호")
                    .foregroundColor(Color.white)
                    .font(.system(size: 14))
                
                SecureField("",text: $viewModel.password.value)
                    .disableAutocorrection(true) // 자동수정 비활성화
                    .font(.system(size: 14))
                    .padding(.horizontal,20)
                    .frame(width:UIScreen.main.bounds.width-80,height: 45)
                    .background(ColorCodes.loginInsertBackColor.color())
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    
            }
            
            HStack(spacing:5){
                Text("비밀번호를 잊으셨나요?")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                
                Text("비밀번호 찾기")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .underline()
                
//                NavigationLink(destination: Find_Password().environmentObject(Store()), label: {
//                    Text("비밀번호 찾기")
//                        .font(.system(size: 12))
//                        .foregroundColor(Color.white)
//                        .underline()
//                })
                
            }
            
            Button(action: {
                viewModel.clickedLoginButton()
            }, label: {
                Text("로그인")
                    .font(.system(size: 14))
                    .bold()
                    .frame(width:UIScreen.main.bounds.width-80,height: 45)
                    .background(ColorCodes.loginButtonColor.color())
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
                    .padding(.horizontal,20)
            })
        
        }
    }
}

struct LoginSecondView_Preview:PreviewProvider{
    static var previews: some View{
        LoginSecondView(LoginViewVM())
    }
}
