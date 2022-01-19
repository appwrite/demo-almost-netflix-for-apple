//
//  MovieItemFeaturedView.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 26/12/2021.
//

import SwiftUI
import Kingfisher

struct MovieItemFeaturedView: View {
    @State private var isShowingDetailView = false
    let movie: Movie
    let isInWatchlist: Bool
    let onTapMyList: () -> Void
    
    var body: some View {
        ZStack{
            KFImage.url(URL(string: movie.imageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
            VStack {
                Spacer()
                Text(movie.tags)
                    .foregroundColor(.white)
                HStack {
                    Spacer()
                    Button {
                        onTapMyList()
                    } label: {
                        VStack {
                            Image(systemName: self.isInWatchlist ? "checkmark" :"plus")
                            Text("My List")
                        }
                        .padding()
                    }
                    .foregroundColor(.white)
                    .cornerRadius(4)
                    
                    NavigationLink(destination: MovieDetailsView(movie: movie), isActive: $isShowingDetailView) { EmptyView() }
                    Button {
                        self.isShowingDetailView = true
                    } label: {
                        VStack {
                            Image(systemName: "info.circle")
                            Text("Info")
                        }
                        .padding()
                    }
                    .foregroundColor(.white)
                    .cornerRadius(4)
                    Spacer()
                }
                .padding()
                .frame(height: 60)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.99)]), startPoint: .top, endPoint: .bottom))
        }
        .foregroundColor(.white)
    }
    
    
}

struct MovieItemFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemFeaturedView(movie: Movie(id: "1", name: "Spider Man", durationMinutes: 200, releaseDate: 2000, ageRestriction: "R", thumbnailImageId: "test", description: "Awesome movie", popularityIndex: 12, netflixReleaseDate: 12334, isOriginal: true,
                                           tags: "", genres: "", cast: ""),
                              isInWatchlist: true, onTapMyList: {})
    }
}
