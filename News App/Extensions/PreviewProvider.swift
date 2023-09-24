//
//  PreviewProvider.swift
//  News App
//
//  Created by Evgeny on 24.09.23.
//

import Foundation
import SwiftUI


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let news = News(
        author: "Neesha A. Tambe",
        title: "Here are the 6 finalists of Startup Battlefield at Disrupt 2023 | TechCrunch",
        description: "During the last two days, 20 startups pitched their companies as part of TechCrunch Startup Battlefield at Disrupt 2023. These 20 companies were selected",
        url: "https://techcrunch.com/2023/09/20/here-are-the-6-finalists-of-startup-battlefield-at-disrupt-2023/",
        urlToImage: "https://techcrunch.com/wp-content/uploads/2023/09/TC22-startup-battlefield-finalists-2023.jpg?w=1200",
        publishedAt: "2023-09-21T02:35:37Z",
        content: "During the last two days, 20 startups pitched their companies as part of TechCrunch Startup Battlefield at Disrupt 2023. These 20 companies were selected as the best of the Startup Battlefield 200 an… [+445 chars]")
    
}
