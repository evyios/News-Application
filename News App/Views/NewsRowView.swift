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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(news: dev.news)
    }
}
