//
//  LoginFirstView.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import Foundation
import SwiftUI

struct LoginFirstView: View {
    
    @ObservedObject var viewModel:LoginViewVM
    
    init(_ viewModel: LoginViewVM) {
        self.viewModel = viewModel
    }
    
    var body: some View{
        ZStack{
            VStack(alignment:.leading,spacing:15){
                
                VStack(alignment:.leading,spacing: 5){
                    LoginTitleText("다양한 원두를 찾아", .heavy, 26)
                    LoginTitleText("떠나는 여행", .heavy, 26)
                }
                .padding(.horizontal,30)
                
                VStack(alignment:.leading,spacing: 5){
                    LoginTitleText("세상에는 다양하고 각각의 특색을", .medium, 13)
                    LoginTitleText("가진 원두들이 존재합니다.", .medium, 13)
                    LoginTitleText("지금 바로 만나보세요.", .medium, 13)
                }
                .padding(.horizontal,30)
                
                Button(action: viewModel.clickedStartButton){
                    Text("시작하기")
                        .font(.system(size: 14))
                        .bold()
                        .frame(maxWidth: .infinity,maxHeight:55)
//                        .frame(width:UIScreen.main.bounds.width-60,height: 55)
                        .background(ColorCodes.loginButtonColor.color())
                        .cornerRadius(30)
                        .foregroundColor(Color.white)
                        .padding(.horizontal,30)
                        .padding(.vertical,15)
                        .padding(.bottom,35)
                }
                
            }
            .frame(minWidth:0,
                    maxWidth: UIScreen.main.bounds.width,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .bottomLeading)
        }
    }
}

struct LoginTitleText: View {
    var text:String
    var fontWeight:Font.Weight
    var fontSize:CGFloat
    
    init(_ text: String,_ fontWeight: Font.Weight,_ fontSize: CGFloat) {
        self.text = text
        self.fontWeight = fontWeight
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text("\(text)")
            .fontWeight(fontWeight)
            .foregroundColor(Color.white)
            .font(.system(size: fontSize))
    }
}
