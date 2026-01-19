//
//  SignUpSecondViewVM.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import Foundation
import UIKit

class SignUpSecondViewVM: ObservableObject {
    
    @Published var uiImageArray:Array<UIImage> = []
    @Published var selectedImage:UIImage?
    @Published var model = SignUpSecondModel()
    
    func validCheck() -> Bool {
        if (model.emailCheck && model.passwordCheck && model.storeName != "" && model.regNum != "" && model.zipCode != "" && uiImageArray.count > 0){
            return true
        }else{
            return false
        }
    }
}
