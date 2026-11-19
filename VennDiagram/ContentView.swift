import SwiftUI

struct ContentView: View {
    @State private var showsDiagram = false

    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 24) {
                Label("Venn-diagram", systemImage: "circle.hexagongrid.fill")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(Color.accentColor)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Börja med ett exempel")
                        .font(.headline)
                    Text("Visa hur personer med gemensamma intressen hamnar i samma zon.")
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Button {
                    showsDiagram = true
                } label: {
                    Label("Visa exempeldiagram", systemImage: "plus.circle.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .keyboardShortcut(.return, modifiers: [])

                Spacer()
            }
            .padding(28)
            .frame(width: 280)
            .frame(maxHeight: .infinity)
            .background(Color(red: 0.95, green: 0.96, blue: 0.98))

            Divider()

            VStack(alignment: .leading, spacing: 8) {
                Text("Ditt diagram")
                    .font(.largeTitle.weight(.semibold))

                if showsDiagram {
                    Text("Namn i överlappningen tillhör flera intressen.")
                        .foregroundStyle(.secondary)
                    ExampleDiagramView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ContentUnavailableView {
                        Label("Här visas ditt diagram", systemImage: "chart.pie")
                    } description: {
                        Text("Klicka på Visa exempeldiagram för att börja.")
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
    }
}
