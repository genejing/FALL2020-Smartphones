
import SwiftUI

struct PostListView: View {
    
    let category : PostListCategory
    
    var postList : PostList {
        switch category {
        case .recommand:
            return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        
            
        }
        
    }
    
    
 
    var body: some View {
        List {
            ForEach(postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }.hidden()
                }.listRowInsets(EdgeInsets())
            }
            
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommand)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
        
    }
}
