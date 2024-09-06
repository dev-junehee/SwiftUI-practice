//
//  MovieCategoryView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/6/24.
//

import SwiftUI

struct MovieCategory: Hashable {
    let id = UUID()
    let name = ["SF", "가족", "스릴러", "로맨스", "드라마", "액션"].randomElement()!
    let count = Int.random(in: 1...100)
}

struct MovieCategoryView: View {
    
    @State private var searchText = ""
    @State private var movieList: [MovieCategory] = [
        MovieCategory(), MovieCategory(), MovieCategory(), MovieCategory(), MovieCategory(),
        MovieCategory(), MovieCategory(), MovieCategory(), MovieCategory(), MovieCategory(),
    ]
    
    var filtered: [MovieCategory] {
        return searchText.isEmpty ? movieList : movieList.filter { $0.name.contains(searchText) }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filtered, id: \.id) { item in
                    NavigationLink {
                        MovieDetailView() /// 임시
                    } label: {
                        cellView(item)
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $searchText, prompt: "영화를 검색해 보세요~!")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        movieList.append(MovieCategory())
                    }
                }
            }
        }
        
    }
    
    private func cellView(_ item: MovieCategory) -> some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 15, height: 15)
            Text("\(item.name) (\(item.count))")
        }
    }
    
    
}


struct MovieDetailView: View {
    var body: some View {
        Text("HI")
    }
}

#Preview {
    MovieCategoryView()
}
