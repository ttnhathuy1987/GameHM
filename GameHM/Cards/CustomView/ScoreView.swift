//
//  ScoreView.swift
//  GameHM
//
//  Created by s3 on 6/16/21.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var score: Int
    var username: String = ""
    
    var body: some View {
        ZStack {
            Image("").frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 1)
                )
            HStack {
                Text("\(username)").font(.title2).multilineTextAlignment(.leading)
                Spacer()
                Text("\(score)").font(.largeTitle).multilineTextAlignment(.trailing).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            }.frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    @State static var value = 0
    static var previews: some View {
        ScoreView(score: $value)
    }
}
