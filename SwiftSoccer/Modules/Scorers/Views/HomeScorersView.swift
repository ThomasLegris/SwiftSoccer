//
//  HomeScorersView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS on 23/03/2022.
//

import SwiftUI
import Combine

/// Display list of scorer for a selected league.
struct HomeScorersView: View, HomePageProtocol {
    // MARK: - Internal Properties
    var pageType: HomePageType
    @ObservedObject var viewModel: HomeScorersViewModel = HomeScorersViewModel()

    // MARK: - UI
    var body: some View {
        List {
            Section {
                ForEach(viewModel.topScorers, id: \.playerId) { scorer in
                    ScorersListRow(model: scorer)
                }
            } header: {
                ScorersListHeader()
            }
        }
        .background(Color("homeBackgroundColor")).ignoresSafeArea()
        .listStyle(.inset)
    }
}

// MARK: - Preview
struct HomeScorersView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScorersView(pageType: .scorers)
    }
}
