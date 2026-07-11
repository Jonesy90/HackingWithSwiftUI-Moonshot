//
//  ContentView.swift
//  HackingWithSwiftUI-Moonshot
//
//  Created by Michael Jones on 16/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayoutView(astronauts: viewModel.astronauts, missions: viewModel.missions)
                } else {
                    ListLayoutView(astronauts: viewModel.astronauts, missions: viewModel.missions)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: viewModel.astronauts)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
