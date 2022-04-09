//
//  NewsView.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import SwiftUI
import WebKit

struct NewsView: View {
    
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(newsList, id: \.id) { news in
                    NewsOption(news: news)
                }
                
                
            }.navigationTitle("Local News")
                .accentColor(Color.black)
            
        }.listStyle(InsetGroupedListStyle())
        
    }
}



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
