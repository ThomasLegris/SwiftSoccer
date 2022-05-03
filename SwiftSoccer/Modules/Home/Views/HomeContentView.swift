//
//  HomeContentView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

/// The main home view which display the content.
struct HomeContentView: View {
    // MARK: - Private Properties
    var selectedPage: HomePageType

    // MARK: - UI
    var body: some View {
        switch selectedPage {
        case .liveResult:
            HomeLiveResultView(pageType: selectedPage)
        case .standing:
            HomeStandingView(pageType: selectedPage)
        case .scorers:
            HomeScorersView(pageType: selectedPage)
        }
    }
}

// MARK: - Preview
struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView(selectedPage: .liveResult)
    }
}
