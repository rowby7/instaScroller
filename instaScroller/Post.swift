//
//  Post.swift
//  instaScroller
//
//  Created by Rowby Villanueva on 7/14/25.
//

import Foundation


struct ApiResponse: Decodable{
    let data:[Post]
}
struct Post: Decodable {
   
    let caption: String?
    let mediaUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case caption
        case mediaUrl = "media_url"
    }
}
