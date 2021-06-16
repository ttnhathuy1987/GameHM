//
//  LoginView.swift
//  GameHM
//
//  Created by s3 on 6/16/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var isLoginSuccess = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Username")
                    TextField("Username", text: $username)
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 0.5)
                        )
                    Spacer(minLength: 20)
                    Text("Password")
                    TextField("Password", text: $password)
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 0.5)
                        )
                    VStack(alignment: .center) {
                        Button("Login") {
                            isLoginSuccess = true
                        }.frame(width: 100, height: 40, alignment: .center)
                    }.frame(maxWidth: .infinity)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            }.background(
                NavigationLink(
                    destination: ContentView(),
                    isActive: $isLoginSuccess,
                    label: {
                        EmptyView()
                    })
            ).navigationBarTitle("LoginView")
            //.navigationBarHidden(true)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
