//
//  UrlEditor.swift
//  VideoPlayer
//
//  Created by Balázs Kilvády on 12/18/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var _viewModel: UrlViewModel

    var body: some View {
        if _viewModel.isShowPlayer {
            #if os(iOS)
            PlayerView()
                .statusBar(hidden: _viewModel.isShowPlayer)
            #else
            PlayerView()
            #endif
        } else {
            #if os(iOS)
            _mainBody
                .statusBar(hidden: _viewModel.isShowPlayer)
            #else
            _mainBody
                .frame(minWidth: 200, idealWidth: 400, maxWidth: .infinity,
                       minHeight: 98, idealHeight: 98, maxHeight: 98)
            #endif
        }
    }

    private var _mainBody: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Enter URL:")
                .font(.caption)
                // .padding(.leading, 16)
                .foregroundColor(.secondary)
            _UrlEditor(urlString: $_viewModel.urlString,
                       isShowPlayer: $_viewModel.isShowPlayer)
            HStack(alignment: .center) {
                Button {
                    withAnimation {
                        _viewModel.isShowPlayer = true
                    }
                } label: {
                    _playButtonLabel
                }
                .disabled(!_viewModel.isValid)
                // .background(Color.red)
                Spacer()
                Image(systemName: _viewModel.isValid ? "checkmark" : "exclamationmark")
                    .foregroundColor(_viewModel.isValid ? .green : .red)
            }
            // .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 16))
            .preferredColorScheme(.dark)
        }
        .padding(16)
    }

    private var _playButtonLabel: some View {
        #if os(iOS)
        return Image(systemName: "play.fill")
            .padding(.all, 10)
        #else
        return Image(systemName: "play.fill")
        #endif
    }
}

private struct _UrlEditor: View {
    @Binding private var _urlString: String
    @Binding private var _isShowPlayer: Bool

    init(urlString: Binding<String>, isShowPlayer: Binding<Bool>) {
        __urlString = urlString
        __isShowPlayer = isShowPlayer
    }

    var body: some View {
        HStack {
            TextField("Enter url...", text: $_urlString, onCommit: {
                print("onCommit -", _urlString)
                _isShowPlayer = true
            })
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 8, trailing: 0))
    }
}

struct UrlEditor_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(UrlViewModel())
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(UrlViewModel())
        }
    }
}
