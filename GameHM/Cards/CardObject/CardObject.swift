//
//  CardObject.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import UIKit

struct CardObject: Identifiable {
    var id = UUID()
    var idCard: String = ""
    var image: String = ""
    var isMatch = false
    var isFlip = false
}
