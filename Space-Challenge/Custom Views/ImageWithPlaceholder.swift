//
//  ImageWithPlaceholder.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI

struct ImageWithPlaceholder: View {
    let url: URL
    let width: CGFloat?
    let height: CGFloat?
    
    init(url: URL, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.url = url
        self.width = width
        self.height = height
    }

    var body: some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height, alignment: .center)
                    .clipped()
            },
            placeholder: { placeholder }
        )
    }
    
    private var placeholder: some View {
        Rectangle()
            .fill(Color.tertiaryBackground.opacity(0.4))
            .redacted(reason: .placeholder)
            .frame(width: width, height: height)
    }
}
