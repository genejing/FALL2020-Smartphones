

import SwiftUI

struct PostDetailView: View {
    
    let post : Post
    var body: some View {
        List {
            PostCell(post: post).listRowInsets(EdgeInsets())
            ForEach(1...10, id : \.self) { i in
                Text("comment \(i)")
                 
            }
            
        }
        .navigationBarTitle("detail", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
