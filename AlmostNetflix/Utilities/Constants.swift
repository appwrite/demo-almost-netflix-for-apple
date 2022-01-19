//
//  Constants.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 23/12/2021.
//

import Foundation
import SwiftUI
import UIKit
import Appwrite

struct k {
    struct Colors {
        static let red = Color(UIColor(red: 185, green: 9, blue: 11, alpha: 1.0))
    }
}

class AppwriteCategory : Identifiable {
    let id: String
    let title: String
    let queries: [String]
    let orderAttributes: [String]
    let orderTypes: [String]
    
    init(id: String, title: String, queries: [String], orderAttributes: [String], orderTypes: [String]) {
        self.id = id
        self.title = title
        self.queries = queries
        self.orderAttributes = orderAttributes
        self.orderTypes = orderTypes
    }
}


let appwriteCategories: [AppwriteCategory] = [
    AppwriteCategory(
        id: "popular",
    title: "Most Popular on AppwriteFlix",
    queries: [],
    orderAttributes: ["trendingIndex"],
    orderTypes: ["ASC"]
  ),
    AppwriteCategory(
      id: "originals",
      title: "Only on AppwriteFlix",
      queries: [
          Query.equal("isOriginal", value: true),
      ],
      orderAttributes: [],
      orderTypes: []
  ),
  AppwriteCategory(
    id: "last_3_year",
    title: "Released last 3 year",
    queries: [
        Query.greaterEqual("releaseDate", value: 2018),
    ],
    orderAttributes: ["releaseDate"],
    orderTypes: ["ASC"]
),
    AppwriteCategory(
        id: "longer_2_hours",
    title: "Movies longer than 2 hours",
    queries: [
        Query.greaterEqual("durationMinutes", value: 120)
    ],
    orderAttributes: ["durationMinutes"],
    orderTypes: ["DESC"]
),
  AppwriteCategory(
    id: "love",
    title: "Love in the Air",
    queries: [
        Query.search("genres", value: "Romance")
    ],
    orderAttributes: ["trendingIndex"],
    orderTypes: ["DESC"]
  ),
  AppwriteCategory(
    id: "animation",
    title: "Animated worlds",
    queries: [
        Query.search("genres", value: "Animation")
    ],
    orderAttributes: ["trendingIndex"],
    orderTypes: ["DESC"]
  ),
  AppwriteCategory(
    id: "horror",
    title: "It's getting scarry",
    queries: [
        Query.search("genres", value: "Horror")
    ],
    orderAttributes: ["trendingIndex"],
    orderTypes: ["DESC"]
  ),
  AppwriteCategory(
    id: "scifi",
    title: "Sci-Fi awaits...",
    queries: [
        Query.search("genres", value: "Science Fiction")
    ],
    orderAttributes: ["trendingIndex"],
    orderTypes: ["DESC"]
  ),
    AppwriteCategory(
      id: "anime",
      title: "Anime?",
      queries: [
          Query.search("tags", value: "anime")
      ],
      orderAttributes: ["trendingIndex"],
      orderTypes: ["DESC"]
    )
]
