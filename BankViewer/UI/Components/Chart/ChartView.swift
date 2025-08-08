//
//  ChartView.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

import SwiftUI
import Charts

struct ChartView: View {
    @State private var percentage: CGFloat = 0

    private let viewModel: ChartViewModel

    init(viewModel: ChartViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geo in
            let points = normalizedPoints(size: geo.size)

            ZStack {
                path(from: points)
                    .trim(from: 0, to: percentage)
                    .stroke(
                        LinearGradient(
                            colors: [.customPrimary, .customSecondary],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        style: StrokeStyle(
                            lineWidth: 4,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
            }
        }
    }
    
    private func normalizedPoints(size: CGSize) -> [CGPoint] {
        let count = viewModel.data.count
        guard count > 1 else { return [] }

        return viewModel.data.enumerated().map { index, value in
            let positionX = size.width * CGFloat(index) / CGFloat(count - 1)
            let yRatio = CGFloat(value - viewModel.minY) / max(CGFloat(viewModel.maxY - viewModel.minY), 1)
            let positionY = (1 - yRatio) * size.height
            return CGPoint(x: positionX, y: positionY)
        }
    }

    private func path(from points: [CGPoint]) -> SwiftUI.Path {
        var path = SwiftUI.Path()

        guard points.count > 1 else { return path }

        path.move(to: points[0])

        for index in 1..<points.count {
            let prev = points[index - 1]
            let current = points[index]
            let mid = CGPoint(x: (prev.x + current.x) / 2, y: (prev.y + current.y) / 2)
            path.addQuadCurve(to: mid, control: prev)
        }

        if let last = points.last {
            path.addLine(to: last)
        }

        return path
    }
}
