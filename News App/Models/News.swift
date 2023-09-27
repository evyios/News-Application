//
//  News.swift
//  News App
//
//  Created by Evgeny on 21.09.23.
//

import Foundation


/*
 Url: https://api.spaceflightnewsapi.net/v3/articles
 
 Response:
 {
 "id":20985,
 "title":"Space Force selects university partner to evaluate classified ground systems software",
 "url":"https://spacenews.com/space-force-selects-university-partner-to-evaluate-classified-ground-systems-software/",
 "imageUrl":"https://spacenews.com/wp-content/uploads/2023/09/image002-300x225.jpg","newsSite":"SpaceNews",
 "summary":"The Space Force awarded a $10 million contract to the Johns Hopkins University Applied Physics Lab to evaluate the software and cybersecurity of ground systems being developed for a new classified satellite network.",
 "publishedAt":"2023-09-27T00:03:16.000Z",
 "updatedAt":"2023-09-27T00:07:49.739Z",
 "featured":false,
 "launches":[],
 "events":[]
 },
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
//        case id
//        case title
//        case url
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
    var newsSite: String?
    var summary: String
    var publishedAt: String?
}


