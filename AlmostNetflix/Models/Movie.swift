//
//  Movie.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 26/12/2021.
//

import Foundation

class Movie: Identifiable {
    public let id: String
    public let name: String
    public let durationMinutes: Int
    public let releaseDate: Int?
    public let ageRestriction: String
    public let thumbnailImageId: String
    public let description: String
    public let popularityIndex: Float?
    public let netflixReleaseDate: Int
    public let isOriginal: Bool
    public let tags: String
    public let genres: String
    public let cast: String
    public let imageUrl: String
    
    public func duration() -> String {
        let hours = durationMinutes / 60
        let minutes = durationMinutes % 60
        return "\(hours)h \(minutes)m"
    }
    
    public func releaseYear() -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(releaseDate ?? 0))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "YYYY"
        
        // UnComment below to get only time
        //  dayTimePeriodFormatter.dateFormat = "hh:mm a"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    init(
        id: String,
        name: String,
        durationMinutes: Int,
        releaseDate: Int?,
        ageRestriction: String,
        thumbnailImageId: String,
        description: String,
        popularityIndex: Float?,
        netflixReleaseDate: Int,
        isOriginal: Bool,
        tags: String,
        genres: String,
        cast: String
    ) {
        self.id = id
        self.name = name
        self.durationMinutes = durationMinutes
        self.releaseDate = releaseDate
        self.ageRestriction = ageRestriction
        self.thumbnailImageId = thumbnailImageId
        self.description = description
        self.popularityIndex = popularityIndex
        self.netflixReleaseDate = netflixReleaseDate
        self.isOriginal = isOriginal
        self.tags = tags
        self.genres = genres
        self.cast = cast
        self.imageUrl = AppwriteService.shared.client.endPoint + "/storage/files/" + thumbnailImageId + "/preview?project=almostNetflix2&width=320&height=480"
    }
    
    public static func from(map: [String: Any]) -> Movie {
        return Movie(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            durationMinutes: map["durationMinutes"] as! Int,
            releaseDate: map["releaseDate"] as! Int?,
            ageRestriction: map["ageRestriction"] as! String,
            thumbnailImageId: map["thumbnailImageId"] as! String,
            description: map["description"] as! String,
            popularityIndex: map["popularityIndex"] as! Float?,
            netflixReleaseDate: map["netflixReleaseDate"] as! Int,
            isOriginal: map["isOriginal"] as! Bool,
            tags: map["tags"] as! String,
            genres: map["genres"] as! String,
            cast: map["cast"] as! String
        )
    }
    
    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "durationMinutes": durationMinutes as Any,
            "releaseDate": releaseDate as Any,
            "ageRestriction": ageRestriction as Any,
            "thumbnailImageId": thumbnailImageId as Any,
            "description": description as Any,
            "popularityIndex": popularityIndex as Any,
            "netflixReleaseDate": netflixReleaseDate as Any,
            "isOriginal": isOriginal as Any,
            "cast": cast as Any,
            "genres": genres as Any,
            "tags": tags as Any
        ]
    }
}
