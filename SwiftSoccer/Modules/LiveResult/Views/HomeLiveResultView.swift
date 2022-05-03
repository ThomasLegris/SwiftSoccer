//
//  HomeLiveResultView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

/// Shows a view with current result and next matches.
struct HomeLiveResultView: View, HomePageProtocol {
    // MARK: - Internal Properties
    var pageType: HomePageType
    var viewModel: HomeLiveResultViewModel = HomeLiveResultViewModel()

    // MARK: - UI
    var body: some View {
        Text(pageType.title)
    }
}

// MARK: - Preview
struct HomeLiveResultView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLiveResultView(pageType: .liveResult)
    }
}
