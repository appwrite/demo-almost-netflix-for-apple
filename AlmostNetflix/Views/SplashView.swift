//
//  SplashView.swift
//  AppwriteFlix
//
//  Created by Jake on 11/01/22.
//

import Foundation
import SwiftUI

struct SplashView : View {
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            
            Image("Ico")
                .resizable()
                .frame(width: 50.0, height: 50.0)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
