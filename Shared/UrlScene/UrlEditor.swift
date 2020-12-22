//
//  UrlEditor.swift
//  VideoPlayer
//
//  Created by Balázs Kilvády on 12/18/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var _viewModel: UrlViewModel
    @State private var _isPush = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Enter URL")
                _UrlEditor(urlString: $_viewModel.urlString, isPush: $_isPush)
                HStack {
                    Button("Play") {
                        _isPush = true
                    }
                    .disabled(!_viewModel.isValid)
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundColor(_viewModel.isValid ? .green : .red)
                }

                // Empty navigation.
                NavigationLink(
                    destination: PlayerView()
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    ,
                    isActive: $_isPush) {
                        EmptyView()
                    }
            }
            .padding()
            .navigationBarTitle("")
            .navigationBarHidden(true)
            // .navigationBarTitle("Play")
        }
    }
}

private struct _UrlEditor: View {
    @Binding private var _urlString: String
    @Binding private var _isPush: Bool

    init(urlString: Binding<String>, isPush: Binding<Bool>) {
        __urlString = urlString
        __isPush = isPush
    }

    var body: some View {
        HStack {
            TextField("Enter url...", text: $_urlString, onCommit: {
                print("onCommit -", _urlString)
                _isPush = true
            })
        }
        .padding()
    }
}

struct UrlEditor_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UrlViewModel())
    }
}
