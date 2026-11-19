import SwiftUI

struct ContentView: View {
    @State private var showsDiagram = false
    @State private var regions = DiagramRegion.initialValues

    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Label("Venn-diagram", systemImage: "circle.hexagongrid.fill")
                        .font(.title2.weight(.semibold))
                        .foregroundStyle(.black)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Text i varje område")
                            .font(.headline)
                        Text("Använd A–F och K enligt diagrammet. K är mitten där alla tre cirklar möts.")
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    VStack(spacing: 12) {
                        ForEach($regions) { $region in
                            HStack(alignment: .firstTextBaseline, spacing: 12) {
                                Text(region.id)
                                    .font(.headline.monospaced())
                                    .frame(width: 18)
                                TextField("Text för \(region.id)", text: $region.text, axis: .vertical)
                                    .textFieldStyle(.roundedBorder)
                                    .lineLimit(1...3)
                                    .accessibilityLabel("Område \(region.id), \(region.location)")
                            }
                            .help(region.location)
                        }
                    }

                    Button {
                        showsDiagram = true
                    } label: {
                        Label("Visa diagram", systemImage: "plus.circle.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .keyboardShortcut(.return, modifiers: [])
                }
                .padding(28)
            }
            .frame(width: 320)
            .frame(maxHeight: .infinity)
            .background(Color(white: 0.96))

            Divider()

            VStack(alignment: .leading, spacing: 8) {
                Text("Ditt diagram")
                    .font(.largeTitle.weight(.semibold))

                if showsDiagram {
                    VennDiagramView(regions: regions)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ContentUnavailableView {
                        Label("Här visas ditt diagram", systemImage: "chart.pie")
                    } description: {
                        Text("Fyll i områdena och klicka på Visa diagram.")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding(32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
        .frame(minWidth: 950, minHeight: 680)
        .preferredColorScheme(.light)
        .tint(.black)
    }
}
