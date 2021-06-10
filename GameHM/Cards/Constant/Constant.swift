//
//  Constant.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import Foundation
import SwiftUI

public var backSideCardImageURL = "Image default"

public enum ConstantContentView {
    static let sizeAvatar: CGFloat = 100
    static let sizeCard: CGFloat = 50
    static let radiuscard: CGFloat = 10
    static let radiusTopView: CGFloat = 20
    static let shadowRadius: CGFloat = 8
    static let spacingView: CGFloat = 15
    static var columns: [GridItem] { Array(repeating: .init(.flexible()), count: 3) }
}

struct BorderRadius: ViewModifier {
    var radius: CGFloat
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                                .stroke(Color("darkRed"), lineWidth: lineWidth)
            )
            .background(Color.white)
            .cornerRadius(radius)
    }
}
