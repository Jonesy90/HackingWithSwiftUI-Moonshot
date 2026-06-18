//
//  Mission.swift
//  HackingWithSwiftUI-Moonshot
//
//  Created by Michael Jones on 18/06/2026.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    var id: Int
    var launchDate: Date?
    var crew: [CrewRole]
    var description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
