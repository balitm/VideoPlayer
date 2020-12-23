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

    var body: some View {
        ZStack {
            VideoPlayer(player: AVPlayer(url: _viewModel.url))

            VStack {
                Button {
                    withAnimation {
                        _viewModel.isShowPlayer = false
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.all, 16)
                }
                .background(Color.white.opacity(0.141))
                .clipShape(Capsule())
                .padding(.top, 8)

                Spacer()
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .environmentObject(UrlViewModel())
    }
}
