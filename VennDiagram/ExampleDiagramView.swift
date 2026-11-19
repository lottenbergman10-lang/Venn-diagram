import SwiftUI

struct ExampleDiagramView: View {
    private let writingColor = Color(red: 0.28, green: 0.49, blue: 0.90)
    private let photographyColor = Color(red: 0.95, green: 0.43, blue: 0.37)
    private let designColor = Color(red: 0.26, green: 0.72, blue: 0.56)

    var body: some View {
        VStack(spacing: 16) {
            GeometryReader { geometry in
                let side = min(geometry.size.width, geometry.size.height)

                ZStack {
                    diagramCircle(color: writingColor, x: 0.36, y: 0.36, side: side)
                    diagramCircle(color: photographyColor, x: 0.64, y: 0.36, side: side)
                    diagramCircle(color: designColor, x: 0.50, y: 0.60, side: side)

                    region("Alma", interests: "Skriver", x: 0.25, y: 0.30, side: side)
                    region("Bo", interests: "Fotograferar", x: 0.75, y: 0.30, side: side)
                    region("Cleo", interests: "Formger", x: 0.50, y: 0.76, side: side)
                    region("Dani", interests: "Skriver och fotograferar", x: 0.50, y: 0.23, side: side)
                    region("Eli", interests: "Skriver och formger", x: 0.32, y: 0.55, side: side)
                    region("Fran", interests: "Fotograferar och formger", x: 0.68, y: 0.55, side: side)
                    region("Kim", interests: "Skriver, fotograferar och formger", x: 0.50, y: 0.44, side: side)
                }
                .frame(width: side, height: side)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .accessibilityElement(children: .contain)
            .accessibilityLabel("Venn-diagram med tre intressen och sju personer")

            HStack(spacing: 24) {
                legend("Skriver", color: writingColor)
                legend("Fotograferar", color: photographyColor)
                legend("Formger", color: designColor)
            }
            .padding(.bottom, 16)
        }
    }

    private func diagramCircle(color: Color, x: CGFloat, y: CGFloat, side: CGFloat) -> some View {
        Circle()
            .fill(color.opacity(0.35))
            .overlay(Circle().strokeBorder(color.opacity(0.8), lineWidth: 2))
            .frame(width: side * 0.54, height: side * 0.54)
            .position(x: side * x, y: side * y)
            .accessibilityHidden(true)
    }

    private func region(_ name: String, interests: String, x: CGFloat, y: CGFloat, side: CGFloat) -> some View {
        Text(name)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(Color(red: 0.12, green: 0.16, blue: 0.23))
            .position(x: side * x, y: side * y)
            .accessibilityLabel("\(name), \(interests)")
    }

    private func legend(_ title: String, color: Color) -> some View {
        Label {
            Text(title)
        } icon: {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
        }
        .font(.callout.weight(.medium))
    }
}
