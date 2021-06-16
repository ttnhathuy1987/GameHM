//
//  ContentView.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            ScoreView()
            GridFlipView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
