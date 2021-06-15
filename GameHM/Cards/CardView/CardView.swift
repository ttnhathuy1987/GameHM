//
//  CardView.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import SwiftUI

protocol CardViewDelegate {
    func clickAtCardView(view: CardView)
}

struct CardView: View {
    
    @Binding var currentCard: CardObject
    @State var isFlip: Bool = false
    
    var delegate: CardViewDelegate?
    
    public func getIDCar() -> String {
        return currentCard.idCard
    }
    
    var body: some View {
        ZStack {
            Image(currentCard.image)
                .resizable().aspectRatio(1, contentMode: .fit)
                .frame(width: ConstantContentView.sizeCardWidth,
                       height: ConstantContentView.sizeCardHeight,
                       alignment: .center)
                .modifier(BorderRadius(radius: ConstantContentView.radiuscard, lineWidth: 3))
                .shadow(radius: ConstantContentView.shadowRadius)
                .opacity(isFlip ? 1 : 0)
            
            Image(backSideCardImageURL)
                .resizable()
                .frame(width: ConstantContentView.sizeCardWidth,
                       height: ConstantContentView.sizeCardHeight,
                       alignment: .center)
                .modifier(BorderRadius(radius: ConstantContentView.radiuscard, lineWidth: 3))
                .shadow(radius: ConstantContentView.shadowRadius)
                .opacity(isFlip ? 0 : 1)
        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            print("Tap Item")
            withAnimation(.easeIn(duration: 0.5)) {
                isFlip.toggle()
                delegate?.clickAtCardView(view: self)
            }
        })
        .rotation3DEffect(.init(degrees: isFlip ? 180 : 0),
                           axis: (x: 0.0, y: 1.0, z: 0.0),
                           anchor: .center,
                           anchorZ: 0.0,
                           perspective: 1.0)
         .opacity(!currentCard.isMatch ? 1 : 0)
         .disabled(currentCard.isMatch)
    }
}

extension CardView {
    
}

struct CardView_Previews: PreviewProvider {
    @State static var value = CardObject()
    static var previews: some View {
        CardView(currentCard: $value, delegate: nil)
    }
}
