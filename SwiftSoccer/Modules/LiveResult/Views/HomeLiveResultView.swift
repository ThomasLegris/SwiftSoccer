//
//  HomeLiveResultView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

// TODO: Show this page when season 22/23 will be ok
/// Shows a view with current result and next matches.
struct HomeLiveResultView: View {
    // MARK: - Internal Properties
    var viewModel: HomeLiveResultViewModel = HomeLiveResultViewModel()

    // MARK: - UI
    var body: some View {
        Text("To develop")
    }
}

// MARK: - Preview
struct HomeLiveResultView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeLiveResultView(pageType: .liveResult)
        HomeLiveResultView()
    }
}
