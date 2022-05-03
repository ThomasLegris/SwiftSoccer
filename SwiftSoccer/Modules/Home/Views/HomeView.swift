//
//  HomeView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

/// Home view which displays a page according to its index.
struct HomeView: View {
    // MARK: - Private Properties
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    @State private var selectedPage: HomePageType = .standing

    // MARK: - UI
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 24.0) {
                Picker("", selection: $selectedPage) {
                    ForEach(HomePageType.allCases, id: \.self) {
                        Text($0.title)
                    }
                }
                .frame(height: CommonConstant.padding,
                       alignment: .top)
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, CommonConstant.padding)
                .padding(.top, CommonConstant.padding)

                HomeContentView(selectedPage: selectedPage)
                    .background(Color("homeBackgroundColor"))
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(L10n.appTitle)
            .foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: Implements `Setting` feature.
                        print("Pressed Menu")
                    } label: {
                        Image(Asset.icMenu.name)
                            .resizable()

                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
