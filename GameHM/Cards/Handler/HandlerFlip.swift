//
//  HandlerFlip.swift
//  GameHM
//
//  Created by s3 on 6/14/21.
//

import Foundation
import SwiftUI

class ControlFlipCase: ObservableObject {
    @Published var dataFlip: [CardObject] = []
    
    var currentIDFlip: CardObject?
    
    var scores: Int = 0;
    
    func generateDataFlip(count: Int) {
        
        if count > listImageCard.count {
            return
        }
        
        var listCopyImage = listImageCard
        
        dataFlip.removeAll()
        
        var dataMatch: [CardObject] = []
        //var dataDuplicate: [CardObject] = []
        
        for i in 0..<count {
            let randowIndex = Int(arc4random()) % listCopyImage.count
            var item = CardObject()
            item.idCard = "\(i + 1)"
            item.image = listCopyImage[randowIndex]
            dataMatch.append(item)
            dataMatch.append(item)
            //dataDuplicate.append(item)
            listCopyImage.remove(at: randowIndex)
        }
        
        dataFlip = dataMatch
        dataFlip = dataFlip.shuffled()
        
        print("\(dataFlip.count)")
        // General copy cards
    }
    
    func handleChangeStatusFlip(currentObject: CardObject,previousObject:CardObject) -> Bool {
        if currentObject.idCard.caseInsensitiveCompare(previousObject.idCard) == ComparisonResult.orderedSame {
            // Is Match
            return true
        }
        return false
    }
    
    func handleChangeStatusFlip(currentCard: CardObject) {
        if let itemTemp = currentIDFlip {
            if itemTemp.idCard.compare(currentCard.idCard) == .orderedSame {
                // Handle count score and disable Card
                var itemNew = currentCard
                itemNew.isMatch = true
                dataFlip = dataFlip.map { $0.idCard.compare(itemNew.idCard) == .orderedSame ? itemNew : $0 }
                currentIDFlip = nil
                scores += 1
            } else {
                // Handle Flip all card.
                var itemNew = currentCard
                itemNew.isFlip = false
                
                var itemTempNew = itemTemp
                itemTempNew.isFlip = false
                
                dataFlip = dataFlip.map { $0.idCard.compare(itemNew.idCard) == .orderedSame ? itemNew : $0 }
                dataFlip = dataFlip.map { $0.idCard.compare(itemTempNew.idCard) == .orderedSame ? itemTempNew : $0 }
                currentIDFlip = nil
            }
        } else {
            currentIDFlip = currentCard // First Card Flip
        }
    }
    
    func checkWinStage() -> Bool {
        return dataFlip.allSatisfy { (item) -> Bool in
            return item.isMatch
        }
    }
}

