//
//  LaunchDetailsView.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI
import Kingfisher

struct LaunchDetailsView: View {
    @StateObject private var viewModel: LaunchDetailsViewModel
    
    @Environment(\.openURL) private var openURL
    
    private let animation: Namespace.ID
    
    init(launch: RocketLaunch, animation: Namespace.ID) {
        _viewModel = StateObject(wrappedValue: LaunchDetailsViewModel(launch: launch))
        
        self.animation = animation
    }

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            ScrollView(.vertical) {
                content
                    .padding()
            }
        }
        
        .task {
            viewModel.fetchDetails()
        }
    }
    
    private var content: some View {
        VStack(spacing: 32) {
            LaunchRow(launch: viewModel.launch, animation: animation)
            
            serviceProviderInfo
            
            if viewModel.details?.updates?.isEmpty == false {
                updates
            }
        }
    }
    
    private var serviceProviderInfo: some View {
        infoTile {
            VStack(spacing: 16) {
                Text(viewModel.launch.launchServiceProvider.name)
                    .font(.title)
                
                if let description = viewModel.details?.launchServiceProvider.description {
                    Text(description)
                } else {
                    Text(LaunchDetails.mock.launchServiceProvider.description!)
                        .redacted(reason: .placeholder)
                }
                
                HStack(spacing: 32) {
                    safariButton
                    if viewModel.streamURL != nil {
                        openStreamButton
                    }
                }
            }
        }
    }
    
    private var updates: some View {
        infoTile {
            VStack(spacing: 16) {
                Text("Updates")
                    .font(.title)
        
                ForEach(viewModel.details!.updates!) { update in
                    Text(update.comment)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.tertiaryBackground)
                        )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var openStreamButton: some View {
        Button(
            action: openStream,
            label: {
                HStack {
                    Image(systemName: "play.circle")
                    Text("Watch")
                        .font(.footnote)
                }
                .foregroundColor(.red)
            }
        )
    }
    
    private var safariButton: some View {
        Button(
            action: openServiceProviderWebsite,
            label: {
                HStack {
                    Image(systemName: "safari")
                    Text("Website")
                        .font(.footnote)
                }
                .foregroundColor(Color.blue)
            }
        )
    }
    
    private func infoTile<Content: View>(_ body: () -> Content) -> some View {
        body()
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.secondaryBackground)
            )
    }
    
    // MARK: - Actions
    
    private func openServiceProviderWebsite() {
        guard let url = viewModel.serviceProviderWebsite else {
            return
        }
        
        openURL(url)
    }
    
    private func openStream() {
        guard let url = viewModel.streamURL else {
            return
        }
        
        openURL(url)
    }
}

struct LaunchDetailsView_Previews: PreviewProvider {
    
    @Namespace static var animation
    
    static var previews: some View {
        LaunchDetailsView(launch: .mock, animation: animation)
            .preferredColorScheme(.dark)
    }
}
