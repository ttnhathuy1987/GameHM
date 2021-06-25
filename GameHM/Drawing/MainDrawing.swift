//
//  MainDrawing.swift
//  GameHM
//
//  Created by s3 on 6/21/21.
//

import SwiftUI

struct MainDrawing: View {
    
    @State private var currentDrawing: ListDrawing = ListDrawing()
    @State private var drawings: [ListDrawing] = [ListDrawing]()
    @State private var color: Color = Color.black
    @State private var lineWidth: CGFloat = 3.0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Draw something")
                .font(.largeTitle)
            DrawingPad(currentDrawing: $currentDrawing,
                       drawings: $drawings,
                       color: $color,
                       lineWidth: $lineWidth)
            DrawingControls(color: $color, drawings: $drawings, lineWidth: $lineWidth, delegate: self)
            
        }
    }
}

extension MainDrawing: DrawingControlsDelegate {
    func snapshot() {
        Constant.getImageDocumentsDirectory()
    }
}


struct MainDrawing_Previews: PreviewProvider {
    static var previews: some View {
        MainDrawing()
    }
}

extension View {
    func snapshotView() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
