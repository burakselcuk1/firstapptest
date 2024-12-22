//
//  ContentView.swift
//  firstapptest
//
//  Created by Burak Selçuk on 22.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Count \(count)")
            
            Button {
                count += 1 // Butona basıldığında count artar
            } label: {
                Text("Artır")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
