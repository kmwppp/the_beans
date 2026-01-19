//
//  Colors.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import SwiftUI

enum ColorCodes{
    case backButtonBackground
    case loginButtonColor
    case loginInsertBackColor
    case loginInsertTextColor
}

extension ColorCodes {
    func color() -> Color {
        switch self {
        case .backButtonBackground:
            return Color("backButtonBackground")
        case .loginButtonColor:
            return Color("loginButtonColor")
        case .loginInsertBackColor:
            return Color("loginInsertBackColor")
        case .loginInsertTextColor:
            return Color("loginInsertTextColor")
        }
    }
}
