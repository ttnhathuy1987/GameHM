//
//  CardView.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import SwiftUI

struct CardView: View {
    
    @StateObject var currentCard: CardObject
    @State var isFlip: Bool = false
    
    public func getIDCar() -> String {
        return currentCard.idCard
    }
    
    var body: some View {
        ZStack {
            Image(currentCard.image)
                .resizable()
                .frame(width: ConstantContentView.sizeCard,
                       height: ConstantContentView.sizeCard,
                       alignment: .center)
                .modifier(BorderRadius(radius: ConstantContentView.radiuscard, lineWidth: 3))
                .shadow(radius: ConstantContentView.shadowRadius)
                .opacity(isFlip ? 1 : 0)
            
            Image(backSideCardImageURL)
                .resizable()
                .frame(width: ConstantContentView.sizeCard,
                       height: ConstantContentView.sizeCard,
                       alignment: .center)
                .modifier(BorderRadius(radius: ConstantContentView.radiuscard, lineWidth: 3))
                .shadow(radius: ConstantContentView.shadowRadius)
                .opacity(isFlip ? 0 : 1)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(currentCard: CardObject())
    }
}
