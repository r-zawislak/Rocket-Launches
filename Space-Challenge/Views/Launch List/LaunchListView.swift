//
//  LaunchListView.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI

struct LaunchListView: View {
    @StateObject private var viewModel = LaunchListViewModel()

    var body: some View {
        NavigationView {
            content
                .task {
                    viewModel.fetchLaunches()
                }
                .navigationTitle("Launches")
        }
    }
    
    private var content: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                ForEach(viewModel.launches) { launch in
                    LaunchRow(launch: launch)
                }
            }
        }
        .padding()
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}
