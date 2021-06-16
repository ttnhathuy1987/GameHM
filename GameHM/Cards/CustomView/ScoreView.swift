//
//  ScoreView.swift
//  GameHM
//
//  Created by s3 on 6/16/21.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        ZStack {
            Image("").frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 1)
                )
            HStack {
                Text("Name of User").font(.title2).multilineTextAlignment(.leading)
                Spacer()
                Text("999").font(.largeTitle).multilineTextAlignment(.trailing).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            }.frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
