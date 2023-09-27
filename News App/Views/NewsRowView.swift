//
//  NewsRowView.swift
//  News App
//
//  Created by Evgeny on 24.09.23.
//

import SwiftUI
import CachedAsyncImage

struct NewsRowView: View {
    
    let news: News
    
    var body: some View {
        HStack(spacing: 0) {
            
            CachedAsyncImage(url: URL(string: news.imageUrl), transaction: Transaction(animation: .easeInOut)) { item in
                if let image = item.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 120)
                        .cornerRadius(8)
                        .padding(10)
                } else {
                    HStack {
                        ProgressView()
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(news.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Text(news.newsSite ?? "Unknown publisher")
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(news.publishedAt?.convertDateString() ?? "Unknown date")
                    .font(.subheadline)
                    .fontWeight(.regular)
               
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal,-10)
        .padding(.trailing,5)
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(news: dev.news)
    }
}
