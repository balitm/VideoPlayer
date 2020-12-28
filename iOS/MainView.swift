//
//  MainView.swift
//  VideoPlayer (iOS)
//
//  Created by Balázs Kilvády on 12/28/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var _viewModel: UrlViewModel

    var body: some View {
        if _viewModel.isShowPlayer {
            PlayerView()
                .statusBar(hidden: _viewModel.isShowPlayer)
        } else {
            UrlEditor()
                .statusBar(hidden: _viewModel.isShowPlayer)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
            .environmentObject(UrlViewModel())
    }
}
