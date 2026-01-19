//
//  LoginView.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import SwiftUI

struct LoginView:View{
    
    @EnvironmentObject var userData:UserData
    @ObservedObject var viewModel:LoginViewVM
    
    init(_ viewModel: LoginViewVM) {
        self.viewModel = viewModel
    }
    
    var body: some View{
        ZStack{
            Image("loginBackground")
                .resizable()
                .scaleEffect(viewModel.backgroundScale.value)
                .animation(.linear(duration: 1.5), value: viewModel.backgroundScale.value)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack{
                Spacer()
                if (viewModel.pageNum == 1) {
                    LoginFirstView(viewModel)
                }
                else {
                    LoginSecondView(viewModel)
                }
            }
            
        }
    }
}

struct LoginView_Preview:PreviewProvider{
    static var previews: some View{
        LoginView(LoginViewVM())
    }
}
