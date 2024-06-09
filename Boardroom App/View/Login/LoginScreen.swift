//
//  LoginScreen.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 14/02/2024.
//

import SwiftUI

struct LoginScreen: View {
    @State var isShowingPassword: Bool = false
    @StateObject private var loginVM = LoginViewModel()
    @State private var isActive: Bool = false
    
        var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                
                VStack(alignment: .center, spacing: 16) {
                    Text("Welcome back! Glad to see you again!")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size: 32, weight: .bold))
                    
                    Spacer().frame(height: 2)
                    
                    TextField("Enter your job number", text: $loginVM.username)
                        .padding()
                        .frame(width: 358, height: 56)
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
                        .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 2))
                    
                    HStack {
                        Group {
                            if isShowingPassword {
                                TextField("Enter your password", text: $loginVM.password)
                            } else {
                                SecureField("Enter your password", text: $loginVM.password)
                            }
                        }
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: 358, height: 56)
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                .overlay(
                                    Button {
                                        isShowingPassword.toggle()
                                    } label: {
                                        if isShowingPassword {
                                            Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                                                .font(.system(size: 16, weight: .regular))
                                                .foregroundColor(.gray)
                                                .padding()
                                            } else {
                                                Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                                                    .font(.system(size: 16, weight: .regular))
                                                    .foregroundColor(.gray)
                                                    .padding()
                                    }
                                }
                                        .padding(.leading, 300)

                            )

                        )
                    }
                    Spacer().frame(height: 2)
                    
                    NavigationLink(destination: MainScreen(), isActive: $isActive) {
                        Button(action: {
                            loginVM.login()
                            isActive = true // Activate the navigation link
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(width: 358, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("DarkBlue")))
                        }
                    }
                    .padding(.bottom, 230)
                    .padding(.horizontal, 20)

                }
                
            }
        }
    }
#Preview {
    LoginScreen()
}
