//
//  Constant.swift
//  GameHM
//
//  Created by s3 on 6/10/21.
//

import Foundation
import SwiftUI

public var backSideCardImageURL = "card"

public enum ConstantContentView {
    static let sizeAvatar: CGFloat = 100
    static let sizeCardWidth: CGFloat = 40
    static let sizeCardHeight: CGFloat = 60
    static let radiuscard: CGFloat = 10
    static let radiusTopView: CGFloat = 20
    static let shadowRadius: CGFloat = 8
    static let spacingView: CGFloat = 15
    static var columns: [GridItem] { Array(repeating: .init(.flexible()), count: 4) }
}

struct BorderRadius: ViewModifier {
    var radius: CGFloat
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color.black, lineWidth: lineWidth)
            )
            .background(Color.white)
            .cornerRadius(radius)
    }
}

public var listImageCard: [String] = ["charmander","eevee","meowth", "pikachu", "pokeball", "psyduck", "snorlax", "valor"]


struct AnimationRotation3DModifier: AnimatableModifier {

    /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
    var animatableData: Bool {
//        get {
//            targetValue
//        } set {
//            targetValue = newValue
//        }
        didSet {
            notifyCompletionIfFinished()
        }
    }

    /// The target value for which we're observing. This value is directly set once the animation starts. During animation, `animatableData` will hold the oldValue and is only updated to the target value once the animation completes.
    var targetValue: Bool

    /// The completion callback which is called once the animation completes.
    var completion: () -> Void

    init(observedValue: Bool, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }

    /// Verifies whether the current animation is finished and calls the completion callback if true.
    private func notifyCompletionIfFinished() {
        if (animatableData == targetValue) {
            DispatchQueue.main.async {
                self.completion()
            }
        }
    }

    func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}

//extension View {
//
//    /// Calls the completion handler whenever an animation on the given value completes.
//    /// - Parameters:
//    ///   - value: The value to observe for animations.
//    ///   - completion: The completion callback to call once the animation completes.
//    /// - Returns: A modified `View` instance with the observer attached.
//    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
//        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
//    }
//}
