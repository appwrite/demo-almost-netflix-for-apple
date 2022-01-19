//
//  MoviesVM.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 27/12/2021.
//

import Foundation
import SwiftUI
import Appwrite

class MoviesVM: ObservableObject {
    @Published var featured: Movie?
    @Published var movies: [String:[Movie]] = [:]
    @Published var watchList: [String] = []
    
    let userId: String
    
    init(userId: String) {
        self.userId = userId
        getMovies()
        getFeatured()
    }
    
    public func getMyWatchlist() {
        AppwriteService.shared.database.listDocuments(
            collectionId: "movies",
            queries: [
                Query.equal("$id",value: watchList)
            ]
        ) {result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    print(err.message)
                case .success(let docs):
                    self.movies["watchlist"] = docs.convertTo(fromJson: Movie.from)
                }
            }
        }
    }
    
    func addToMyList(_ movieId: String) {
        if(self.watchList.contains(movieId)) {
            removeFromMyList(movieId)
        } else {
            AppwriteService.shared.database.createDocument(collectionId: "watchlists", documentId: "unique()", data: ["userId": userId, "movieId": movieId, "createdAt": Int(NSDate.now.timeIntervalSince1970)], read: ["user:\(userId)"], write: ["user:\(userId)"]){ result in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let err):
                        print(err.message)
                    case .success(_):
                        self.watchList.append(movieId)
                        self.getMyWatchlist()
                        print("successfully added to watchlist")
                    }
                    
                }
            }
        }
    }

    func removeFromMyList(_ movieId: String) {
        AppwriteService.shared.database.listDocuments(collectionId: "watchlists", queries: [
                Query.equal("userId", value: userId),
                Query.equal("movieId", value: movieId)
            ], limit: 1) { result in
                switch result {
                case .failure(let err):
                    print(err.message)
                case .success(let docList):
                    AppwriteService.shared.database.deleteDocument(collectionId: "watchlists", documentId: docList.documents.first!.id) {result in
                        DispatchQueue.main.async {
                            switch result {
                            case .failure(let err):
                                print(err.message)
                            case .success(_):
                                let index = self.watchList.firstIndex(of: movieId)
                                if(index != nil) {
                                    self.watchList.remove(at: index!)
                                    self.getMyWatchlist()
                                    print("removed from watchlist")
                                }
                            }
                        }
                    }
                }
            }
    }
    
    func isInWatchlist(_ movieIds: [String]) {
        AppwriteService.shared.database.listDocuments(
            collectionId: "watchlists",
            queries: [
                Query.equal("userId", value: userId),
                Query.equal("movieId", value: movieIds)
            ]
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    print(err.message)
                case .success(let docList):
                    let docs = docList.convertTo(fromJson: Watchlist.from)
                    for doc in docs {
                        self.watchList.append(doc.movieId)
                    }
                    if(docs.count > 1) {
                        self.getMyWatchlist()
                    }
                }
                
            }
        }
    }
    
    
    private func getFeatured() {
        AppwriteService.shared.database.listDocuments(
            collectionId: "movies",
            limit: 1,
            orderAttributes: ["trendingIndex"],
            orderTypes: ["DESC"]
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    print(err.message)
                case .success(let docs):
                    self.featured = docs.convertTo(fromJson: Movie.from).first
                    if(self.featured != nil) {
                        self.isInWatchlist([self.featured!.id])
                    }
                }
                
            }
        }
    }
    
    private func getMovies() {
        appwriteCategories.forEach {category in
            AppwriteService.shared.database.listDocuments(collectionId: "movies", queries: category.queries, orderAttributes: category.orderAttributes, orderTypes: category.orderTypes) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let err):
                        print(err.message)
                    case .success(let docs):
                        self.movies[category.id] = docs.convertTo(fromJson: Movie.from)
                        self.isInWatchlist(docs.documents.map { $0.id });
                    }
                    
                }
            }
        }
    }
}
