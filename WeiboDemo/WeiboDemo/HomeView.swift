
import SwiftUI

struct HomeView: View {

    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators : false) {
                HStack(spacing : 0) {
                    PostListView(category: .recommand).frame(width: UIScreen.main.bounds.width)
                    PostListView(category: .hot).frame(width: UIScreen.main.bounds.width)
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
