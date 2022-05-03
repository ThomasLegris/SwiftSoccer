//
//  ContentView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS on 17/03/2022.
//

import SwiftUI
import Network
import Alamofire

/// Initial app content view.
struct ContentView: View {
    // MARK: - Private Properties
    @State private var isReachable = NetworkReachabilityManager.default?.isReachable == true

    // MARK: - UI
    var body: some View {
        HomeView()
            .alert(isPresented: $isReachable) {
                Alert(title: Text(L10n.errorNoInternet),
                      message: Text(L10n.errorNoInternetDescription),
                      dismissButton: .cancel())
            }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
