//
//  SplashView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    @State var loginSuccess = false
    
    var body: some View {
                
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            if self.isActive {
                if loginSuccess { // true면 화면 넘어감
                    MainView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
                else {
                    LoginView(loginSuccess: $loginSuccess)
                }
            } else {
                Image("logo").resizable().scaledToFit().frame(width: 120, height: 100)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation{self.isActive = true}
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
