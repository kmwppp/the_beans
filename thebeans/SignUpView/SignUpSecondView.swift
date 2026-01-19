//
//  SignUpSecondView.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import Foundation
import SwiftUI
import Drops

struct SignUpSecondView: View {
    @EnvironmentObject var userData:UserData
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = SignUpSecondViewVM()
    
    var body: some View {
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false){
                VStack(alignment:.leading,spacing:15){
                    Text("회원가입")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .font(.system(size: 26))
                        .padding(.bottom,20)
                    
                    Group{
                        
                        SignUpSecondSectionView(title: "이메일",
                                                bindingText: $viewModel.model.email,
                                                errorMessage: "이미 가입된 이메일입니다.",
                                                isEmail: true,
                                                isSecure: false)
                        
                        SignUpSecondSectionView(title: "비밀번호",
                                                bindingText: $viewModel.model.password,
                                                errorMessage: "",
                                                isEmail: false,
                                                isSecure: true)
                        
                        SignUpSecondSectionView(title: "비밀번호 확인",
                                                bindingText: $viewModel.model.confirmPassword,
                                                errorMessage: "",
                                                isEmail: false,
                                                isSecure: true)
                        .onChange(of: viewModel.model.confirmPassword){
                            print($0)
                            if viewModel.model.password == viewModel.model.confirmPassword{
                                viewModel.model.passwordCheck = true
                            }
                        }
                        
                        SignUpSecondSectionView(title: "상호명",
                                                bindingText: $viewModel.model.storeName,
                                                errorMessage: "",
                                                isEmail: false,
                                                isSecure: false)
                        
                        VStack(alignment:.leading,spacing:5){
                            Text("휴대폰 번호 인증")
                                .foregroundColor(ColorCodes.loginInsertBackColor.color())
                                .font(.system(size: 14))
                            
                            HStack{
                                TextField("",text: $viewModel.model.phoneNum)
                                    .disableAutocorrection(true) // 자동수정 비활성화
                                    .font(.system(size: 14))
                                    .padding(.horizontal,20)
                                    .frame(width:UIScreen.main.bounds.width-190,height: 40)
                                    .background(ColorCodes.loginInsertTextColor.color())
                                    .cornerRadius(10)
                                    .foregroundColor(Color.white)
                                    .accentColor(Color.white)
                                    .keyboardType(.numberPad)
                                
                                
                                if viewModel.model.phoneNum.count == 11{
                                    Button(action: {
                                        viewModel.model.sendMessage = true
                                        //인증번호 http
                                        
                                    }, label: {
                                        Text("인증번호 받기")
                                            .font(.system(size: 14))
                                            .padding(.horizontal,20)
                                            .frame(width:120,height: 40)
                                            .background(ColorCodes.loginInsertTextColor.color())
                                            .cornerRadius(10)
                                            .foregroundColor(Color.white)
                                    })
                                    
                                }else{
                                    Button(action: {
                                        if viewModel.model.sendMessage == true{
                                            Drops.show("이미 메세지를 보냈습니다.")
                                        }else{
                                            Drops.show("전화번호를 확인해주세요.")
                                        }
                                    }, label: {
                                        Text("인증번호 받기")
                                            .font(.system(size: 14))
                                            .padding(.horizontal,20)
                                            .frame(width:120,height: 40)
                                            .background(ColorCodes.loginInsertTextColor.color())
                                            .cornerRadius(10)
                                            .foregroundColor(Color.white)
                                    })
                                    
                                }
                                
                            }
                            
                            if(viewModel.model.sendMessage == true){
                                HStack{
                                    TextField("",text: $viewModel.model.secretNum)
                                        .disableAutocorrection(true) // 자동수정 비활성화
                                        .font(.system(size: 14))
                                        .padding(.horizontal,20)
                                        .frame(width:UIScreen.main.bounds.width-190,height: 40)
                                        .background(ColorCodes.loginInsertTextColor.color())
                                        .cornerRadius(10)
                                        .foregroundColor(Color.white)
                                        .accentColor(Color.white)
                                        .keyboardType(.numberPad)
                                    
                                    Button(action: {
                                        if viewModel.model.secretNum == viewModel.model.secretNumChk{
                                            Drops.show("인증번호가 일치합니다.")
                                            viewModel.model.secretNumChkBool = true
                                        }else{
                                            Drops.show("인증번호가 일치하지 않습니다.")
                                        }
                                    }, label: {
                                        if (viewModel.model.secretNum.count == 6){
                                            Text("인증하기")
                                                .font(.system(size: 14))
                                                .padding(.horizontal,20)
                                                .frame(width:120,height: 40)
                                                .background(ColorCodes.loginInsertTextColor.color())
                                                .cornerRadius(10)
                                                .foregroundColor(Color.white)
                                        }else{
                                            Text("인증하기")
                                                .font(.system(size: 14))
                                                .padding(.horizontal,20)
                                                .frame(width:120,height: 40)
                                                .background(ColorCodes.loginInsertTextColor.color())
                                                .cornerRadius(10)
                                                .foregroundColor(Color.white)
                                        }
                                    })
                                    
                                    
                                }
                            }
                        }
                        
                        VStack(alignment:.leading,spacing:5){
                            Text("사업자 등록번호")
                                .foregroundColor(ColorCodes.loginInsertBackColor.color())
                                .font(.system(size: 14))
                            
                            TextField("",text: $viewModel.model.regNum)
                                .disableAutocorrection(true) // 자동수정 비활성화
                                .font(.system(size: 14))
                                .padding(.horizontal,20)
                                .frame(width:UIScreen.main.bounds.width-60,height: 40)
                                .background(ColorCodes.loginInsertTextColor.color())
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .accentColor(Color.white)
                                
                            ImagePickerBox(uiImageArray: $viewModel.uiImageArray,
                                           selectedImage: $viewModel.selectedImage)
                        }
                        
                        VStack(alignment:.leading,spacing:5){
                            Text("배송지 등록")
                                .foregroundColor(ColorCodes.loginInsertBackColor.color())
                                .font(.system(size: 14))
                            
                            HStack{
                                Text("\(viewModel.model.zipCode)")
                                    .disableAutocorrection(true) // 자동수정 비활성화
                                    .font(.system(size: 14))
                                    .padding(.horizontal,20)
                                    .frame(width:UIScreen.main.bounds.width-190,height: 40)
                                    .background(ColorCodes.loginInsertTextColor.color())
                                    .cornerRadius(10)
                                    .foregroundColor(Color.white)
                                    .accentColor(Color.white)
                                    .keyboardType(.numberPad)
                                
                                Text("주소 검색")
                                    .font(.system(size: 14))
                                    .padding(.horizontal,20)
                                    .frame(width:120,height: 40)
                                    .background(ColorCodes.loginInsertTextColor.color())
                                    .cornerRadius(10)
                                    .foregroundColor(Color.white)
                                
//                                NavigationLink(destination: Search_address(urlToLoad: "https://cafeodi.co.kr/search/address/ios",road:$road,zonecode:$zonecode).environmentObject(self.store),label: {
//                                    Text("주소 검색")
//                                        .font(.system(size: 14))
//                                        .padding(.horizontal,20)
//                                        .frame(width:120,height: 40)
//                                        .background(Color("Insert_login_color"))
//                                        .cornerRadius(10)
//                                        .foregroundColor(Color.white)
//                                })
                                
                                
                            }
                            
                            Text("\(viewModel.model.road)")
                                .font(.system(size: 14))
                                .padding(.horizontal,20)
                                .frame(width:UIScreen.main.bounds.width-60,height: 40)
                                .background(ColorCodes.loginInsertTextColor.color())
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            
                            Text("상세주소")
                                .foregroundColor(ColorCodes.loginInsertBackColor.color())
                                .font(.system(size: 14))
                            TextField("",text: $viewModel.model.detailAddress)
                                .disableAutocorrection(true) // 자동수정 비활성화
                                .font(.system(size: 14))
                                .padding(.horizontal,20)
                                .frame(width:UIScreen.main.bounds.width-60,height: 40)
                                .background(ColorCodes.loginInsertTextColor.color())
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .accentColor(Color.white)
                                
                        }
                    }
                    
                    Spacer()
                    Button(action: {
//                        if check() == false{
//                            Drops.show("다시 확인해주세요!")
//                        }else{
//                            store.email = email
//                            store.pw = pass_chk
//                            store.business_name = store_name
//                            store.phone = phone_num
//                            store.reg_number = reg_num
//                            store.address = road
//                            store.address_detail = detail_address
//                            store.zipcode = zonecode
//                            SignUp_dispatch(showingAlert: $showing).dispatch(store: store, imageArray: uiImageArray)
//                        }
                        
                    }, label: {
                        if viewModel.validCheck() == false{
                            Text("가입하기")
                                .font(.system(size: 14))
                                .bold()
                                .frame(width:UIScreen.main.bounds.width-60,height: 45)
                                .background(ColorCodes.loginInsertTextColor.color())
                                .cornerRadius(30)
                                .foregroundColor(Color.white)
                                .padding(.bottom,50)
                        }else{
                            Text("가입하기")
                                .font(.system(size: 14))
                                .bold()
                                .frame(width:UIScreen.main.bounds.width-60,height: 45)
                                .background(ColorCodes.loginInsertTextColor.color())
                                .cornerRadius(30)
                                .foregroundColor(Color.white)
                                .padding(.bottom,50)
                        }
                        
                    })
                    
                }
                .padding(.horizontal,30)
                
            }
            .frame(minWidth:0,
                    maxWidth: UIScreen.main.bounds.width,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
        }
        
