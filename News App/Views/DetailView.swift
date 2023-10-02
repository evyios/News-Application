//
//  DetailView.swift
//  News App
//
//  Created by Evgeny on 2.10.23.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    
    let news: News
    
    var body: some View {
        VStack {
            VStack {
                CachedAsyncImage(url: URL(string: news.imageUrl), transaction: Transaction(animation: .easeInOut)) { item in
                    if let image = item.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        HStack {
                            ProgressView()
                        }
                    }
                }
                .ignoresSafeArea()
            }
            .frame(height: UIScreen.main.bounds.height / 2.7)
            
            ScrollView(.vertical) {
                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color(.background)
                    .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()

            }
            .offset(y: -40)
        }
        .background(Color(.background))
    }
}

#Preview {
    DetailView(news: DeveloperPreview.instance.news)
}
