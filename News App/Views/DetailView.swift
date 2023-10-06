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
    
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        VStack {
            VStack {
                CachedAsyncImage(url: URL(string: news.imageUrl), transaction: Transaction(animation: .easeInOut)) { item in
                    if let image = item.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay(alignment: .topLeading) {
                                Button(action: {
                                    withAnimation(.easeInOut) {
                                        sharedData.showDetail = false
                                    }
                                }, label: {
                                    Image(systemName: "arrow.left")
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                        .padding(18)
                                        .background(Circle().fill(.white))
                                        .padding(.horizontal, 10)
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
            .frame(height: UIScreen.main.bounds.height / 3.5)
            
            ScrollView(.vertical) {
                
                VStack(spacing: 27) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(news.newsSite ?? "Unknown publisher")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text(news.publishedAt?.convertDateString() ?? "Unknown date")
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            
                        } label: {
                            Image("fire")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .padding(6)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                                .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 5)
                        }

                    }
                    .padding(.top, 28)
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -12)
                        .foregroundStyle(.orange)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        Text(news.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(news.summary)
                            .font(.callout)
                            .fontWeight(.regular)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 20)
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
        .environmentObject(SharedData())
}
