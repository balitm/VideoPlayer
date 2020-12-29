//
//  ButtonStyle.swift
//  VideoPlayer (iOS)
//
//  Created by Balázs Kilvády on 12/28/20.
//

import SwiftUI

struct VideoPlayerButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        _MyButton(configuration: configuration)
    }

    private struct _MyButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var _isEnabled: Bool

        var body: some View {
            configuration.label
                .foregroundColor(_isEnabled ? .primary : Color.primary.opacity(0.5))
                .background(
                    Rectangle()//(cornerRadius: 16, style: .continuous)
                        .fill(_isEnabled
                                ? Color.white.opacity(0.141)
                                : Color.white.opacity(0.08))
                        .clipShape(Capsule())
                )
        }
    }
}
