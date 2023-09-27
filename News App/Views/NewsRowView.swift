//
//  NewsRowView.swift
//  News App
//
//  Created by Evgeny on 24.09.23.
//

import SwiftUI

struct NewsRowView: View {
    
    let news: News
    
    var body: some View {
        HStack(spacing: 0) {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 120)
                .cornerRadius(8)
                .padding(10)
                
            
            VStack(alignment: .leading, spacing: 12) {
                Text(news.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Text(news.newsSite)
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(news.publishedAt.convertDateString() ?? "Unknown date")
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
