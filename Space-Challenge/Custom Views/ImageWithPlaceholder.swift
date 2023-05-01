//
//  ImageWithPlaceholder.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import SwiftUI
import Kingfisher

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
        KFImage(url)
            .resizable()
            .placeholder { progress in
                placeholder
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height, alignment: .center)
            .clipped()
    }
    
    private var placeholder: some View {
        Rectangle()
            .fill(Color.tertiaryBackground.opacity(0.4))
            .frame(width: width, height: height)
    }
}
