//
//  Home.swift
//  News App
//
//  Created by Evgeny on 23.09.23.
//

import SwiftUI

struct Home: View {
    
    @State private var activeTag: String = "All"
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HeaderView()
                
                homeImage
                
                Tags()

            }
            .padding(15)
            .padding(.bottom,50)
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 13) {
            Text("World's news")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            
            Button {
                
            } label: {
                Image(systemName: "bell.badge")
                    .renderingMode(.original)
                    .font(.title3)
                    .frame(width: 40, height: 40)
                    .padding(3)
                    .background {
                        Circle()
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
                    }
            }
            
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .frame(width: 40, height: 40)
                    .padding(3)
                    .foregroundColor(.gray)
                    .rotationEffect(Angle(degrees: 90))
                    .background {
                        Circle()
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
                    }
            }
        }
    }
    
    @ViewBuilder
    func Search() -> some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
            
            Divider()
                .padding(.vertical,-6)
            
            TextField("Search", text: .constant(""))
        }
        .padding(15)
        .background {
            Capsule()
                .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
        }
    }
    
    @ViewBuilder
    func Tags() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.callout)
                        .padding(.horizontal,15)
                        .padding(.vertical,5)
                        .background {
                            if activeTag == tag {
                                Capsule()
                                    .fill(Color.orange)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            } else {
                                Capsule()
                                    .fill(Color.gray.opacity(0.2))
                            }
                        }
                        .foregroundColor(activeTag == tag ? .white : .black.opacity(0.7))
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTag = tag
                            }
                        }
                }
            }
            .padding(.horizontal,3)
        }
    }
    
    var tags: [String] = ["All", "Sport", "Travel", "Politic", "Technology", "Education", "Games", "Business"]

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Home {
    private var homeImage: some View {
        Image("image")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay {
                VStack(spacing: -15) {
                    Text("Don't miss the \nlatest news")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 10) {
                            Text("Read now")
        
                            Image(systemName: "arrow.right")
                        }
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                        .padding(.horizontal,10)
                        .padding(.leading, 5)
                        .background {
                            Capsule()
                                .fill(Color("olive"))
                        }
                        .padding(.leading, -10)
                        .padding()
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
    }
}
