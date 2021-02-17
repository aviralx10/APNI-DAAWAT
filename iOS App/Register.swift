//
//  Register.swift
//  MyTreat
//
//  Created by Aviral Yadav on 17/02/21.
//

import SwiftUI

struct Register: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @ObservedObject var currentGiver: currentUser
    @Binding var login: Bool

    var body: some View {
        VStack {
            Image("MAIN")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.bottom, 20)
            VStack(spacing: 25) {
                TextField("    Username", text: $username)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("    Email", text: $email)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("    Password", text: $password)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("    Confirm Password", text: $password2)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button(action: {
                login.toggle()
            }) {
                HStack {
                    Text("Sign up")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
                .cornerRadius(10)
            }.padding(.top, 20)
            
            Text("OR")
                .foregroundColor(Color(hex: "#255359"))
                .font(.body)
                .padding(10)

            
            Button(action: {
                //self.fbmanager.facebookLogin(cUser: currentGiver)
                
            }) {
                HStack {
                    Image("facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20,height: 20)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                    Text("Sign up with Facebook")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding(.trailing,20)
                        .padding(.vertical, 15)
                }.background(Color(hex: "#5590C3")).cornerRadius(10)
            }
        }
    }
}



