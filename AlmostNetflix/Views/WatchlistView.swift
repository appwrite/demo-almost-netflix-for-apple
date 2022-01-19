//
//  WatchlistView.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 31/12/2021.
//

import SwiftUI

struct WatchlistView: View {
    @EnvironmentObject var moviesVM: MoviesVM
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if(!(moviesVM.movies["watchlist"] ?? []).isEmpty) {
                MovieGridView(movies: moviesVM.movies["watchlist"] ?? [])
            } else {
                Text("You have no items in your watchlist")
                    .foregroundColor(Color.white)
            }
        }
        .padding()
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
