//
//  MovieGridView.swift
//  AppwriteFlix
//
//  Created by Damodar Lohani on 02/01/2022.
//

import SwiftUI

struct MovieGridView: View {
    let movies: [Movie]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .leading, spacing: 4) {
            ForEach(movies) { movie in
                MovieItemThumbnailView(movie: movie)
            }
        }
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView(movies: [])
    }
}
