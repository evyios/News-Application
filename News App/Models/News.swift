//
//  News.swift
//  News App
//
//  Created by Evgeny on 21.09.23.
//

import Foundation


/*
 Url: https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dd4ce7c6e3dd435882acc60363ceed60
 
 Response:
 {
 -"source": {
 "id": "techcrunch",
 "name": "TechCrunch"
 },
 "author": "Neesha A. Tambe",
 "title": "Here are the 6 finalists of Startup Battlefield at Disrupt 2023 | TechCrunch",
 "description": "During the last two days, 20 startups pitched their companies as part of TechCrunch Startup Battlefield at Disrupt 2023. These 20 companies were selected",
 "url": "https://techcrunch.com/2023/09/20/here-are-the-6-finalists-of-startup-battlefield-at-disrupt-2023/",
 "urlToImage": "https://techcrunch.com/wp-content/uploads/2023/09/TC22-startup-battlefield-finalists-2023.jpg?w=1200",
 "publishedAt": "2023-09-21T02:35:37Z",
 "content": "During the last two days, 20 startups pitched their companies as part of TechCrunch Startup Battlefield at Disrupt 2023. These 20 companies were selected as the best of the Startup Battlefield 200 an… [+445 chars]"
 }
 */

struct News: Identifiable, Codable {
    var id = UUID().uuidString
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

