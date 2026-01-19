//
//  SignUpView.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import Foundation
import SwiftUI

struct SignUpFirstView: View {
    @EnvironmentObject var userData:UserData
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = SignUpFirstViewVM()
    
    var body: some View {
        VStack(alignment:.leading,spacing:24){
            Group{
                VStack(alignment:.leading,spacing:5){
                    Text("원두 보기 전,")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .font(.system(size: 26))
                    Text("아래 내용을 확인해주세요.")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .font(.system(size: 26))
                }
            }
            
            HStack(spacing:15){
                ZStack{
                    AllCheckButton(color: Color.white)
                    
                    AllCheckButton(color: Color.blue)
                        .clipShape(Rectangle().offset(x:CGFloat(viewModel.agree1)))
                        .animation(Animation.interpolatingSpring(stiffness: 80, damping: 15))
                }
                
                
                Text("전체 동의")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                    
            }
            .padding(.top,40)
            .onTapGesture {
                viewModel.clickedAllAgree()
            }
            
            checkIconView(viewModel: viewModel,agree: $viewModel.agree2, text: "만 14세 이상입니다. [필수]")
            checkIconView(viewModel: viewModel,agree: $viewModel.agree3, text: "이용 약관에 동의합니다.[필수]")
            checkIconView(viewModel: viewModel,agree: $viewModel.agree4, text: "개인정보 수집 및 이용에 동의합니다.[필수]")
            checkIconView(viewModel: viewModel,agree: $viewModel.agree5, text: "전자 금융거래 이용약관 동의. [필수]")
            checkIconView(viewModel: viewModel,agree: $viewModel.agree6, text: "마케팅 정보 수신 동의. [선택]")
            
            Spacer()
            
            if (viewModel.nextBtn == 2){
                Text("다음")
                    .font(.system(size: 14))
                    .bold()
                    .frame(width:UIScreen.main.bounds.width-60,height: 45)
                    .background(Color.gray)
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
                    .padding(.bottom,50)
            }else{
                NavigationLink(destination: SignUpSecondView().environmentObject(userData) , label: {
                    Text("다음")
                        .font(.system(size: 14))
                        .bold()
                        .frame(width:UIScreen.main.bounds.width-60,height: 45)
                        .background(ColorCodes.loginButtonColor.color())
                        .cornerRadius(30)
                        .foregroundColor(Color.white)
                        .padding(.bottom,50)
                })
            }
        }
        .padding(.top,130)
        .padding(.horizontal,30)
        .frame(minWidth:0,
                maxWidth: UIScreen.main.bounds.width,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text("")) //, displayMode: .inline
        .edgesIgnoringSafeArea(.bottom)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HeaderBackButton()
            }
        )
    }
}

struct AllCheckButton: View {
    var color:Color
    var body: some View {
        Group{
            Image(systemName: "circle")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(color)
            
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 20, height: 14)
                .foregroundColor(color)
        }
    }
}


struct checkIconView:View{
    
    @ObservedObject var viewModel:SignUpFirstViewVM
    @Binding var agree:Int
    var text:String
    
    var body: some View{
        HStack(spacing:18){
            ZStack{
                
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 20, height: 14)
                    .foregroundColor(Color.white)
                    .padding(.leading,5)
                    
                
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 20, height: 14)
                    .foregroundColor(Color.blue)
                    .padding(.leading,5)
                    .clipShape(Rectangle().offset(x:CGFloat(self.agree)))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15))
            }
            
            Text("\(text)")
                .fontWeight(.regular)
                .foregroundColor(Color.white)
                .font(.system(size: 14))
                
        }
        .onTapGesture {
            if self.agree == -20{
                self.agree = 0
            }else{
                self.agree = -20
            }
            viewModel.pointCheck()
        }
    }
}
