//
//  TitleView.swift
//  AppwriteFlix
//
//  Created by Jake on 11/01/22.
//

import Foundation
import SwiftUI

struct TitleView: View {
    
    @State private var selection: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image("AlmostNetflix")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250.0)
                    .padding(.bottom, 50.0)
                
                
                NavigationLink(destination: LoginView(), tag: "Sign In", selection: $selection) {}
                    .navigationTitle("")
                NavigationLink(destination: SignupView(), tag: "Sign Up", selection: $selection) {}
                    .navigationTitle("")
                
                Button("Sign In") {
                    self.selection = "Sign In"
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(8.0)
                
                Button("Sign Up") {
                    self.selection = "Sign Up"
                }
                .foregroundColor(.red)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
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
        .accentColor(Color.red)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
