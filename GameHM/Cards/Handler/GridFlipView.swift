//
//  GridFlip.swift
//  GameHM
//
//  Created by s3 on 6/15/21.
//

import SwiftUI

struct GridFlipView: View {
    
    @StateObject var controlFlip = ControlFlipCase()
    
    var currentCardID = ""
    var previousCardID = ""
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: ConstantContentView.columns, alignment: HorizontalAlignment.center, spacing: 10.0) {
                
                ForEach(controlFlip.dataFlip.indices, id: \.self) { index in
                    CardView(currentCard: $controlFlip.dataFlip[index], isFlip: false, delegate: self)
                }
                
//                ForEach(controlFlip.dataFlip) { item in
//                    CardView(currentCard: $item, isFlip: false, delegate: self)
//                }
            }.padding()
        }.onAppear {
            controlFlip.generateDataFlip(count: 6)
        }
    }
}


extension GridFlipView: CardViewDelegate {
    func clickAtCardView(view: CardView) {
        
    }
}

struct GridFlipView_Previews: PreviewProvider {
    static var previews: some View {
        GridFlipView()
    }
}
