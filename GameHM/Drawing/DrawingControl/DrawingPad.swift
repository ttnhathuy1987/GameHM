//
//  DrawingPad.swift
//  DrawingPadSwiftUI
//
//  Created by Martin Mitrevski on 20.07.19.
//  Copyright © 2019 Mitrevski. All rights reserved.
//

import SwiftUI

struct DrawingPad: View {
    @Binding var currentDrawing: ListDrawing
    @Binding var drawings: [ListDrawing]
    @Binding var color: Color
    @Binding var lineWidth: CGFloat
    
    var previousColor: Color = Color.black
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach((0..<drawings.count), id: \.self) { index in
                    let drawing = drawings[index]
                    self.add(drawing: drawing)
                }
                self.add(drawing: self.currentDrawing)
            }
            .background(Color(white: 0.95))
            .gesture(
                DragGesture(minimumDistance: 0.1)
                    .onChanged({ (value) in
                        let currentPoint = value.location
                        if currentPoint.y >= 0
                            && currentPoint.y < geometry.size.height {
                            let  currentDrawingPoint = DrawingObject(point: currentPoint, colorPoint: color)
                            self.currentDrawing.points.append(currentDrawingPoint)
                        }
                    })
                    .onEnded({ (value) in
                        self.drawings.append(self.currentDrawing)
                        self.currentDrawing = ListDrawing()
                    })
            )
        }
        .frame(maxHeight: .infinity)
    }
    
    private func add(drawing: ListDrawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current.point)
                path.addLine(to: next.point)
            }
        }
    }
    
    private func add(drawing: ListDrawing) -> some View {
        let points = drawing.points
        var currentColor = Color.black
        let mainPath = Path { path in
            if points.count > 1 {
                for i in 0..<points.count-1 {
                    let current = points[i]
                    let next = points[i+1]
                    path.move(to: current.point)
                    path.addLine(to: next.point)
                    currentColor = current.colorPoint
                }
            }
        }.stroke(currentColor, lineWidth: self.lineWidth)
        return mainPath
    }
    
}
