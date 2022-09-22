//
//  HomeStandingView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Combine

/// View to display the current season standing.
struct HomeStandingView: View {
    // MARK: - Internal Properties
    @ObservedObject var viewModel: HomeStandingViewModel
    
    init(selectedLeague: SoccerLeague) {
        viewModel = HomeStandingViewModel(selectedLeague: selectedLeague)
    }

    // MARK: - UI
    var body: some View {
        List {
            Section {
                ForEach(viewModel.rankedTeams, id: \.position) { team in
                    StandingListRow(model: team)
                        .background(.clear)
                }
            } header: {
                StandingListHeader()
            }
        }
        .background(Color("homeBackgroundColor"))
        .ignoresSafeArea()
        .listStyle(.inset)
    }
}

// MARK: - Preview
struct HomeStandingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStandingView(selectedLeague: .ligue1)
    }
}
