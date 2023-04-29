//
//  LaunchRow.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI

struct LaunchRow: View {
    
    @StateObject var viewModel: LaunchRowViewModel
    
    @State private var infoViewHeight = 0.0
    
    private let tileCornerRadius = 16.0
    
    init(launch: RocketLaunch) {
        _viewModel = StateObject(wrappedValue: LaunchRowViewModel(launch: launch))
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                if let image = viewModel.launch.image {
                    ImageWithPlaceholder(url: image, width: geo.size.width / 3, height: infoViewHeight)
                }
                infoView
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(
                // PropertyKey...
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            DispatchQueue.main.async {
                                infoViewHeight = geo.size.height
                            }
                        }
                }
            )
            .background(Color.secondaryBackground)
            .clipShape(RoundedRectangle(cornerRadius: tileCornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: tileCornerRadius)
                    .stroke(Color.tertiaryBackground, lineWidth: 1)
            )
        }
        .frame(height: infoViewHeight)
    }

    @ViewBuilder
    private var infoView: some View {
        VStack(spacing: 16) {
            Text(viewModel.timeUntilLaunch)
                    .minimumScaleFactor(0.3)
                    .frame(maxWidth: .infinity, alignment: .center)
            infoRow(title: "Mission", value: viewModel.launch.mission.name)
            infoRow(title: "Rocket", value: viewModel.launch.rocket.configuration.fullName)
            infoRow(title: "Service Provider", value: viewModel.launch.launchServiceProvider.name)
            infoRow(title: "Launch", value: viewModel.launchTime)
            
            playButton
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 4)
    }
    
    private var playButton: some View {
        HStack {
            Image(systemName: "play.circle")
            Text("Watch")
                .font(.headline)
        }
        .foregroundColor(.red)
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.red, lineWidth: 1)
        )
        .background(Color.tertiaryBackground)
        .onTapGesture(perform: openVideo)
    }
    
    private func infoRow(title: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.blue)
                .font(.caption)
                .bold()
            Text(value)
                .padding(.leading, 16)
                .font(.caption2)
                .lineLimit(0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Actions
    
    private func openVideo() {
        
    }
}

struct LaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRow(launch: .mock)
            .padding()
            .frame(height: 250)
            .preferredColorScheme(.dark)
    }
}
