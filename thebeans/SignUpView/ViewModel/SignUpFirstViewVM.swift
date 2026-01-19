//
//  SignUpViewVM.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import Foundation

class SignUpFirstViewVM: ObservableObject {
    
    @Published var all = false
    
    @Published var agree1 = -28
    @Published var agree2 = -20
    @Published var agree3 = -20
    @Published var agree4 = -20
    @Published var agree5 = -20
    @Published var agree6 = -20
    
    @Published var nextBtn = 2
    
    func clickedAllAgree(){
        if all == false{
            agree1 = 0
            agree2 = 0
            agree3 = 0
            agree4 = 0
            agree5 = 0
            agree6 = 0
            all = true
        }else{
            agree1 = -28
            agree2 = -20
            agree3 = -20
            agree4 = -20
            agree5 = -20
            agree6 = -20
            all = false
        }
        pointCheck()
    }
    
    func pointCheck(){
        // 0:전체 동의 / 1: 선택제외 동의 / 2: 필수동의 안함
        if (self.agree2 == 0 && self.agree3 == 0 && self.agree4 == 0 && self.agree5 == 0 && self.agree6 == 0){
            nextBtn = 0
            all = true
            
        }else if(self.agree2 == 0 && self.agree3 == 0 && self.agree4 == 0 && self.agree5 == 0){
            nextBtn = 1
        }else{
            nextBtn = 2
        }
        
        if (nextBtn == 2 || nextBtn == 1){
            self.agree1 = -28
        }else{
            self.agree1 = 0
        }
        
    }
}
