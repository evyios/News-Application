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
    
    let homeVM = HomeVM()
    
    let news = News(id: 20975,
                    title: "Sierra Space raises $290 million",
                    url: "https://spacenews.com/sierra-space-raises-290-million/",
                    imageUrl: "https://spacenews.com/wp-content/uploads/2023/09/sierraspace-2023-300x185.jpg",
                    newsSite: "SpaceNews",
                    summary: "Sierra Space has raised $290 million in a round led by Japanese investors, providing the company with additional funding to accelerate work on its Dream Chaser vehicle and commercial space stations.",
                    publishedAt: "2023-09-26T12:00:00Z")
}
