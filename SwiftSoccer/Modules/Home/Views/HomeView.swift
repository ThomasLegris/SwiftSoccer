//
//  HomeView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

struct HomeTabBar: View {
    @Binding var selectedPage: HomePageType
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selectedPage) {
                HomeContentView(selectedPage: selectedPage)
                    .padding(.vertical, CommonConstant.padding)
                    .padding(.horizontal, 16.0)
            }
            .background(.white)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            TabBarView(selectedPage: self.$selectedPage)
        }
    }
}

/// Home view which displays a page according to its index.
struct HomeView: View {
    // MARK: - Private Properties
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    @State var selectedPage: HomePageType = .standing
    
    // MARK: - UI
    var body: some View {
            HomeTabBar(selectedPage: $selectedPage)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
