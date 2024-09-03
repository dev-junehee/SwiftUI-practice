//
//  UserSearchView.swift
//  SwiftUI-practice
//
//  Created by junehee on 9/4/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
}


struct UserSearchView: View {
    
    @State private var searchText = ""
    
    let userList = [
        UserModel(name: "김철수", englishName: "Chulsoo Kim"),
        UserModel(name: "이영희", englishName: "Younghee Lee"),
        UserModel(name: "박지수", englishName: "Jisoo Park"),
        UserModel(name: "최민준", englishName: "Minjun Choi"),
        UserModel(name: "정다은", englishName: "Daeun Jung"),
        UserModel(name: "강하늘", englishName: "Haneul Kang"),
        UserModel(name: "윤수민", englishName: "Sumin Yoon"),
        UserModel(name: "조서연", englishName: "Seoyeon Jo"),
        UserModel(name: "안준호", englishName: "Junho Ahn"),
        UserModel(name: "서윤아", englishName: "Yoona Seo"),
        UserModel(name: "문서현", englishName: "Seohyun Moon"),
        UserModel(name: "손지호", englishName: "Jiho Son"),
        UserModel(name: "심하은", englishName: "Haeun Shim"),
        UserModel(name: "오태양", englishName: "Taeyang Oh"),
        UserModel(name: "유보람", englishName: "Boram Yoo"),
        UserModel(name: "백성현", englishName: "Sung Hyun Baek"),
        UserModel(name: "황지민", englishName: "Jimin Hwang"),
        UserModel(name: "전다빈", englishName: "Dabin Jeon"),
        UserModel(name: "임서준", englishName: "Seojun Lim"),
        UserModel(name: "신예지", englishName: "Yeji Shin"),
        UserModel(name: "한지우", englishName: "Jiwoo Han"),
        UserModel(name: "홍수아", englishName: "Sua Hong"),
        UserModel(name: "양성민", englishName: "Sungmin Yang"),
        UserModel(name: "배준혁", englishName: "Junhyuk Bae"),
        UserModel(name: "조민지", englishName: "Minji Jo"),
        UserModel(name: "권다원", englishName: "Dawon Kwon"),
        UserModel(name: "노지훈", englishName: "Jihoon No"),
        UserModel(name: "곽은비", englishName: "Eunbi Kwak"),
        UserModel(name: "신아린", englishName: "Arin Shin"),
        UserModel(name: "고도영", englishName: "Doyoung Ko"),
        UserModel(name: "정하린", englishName: "Harin Jung"),
        UserModel(name: "양예슬", englishName: "Yesul Yang"),
        UserModel(name: "최재원", englishName: "Jaewon Choi"),
        UserModel(name: "윤지후", englishName: "Jihoo Yoon"),
        UserModel(name: "박채원", englishName: "Chaewon Park"),
        UserModel(name: "이하은", englishName: "Haeun Lee"),
        UserModel(name: "김태호", englishName: "Taeho Kim"),
        UserModel(name: "황민서", englishName: "Minseo Hwang"),
        UserModel(name: "송도영", englishName: "Doyoung Song"),
        UserModel(name: "서지우", englishName: "Jiwoo Seo"),
        UserModel(name: "전예빈", englishName: "Yebin Jeon"),
        UserModel(name: "장서윤", englishName: "Seoyoon Jang"),
        UserModel(name: "차은우", englishName: "Eunwoo Cha"),
        UserModel(name: "민하린", englishName: "Harin Min"),
        UserModel(name: "김지훈", englishName: "Jihoon Kim"),
        UserModel(name: "유나연", englishName: "Nayeon Yoo"),
        UserModel(name: "정도현", englishName: "Dohyun Jung"),
        UserModel(name: "한서윤", englishName: "Seoyoon Han"),
        UserModel(name: "박지현", englishName: "Jihyun Park"),
        UserModel(name: "이현서", englishName: "Hyunseo Lee"),
        UserModel(name: "최예린", englishName: "Yerin Choi"),
        UserModel(name: "조윤성", englishName: "Yoonsung Jo"),
        UserModel(name: "강다연", englishName: "Dayeon Kang"),
        UserModel(name: "김지수", englishName: "Jisoo Kim"),
        UserModel(name: "박수민", englishName: "Sumin Park"),
        UserModel(name: "최하은", englishName: "Haeun Choi"),
        UserModel(name: "양하준", englishName: "Hajun Yang"),
        UserModel(name: "정민서", englishName: "Minseo Jung"),
        UserModel(name: "전서윤", englishName: "Seoyoon Jeon"),
        UserModel(name: "임유진", englishName: "Yujin Lim"),
        UserModel(name: "한예린", englishName: "Yerin Han"),
        UserModel(name: "송지우", englishName: "Jiwoo Song"),
        UserModel(name: "김민재", englishName: "Minjae Kim"),
        UserModel(name: "박하율", englishName: "Hayul Park"),
        UserModel(name: "최수현", englishName: "Suhyun Choi"),
        UserModel(name: "윤재민", englishName: "Jaemin Yoon"),
        UserModel(name: "신나연", englishName: "Nayeon Shin"),
        UserModel(name: "오민수", englishName: "Minsu Oh"),
        UserModel(name: "이채은", englishName: "Chaeun Lee"),
        UserModel(name: "차유진", englishName: "Yujin Cha"),
        UserModel(name: "황서진", englishName: "Seojin Hwang"),
        UserModel(name: "민지우", englishName: "Jiwoo Min"),
        UserModel(name: "김도영", englishName: "Doyoung Kim"),
        UserModel(name: "박준수", englishName: "Junsu Park"),
        UserModel(name: "이예슬", englishName: "Yesul Lee"),
        UserModel(name: "최수빈", englishName: "Subin Choi"),
        UserModel(name: "정서진", englishName: "Seojin Jung"),
        UserModel(name: "조민성", englishName: "Minsung Jo"),
        UserModel(name: "송하윤", englishName: "Hayun Song"),
        UserModel(name: "장현우", englishName: "Hyunwoo Jang"),
        UserModel(name: "안수빈", englishName: "Subin Ahn"),
        UserModel(name: "홍민준", englishName: "Minjun Hong"),
        UserModel(name: "유지안", englishName: "Jian Yoo"),
        UserModel(name: "백현서", englishName: "Hyunseo Baek"),
        UserModel(name: "심예은", englishName: "Yeeun Shim"),
        UserModel(name: "문태윤", englishName: "Tayoon Moon"),
        UserModel(name: "강하린", englishName: "Harin Kang"),
        UserModel(name: "조다인", englishName: "Dain Jo"),
        UserModel(name: "한민지", englishName: "Minji Han"),
        UserModel(name: "김수현", englishName: "Suhyun Kim"),
        UserModel(name: "박재준", englishName: "Jaejun Park"),
        UserModel(name: "이하진", englishName: "Hajin Lee"),
        UserModel(name: "최다은", englishName: "Daeun Choi"),
        UserModel(name: "윤지호", englishName: "Jiho Yoon"),
        UserModel(name: "조재민", englishName: "Jaemin Jo"),
        UserModel(name: "이예나", englishName: "Yena Lee"),
        UserModel(name: "강지수", englishName: "Jisoo Kang"),
    ]
    
    var filteredList: [UserModel] {
        return searchText.isEmpty ? userList : userList.filter({ $0.name.contains(searchText) })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(filteredList, id: \.id) { item in
                        listView(item)
                    }
                }
                .searchable(text: $searchText, placement: .automatic, prompt: "사용자를 검색하세요.")
            }
            .navigationTitle("User Search")
        }
    }
    
    private func listView(_ user: UserModel) -> some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 30, height: 30)
                .scaledToFit()
                .background(.gray)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .bold()
                Text(user.englishName)
                    .font(.caption)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
        
    }
    
}

#Preview {
    UserSearchView()
}
