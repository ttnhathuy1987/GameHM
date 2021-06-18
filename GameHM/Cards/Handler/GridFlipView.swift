//
//  GridFlip.swift
//  GameHM
//
//  Created by s3 on 6/15/21.
//

import SwiftUI

protocol GridFlipViewDelegate {
    func winRoundFlip(view: GridFlipView)
}


struct GridFlipView: View {
    
    @ObservedObject var controlFlip: ControlFlipCase
    
    @State var updateView = false
    
    var delegate: GridFlipViewDelegate?
    var numerCard: Int
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: ConstantContentView.columns, alignment: HorizontalAlignment.center, spacing: 10.0) {
                
                ForEach(controlFlip.dataFlip.indices, id: \.self) { index in
                    CardView(currentCard: $controlFlip.dataFlip[index], delegate: self)
                }
            }.padding()
        }.onAppear {
            controlFlip.generateDataFlip(count: numerCard)
        }
    }
}


extension GridFlipView: CardViewDelegate {
    func clickAtCardView(view: CardView) {
        controlFlip.handleChangeStatusFlip(currentCard: view.currentCard)
        if controlFlip.checkWinStage() {
            delegate?.winRoundFlip(view: self)
        }
    }
}

struct GridFlipView_Previews: PreviewProvider {
    static var previews: some View {
        GridFlipView(controlFlip:ControlFlipCase(), numerCard: 6)
    }
}
