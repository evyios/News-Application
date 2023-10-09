//
//  MainView.swift
//  News App
//
//  Created by Evgeny on 22.09.23.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: Tab = .home
    @Namespace var animation
    
    @StateObject var sharedData: SharedData = .init()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .setTabBackground(Color(.background))
                    .tag(Tab.home)
                
                Text("Trending")
                    .setTabBackground(Color(.background))
                    .tag(Tab.trending)
                
                Text("Settings")
                    .setTabBackground(Color(.background))
                    .tag(Tab.settings)
                
                Text("Profile")
                    .setTabBackground(Color(.background))
                    .tag(Tab.profile)
            }
            TabBar()
        }
        .overlay {
            ZStack {
                if let news = sharedData.detailNews, sharedData.showDetail {
                    DetailView(news: news, animation: animation)
                        .environmentObject(sharedData)
                }
            }
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Image(tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.5))
                    .offset(y: currentTab == tab ? -30 : 0)
                    .background {
                        if currentTab == tab {
                            Circle()
                                .fill(.orange)
                                .scaleEffect(2)
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 5, y: 10)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                                .offset(y: currentTab == tab ? -30 : 0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top,15)
                    .padding(.bottom,10)
                    .containerShape(Rectangle())
                    .onTapGesture { currentTab = tab }
            }
        }
        .padding(.horizontal, 15)
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.65), value: currentTab)
        .background {
            CustomCorner(corners: [.topLeft, .topRight], radius: 25)
                .fill(.gray.opacity(0.2))
                .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: Tab background

extension View {
    @ViewBuilder
    func setTabBackground(_ color: Color) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                color
                    .ignoresSafeArea()
            }
    }
}
