//
//  MyRandomImageView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import SwiftUI

struct SectionModel: Hashable, Identifiable {
    let id = UUID()
    var title: String
    var images: [RandomImageModel]
}

struct RandomImageModel: Hashable, Identifiable {
    let id = UUID()
    var url: String

    init() {
        self.url = "https://picsum.photos/id/\(Int.random(in: 1...100))/200/300"
    }
}


struct MyRandomImageView: View {
    
    @State private var dataList: [SectionModel] = []
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach($dataList, id: \.self) { data in
                    sectionView(data)
                }
            }
            .navigationTitle("My Random Image")
            .refreshable {
                setData()
            }
        }
        .onAppear {
            setData()
        }
    }
    
    /// 수직 스크롤 - 각 섹션
    private func sectionView(_ data: Binding<SectionModel>) -> some View {
        LazyVStack(alignment: .leading) {
            Text(data.wrappedValue.title)
                .bold()
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(data.images, id: \.self) { image in
                        NavigationLink {
                            MyRandomImageDetailView(title: data.title,
                                                    url: image.url)
                        } label: {
                            cellView(image.wrappedValue.url)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func cellView(_ url: String) -> some View {
        let URL = URL(string: url)
        return AsyncImage(url: URL)
            .frame(width: 120, height: 180)
            .scaledToFill()
            .clipShape(.buttonBorder)
            .background(.white)
            
    }
    
    private func setData() {
        let titles = ["첫 번째 섹션", "두 번째 섹션", "세 번째 섹션", "네 번째 섹션"]
        var sections: [SectionModel] = []
        
        for title in titles {
            var images: [RandomImageModel] = []
            for _ in 0...10 {
                images.append(RandomImageModel())
            }
            sections.append(SectionModel(title: title, images: images))
        }
        dataList = sections
    }
    
}


struct MyRandomImageDetailView: View {
    
    @Binding var title: String
    @Binding var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url))
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
