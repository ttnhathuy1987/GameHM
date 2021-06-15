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
    
    var currentIDFlip: String = ""
    var previousIDFlip: String = ""
    
    var scores: Int = 0;
    
    func generateDataFlip(count: Int) {
        
        if count > listImageCard.count {
            return
        }
        
        var listCopyImage = listImageCard
        dataFlip.removeAll()
        for i in 0..<count {
            let randowIndex = Int(arc4random()) % listCopyImage.count
            var item = CardObject()
            item.idCard = "\(i + 1)"
            item.image = listCopyImage[randowIndex];
            dataFlip.append(item)
            listCopyImage.remove(at: randowIndex)
        }
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
    
    func checkWinStage() -> Bool {
        return dataFlip.allSatisfy { (item) -> Bool in
            item.isMatch
        }
    }
}

