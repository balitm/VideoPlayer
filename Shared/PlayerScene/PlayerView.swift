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
                    _backButtonLabel
                }
                .buttonStyle(VideoPlayerButtonStyle())
                .padding(.top, 8)

                Spacer()
            }
        }
    }

    private var _backButtonLabel: some View {
        let imageView = Image(systemName: "chevron.left")
            .font(.system(size: 15, weight: .semibold))
        #if os(iOS)
        return imageView
            .padding(.all, 14)
        #else
        return imageView
        #endif
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .environmentObject(UrlViewModel())
    }
}
