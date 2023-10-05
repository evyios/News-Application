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
                            .overlay(alignment: .topLeading) {
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "arrow.left")
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                        .padding(20)
                                        .background(Circle().fill(.white))
                                        .padding(.horizontal, 70)
                                        .padding(.vertical, 60)
                                })
                            }
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
