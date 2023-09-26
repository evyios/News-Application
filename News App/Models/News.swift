//
//  News.swift
//  News App
//
//  Created by Evgeny on 21.09.23.
//

import Foundation


/*
 Url: https://api.spaceflightnewsapi.net/v4/articles/
 
 Response:
 {
   "count": 18049,
   "next": "https://api.spaceflightnewsapi.net/v3/articles",
   "previous": null,
   "results": [
     {
       "id": 20975,
       "title": "Sierra Space raises $290 million",
       "url": "https://spacenews.com/sierra-space-raises-290-million/",
       "image_url": "https://spacenews.com/wp-content/uploads/2023/09/sierraspace-2023-300x185.jpg",
       "news_site": "SpaceNews",
       "summary": "Sierra Space has raised $290 million in a round led by Japanese investors, providing the company with additional funding to accelerate work on its Dream Chaser vehicle and commercial space stations.",
       "published_at": "2023-09-26T12:00:00Z",
       "updated_at": "2023-09-26T12:07:49.838000Z",
       "featured": false,
       "launches": [],
       "events": []
     }
 */

//struct News: Codable, Identifiable, Hashable {
//    var id: Int
//    var title: String
//    var url: String
//    var imageUrl: String
//    var newsSite: String
//    var summary: String
//    var publishedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, url
//        case imageUrl = "image_url"
//        case newsSite = "news_site"
//        case summary
//        case publishedAt = "published_at"
//    }
//}

struct News : Codable, Identifiable, Hashable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}


