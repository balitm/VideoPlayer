//
//  ContentView.swift
//  Shared
//
//  Created by Balázs Kilvády on 2020. 12. 18..
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var username: String = ""

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)", username)
                }) {
                    print("Username onCommit -", username)
                }

                Text("Your username: \(username)")
            }.padding()

            VideoPlayer(player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
