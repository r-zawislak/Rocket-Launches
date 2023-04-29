//
//  LaunchDetailsView.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI

struct LaunchDetailsView: View {
    @StateObject private var viewModel = LaunchDetailsViewModel()

    var body: some View {
       Text("Hello world")
    }
    
    private func asyncImage(for url: URL) -> some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            },
            placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        )
    }
}

struct LaunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsView()
    }
}
