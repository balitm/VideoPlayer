//
//  ContentView.swift
//  Shared
//
//  Created by Balázs Kilvády on 12/18/20.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    @EnvironmentObject private var _viewModel: UrlViewModel
    @State private var navBarHidden = false

    var body: some View {
        VStack(spacing: 0) {
            Text("WTF")
            // VideoPlayer(player: AVPlayer(url: _viewModel.url))
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(navBarHidden)
        .onAppear(perform: {
                self.navBarHidden = true
            })
        // .navigationBarTitle("")
        // .navigationBarHidden(true)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .environmentObject(UrlViewModel())
    }
}