        .navigationBarTitle(Text("")) //, displayMode: .inline
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

struct SignUpSecondSectionView: View {
    
    var title:String
    @Binding var bindingText:String
    var errorMessage:String
    
    var isEmail:Bool
    var isSecure:Bool
    
    var body: some View {
        VStack(alignment:.leading,spacing:5){
            Text("\(title)")
                .foregroundColor(ColorCodes.loginInsertBackColor.color())
                .font(.system(size: 14))
            if !isSecure {
                TextField("",text: $bindingText)
                    .disableAutocorrection(true) // 자동수정 비활성화
                    .font(.system(size: 14))
                    .padding(.horizontal,20)
                    .frame(width:UIScreen.main.bounds.width-60,height: 40)
                    .background(ColorCodes.loginInsertTextColor.color())
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .accentColor(Color.white)
                    .keyboardType(.emailAddress)
            }else{
                SecureField("",text: $bindingText)
                    .disableAutocorrection(true) // 자동수정 비활성화
                    .font(.system(size: 14))
                    .padding(.horizontal,20)
                    .frame(width:UIScreen.main.bounds.width-60,height: 40)
                    .background(ColorCodes.loginInsertTextColor.color())
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .accentColor(Color.white)
                    .keyboardType(.emailAddress)
            }
            
            
            
            if bindingText != "" && isEmail{
                Text("\(errorMessage)")
                    .foregroundColor(Color.red)
                    .font(.system(size: 8))
            }
        }
    }
}
