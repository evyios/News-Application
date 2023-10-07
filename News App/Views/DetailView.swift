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
    
    var animation: Namespace.ID
    
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        VStack {
            VStack {
                CachedAsyncImage(url: URL(string: news.imageUrl), transaction: Transaction(animation: .easeInOut)) { item in
                    if let image = item.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "\(news.id)IMAGE", in: animation)
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
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.black)
                                .frame(width: 30, height: 30)
                                .padding(10)
                                .padding(.bottom,3)
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
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Add to Bookmarks")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background {
                                Color.gray
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                            }
                            
                    }

                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
//    DetailView(news: DeveloperPreview.instance.news)
//        .environmentObject(SharedData())
    ContentView()
}
