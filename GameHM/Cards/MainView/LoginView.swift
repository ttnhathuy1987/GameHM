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
    
    @State private var speed:Float = 2
    @State private var isEditing = false
    
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
//                    Spacer(minLength: 20)
//                    Text("Password")
//                    TextField("Password", text: $password)
//                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 0.5)
//                        )
                    Spacer(minLength: 40)
                    VStack(alignment: .center) {

                        Text("Level: \(Int(speed))")
                        Slider(value: $speed, in: 2...8, step: 1, onEditingChanged: { (editing) in
                            
                        }, minimumValueLabel: Text("2"), maximumValueLabel: Text("8")) {
                            Text("\(Int(speed))")
                        }.accentColor(Color.green)
                        Spacer(minLength: 40)
                        Button("Play") {
                            isLoginSuccess = true
                        }.frame(width: 100, height: 40, alignment: .center)
                    }.frame(maxWidth: .infinity)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            }.background(
                NavigationLink(
                    destination: ContentView(userName:username, numberCard: Int(speed)),
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
