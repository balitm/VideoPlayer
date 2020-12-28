//
//  MainView.swift
//  VideoPlayer
//
//  Created by Balázs Kilvády on 12/28/20.
//

import SwiftUI

struct UrlEditor: View {
    @EnvironmentObject private var _viewModel: UrlViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Enter URL:")
                .font(.caption)
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
                .buttonStyle(VideoPlayerButtonStyle())
                Spacer()
                Image(systemName: _viewModel.isValid ? "checkmark" : "exclamationmark")
                    .foregroundColor(_viewModel.isValid ? .green : .red)
            }
            .preferredColorScheme(.dark)
        }
        .padding(16)
    }

    private var _playButtonLabel: some View {
        let imageView = Image(systemName: "play.fill")
        #if os(iOS)
        return imageView
            .padding(.all, 10)
        #else
        return imageView
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
        UrlEditor()
            .environmentObject(UrlViewModel())
    }
}
