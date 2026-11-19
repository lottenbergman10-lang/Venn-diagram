import SwiftUI

struct DiagramRegion: Identifiable {
    let id: String
    let location: String
    let position: UnitPoint
    var text: String

    static let initialValues = [
        DiagramRegion(id: "A", location: "Enbart vänstra cirkeln", position: UnitPoint(x: 0.25, y: 0.30), text: "gåta"),
        DiagramRegion(id: "B", location: "Enbart högra cirkeln", position: UnitPoint(x: 0.75, y: 0.30), text: "let-tråd"),
        DiagramRegion(id: "C", location: "Enbart nedre cirkeln", position: UnitPoint(x: 0.50, y: 0.76), text: "läktaren"),
        DiagramRegion(id: "D", location: "Vänstra och högra cirkeln", position: UnitPoint(x: 0.50, y: 0.23), text: "blåsippa"),
        DiagramRegion(id: "E", location: "Vänstra och nedre cirkeln", position: UnitPoint(x: 0.34, y: 0.55), text: "Skebokvarnsvägen"),
        DiagramRegion(id: "F", location: "Högra och nedre cirkeln", position: UnitPoint(x: 0.66, y: 0.55), text: "Dan Brown"),
        DiagramRegion(id: "K", location: "Alla tre cirklarna", position: UnitPoint(x: 0.50, y: 0.44), text: "Schubert")
    ]
}

struct VennDiagramView: View {
    let regions: [DiagramRegion]

    var body: some View {
        GeometryReader { geometry in
            let side = min(geometry.size.width, geometry.size.height)

            ZStack {
                diagramCircle(x: 0.36, y: 0.36, side: side)
                diagramCircle(x: 0.64, y: 0.36, side: side)
                diagramCircle(x: 0.50, y: 0.60, side: side)

                ForEach(regions) { region in
                    Text(region.text)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .minimumScaleFactor(0.65)
                        .frame(width: side * 0.19, height: side * 0.14)
                        .position(x: side * region.position.x, y: side * region.position.y)
                        .accessibilityLabel("Område \(region.id), \(region.text)")
                }
            }
            .frame(width: side, height: side)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .background(.white)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Venn-diagram med tre cirklar och områdena A, B, C, D, E, F och K")
    }

    private func diagramCircle(x: CGFloat, y: CGFloat, side: CGFloat) -> some View {
        Circle()
            .strokeBorder(.black, lineWidth: 2)
            .frame(width: side * 0.54, height: side * 0.54)
            .position(x: side * x, y: side * y)
            .accessibilityHidden(true)
    }
}
