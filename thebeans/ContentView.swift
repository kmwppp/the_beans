//
//  ContentView.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/05.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userData:UserData
    let viewModel = LoginViewVM()
    var body: some View {
        NavigationView{
            LoginView(viewModel)
                .environmentObject(self.userData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
