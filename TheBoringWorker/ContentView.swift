//
//  ContentView.swift
//  TheBoringWorker
//
//  Created by Harsh Vardhan  Goswami  on 08/09/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack {
            Text("Hello Boring People!")
                .padding()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
