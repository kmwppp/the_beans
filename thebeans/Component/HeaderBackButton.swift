//
//  HeaderBackButton.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import Foundation
import SwiftUI

struct HeaderBackButton: View {
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width:34,height: 34)
                .foregroundColor(ColorCodes.backButtonBackground.color())
                
            
            Image(systemName: "chevron.left")
                .resizable()
                .frame(width:12,height: 18)
                .foregroundColor(Color.white)
                .padding(.trailing,2)
        }
    }
}
