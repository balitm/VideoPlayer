//
//  MainView.swift
//  VideoPlayer (macOS)
//
//  Created by Balázs Kilvády on 12/18/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var _viewModel: UrlViewModel

    var body: some View {
        if _viewModel.isShowPlayer {
            PlayerView()
                .frame(minWidth: 300, idealWidth: 400, maxWidth: .infinity,
                       minHeight: 300, idealHeight: 400, maxHeight: .infinity)
        } else {
            UrlEditor()
                .frame(minWidth: 200, idealWidth: 400, maxWidth: .infinity,
                       minHeight: 98, idealHeight: 98, maxHeight: 98)
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
