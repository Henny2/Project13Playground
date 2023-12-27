//
//  ContentUnavailableTestView.swift
//  Project13Playground
//
//  Created by Henrieke Baunack on 12/26/23.
//

import SwiftUI

struct ContentUnavailableTestView: View {
    var body: some View {
//        ContentUnavailableView("Nothing here!", systemImage: "swift", description: Text("You don't have any snippets created yet."))
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You have not created any snippets yet")
        } actions: {
            Button("Create snippet") {
                // actual do something here
            }.buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentUnavailableTestView()
}
