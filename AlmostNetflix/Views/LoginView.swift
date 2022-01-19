//
//  LoginView.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 21/12/2021.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var authVM: AuthVM
    
    var body: some View {
        VStack {
            Text("Sign In")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("E-mail", text: self.$email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .foregroundColor(Color.white)
                .cornerRadius(8.0)
            
            SecureField("Password", text: self.$password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .foregroundColor(Color.white)
                .cornerRadius(8.0)
            
            Button("Login") {
                authVM.login(email: email, password: password)
            }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(8.0)
            
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.vertical)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
