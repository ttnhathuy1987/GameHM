//
//  ContentView.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var mainControlFlipCard = ControlFlipCase()
    @State var showWinPopup = false
    var userName: String
    
    var numberCard: Int
    
    var body: some View {
        VStack(alignment: .center) {
            ScoreView(score: $mainControlFlipCard.scores, username:userName)
            GridFlipView(controlFlip: mainControlFlipCard, delegate: self, numerCard: numberCard)
        }.alert(isPresented: $showWinPopup) {
            Alert(title: Text("Win"), message: Text("You have won round"), dismissButton: .default(Text("Ok"), action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}

extension ContentView: GridFlipViewDelegate {
    func winRoundFlip(view: GridFlipView) {
        self.showWinPopup = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userName: "User", numberCard: 6)
    }
}
