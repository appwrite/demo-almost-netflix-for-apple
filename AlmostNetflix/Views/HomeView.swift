//
//  HomeView.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 26/12/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var moviesVM: MoviesVM
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    if(moviesVM.featured != nil) {
                        MovieItemFeaturedView(
                            movie: moviesVM.featured!,
                            isInWatchlist: moviesVM.watchList.contains(moviesVM.featured!.id),
                            onTapMyList: {
                                self.onTapMyList(moviesVM.featured!.id)
                            }
                        )
                    } else if(!((moviesVM.movies["movies"] ?? []).isEmpty)) {
                        let movie = (moviesVM.movies["movies"]!).first!
                        
                        MovieItemFeaturedView(
                            movie: movie,
                            isInWatchlist: moviesVM.watchList.contains(movie.id),
                            onTapMyList: {
                                self.onTapMyList(movie.id)
                            }
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(appwriteCategories) { category in
                            MovieCollectionView(title: category.title, movies: moviesVM.movies[category.id] ?? [])
                                .frame(height: 180)
                        }
                    }.padding(.horizontal)
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .foregroundColor(Color.white)
            .navigationTitle("")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    NavigationLink(destination: WatchlistView()) {
                        Text("My List")
                    }
                }
            }
        }.accentColor(Color.red)
    }
    
    func onTapMyList(_ movieId: String) -> Void {
        moviesVM.addToMyList(movieId)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
