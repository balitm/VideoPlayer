//
//  UrlViewModel.swift
//  VideoPlayer
//
//  Created by Balázs Kilvády on 12/18/20.
//

import Foundation
import Combine

private let _defaultURLString = "https://bit.ly/swswift"

class UrlViewModel: ObservableObject {
    // Input
    @Published var urlString = _defaultURLString
    @Published var isShowPlayer = false

    // Output
    @Published var url: URL = URL(string: _defaultURLString)!
    @Published var isValid = false

    private var _bag = Set<AnyCancellable>()

    init() {
        // Get url.
        $urlString
            .compactMap {
                let url = URL(string: $0)
                print("Try to map:", $0, "-", url != nil)
                return url
            }
            .assign(to: \.url, on: self)
            .store(in: &_bag)

        // Validate url.
        $urlString
            .map {
                URL(string: $0) != nil
            }
            .assign(to: \.isValid, on: self)
            .store(in: &_bag)
    }
}
