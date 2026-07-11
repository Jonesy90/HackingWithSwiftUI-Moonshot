//
//  ContentView.swift
//  HackingWithSwiftUI-Moonshot
//
//  Created by Michael Jones on 16/06/2026.
//

/*
 Challenge:
 
 1. Add the launch date to MissionView, below the mission badge. You might choose to format this differently given that more space is available, but it’s down to you.
 2. Extract one or two pieces of view code into their own new SwiftUI views – the horizontal scroll view in MissionView is a great candidate, but if you followed my styling then you could also move the Rectangle dividers out too.
 3. For a tough challenge, add a toolbar item to ContentView that toggles between showing missions as a grid and as a list.
 */

/* Navigation Challenge
 1. Return to project 8 (Moonshot), and upgrade it to use NavigationLink(value:). This means adding Hashable conformance, and thinking carefully how to use navigationDestination().
*/

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
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
                MissionView(mission: mission, astronauts: astronauts)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
