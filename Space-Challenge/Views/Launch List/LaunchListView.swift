//
//  LaunchListView.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI

struct LaunchListView: View {
    @StateObject private var viewModel = LaunchListViewModel()
    
    @Namespace private var animation
    @State private var selectedLaunch: RocketLaunch?
    @State private var showDetails = false

    var body: some View {
        NavigationView {
            content
                .task {
                    viewModel.fetchLaunches()
                }
                .navigationTitle(showDetails ? "Details" : "Launches")
                .toolbar(content: {
                    if showDetails {
                        detailsBackButton
                    }
                })
                .overlay {
                    if let selectedLaunch, showDetails {
                        LaunchDetailsView(launch: selectedLaunch, animation: animation)
                    }
                }
        }
    }
    
    private var content: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                if viewModel.launches.isEmpty {
                    redactedList
                } else {
                    launchList
                    
                    if viewModel.canLoadMore {
                        redactedRow
                    }
                }
            }
            .animation(.easeIn, value: viewModel.launches)
        }
        .padding()
    }
    
    private var redactedList: some View {
        ForEach(0..<10, id: \.self) { _ in
            redactedRow
        }
    }
    
    private var redactedRow: some View {
        LaunchRow(launch: .mock, animation: animation)
            .redacted(reason: .placeholder)
    }
    
    private var launchList: some View {
        ForEach(viewModel.launches) { launch in
            LaunchRow(launch: launch, animation: animation)
                .onTapGesture {
                    selectedLaunch = launch
                    withAnimation {
                        showDetails = true
                    }
                }
        }
    }
    
    private var detailsBackButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(
                action: {
                    withAnimation {
                        showDetails = false
                    }
                },
                label: {
                    Image(systemName: "chevron.left")
                }
            )
        }
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
            .preferredColorScheme(.dark)
    }
}
