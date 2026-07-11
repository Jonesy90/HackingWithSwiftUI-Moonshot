//
//  ViewModel-ContentView.swift
//  HackingWithSwiftUI-Moonshot
//
//  Created by Michael Jones on 11/07/2026.
//

import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
    }
}
