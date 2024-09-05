//
//  MyRandomImageView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import SwiftUI

struct RandomImageModel {
    let id = UUID()
    let url: String

    init() {
        self.url = "https://picsum.photos/id/\(Int.random(in: 1...1000))/200/300"
    }
}

struct MyRandomImageView: View {
    
    @State private var titleList = ["첫 번째 섹션", "두 번째 섹션", "세 번째 섹션", "네 번째 섹션"]
    @State private var imageList: [RandomImageModel] = []
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach($titleList, id: \.self) { $item in
                    sectionView(title: $item)
                }
            }
            .navigationTitle("My Random Image")
            .refreshable {
                var count = 0
                while count < 10 {
                    imageList.append(RandomImageModel())
                    count += 1
                }
            }
        }
        .onAppear {
            var count = 0
            while count < 10 {
                imageList.append(RandomImageModel())
                count += 1
            }
        }
    }
    
    /// 수직 스크롤 - 각 섹션
    private func sectionView(title: Binding<String>) -> some View {
        LazyVStack(alignment: .leading) {
            Text(title.wrappedValue)
                .bold()
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(imageList, id: \.id) { item in
                        NavigationLink {
                            MyRandomImageDetailView(title: title)
                        } label: {
                            cellView(item)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func cellView(_ item: RandomImageModel) -> some View {
        return AsyncImage(url: item.url)
            .frame(width: 120, height: 180)
            .scaledToFill()
            .clipShape(.buttonBorder)
            .background(.white)
            
    }
    
}


struct MyRandomImageDetailView: View {
    
    @Binding var title: String
    
    var body: some View {
        Image(systemName: "star")
            .frame(width: 200, height: 300)
            .background(.gray)
        TextField("Section Title", text: $title)
            .frame(width: 200)
            .multilineTextAlignment(.center)
    }
    
}


#Preview {
    MyRandomImageView()
}
