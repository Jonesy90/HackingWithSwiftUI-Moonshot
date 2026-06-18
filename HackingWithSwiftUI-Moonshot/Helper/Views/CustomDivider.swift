//
//  CustomDivider.swift
//  HackingWithSwiftUI-Moonshot
//
//  Created by Michael Jones on 18/06/2026.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
