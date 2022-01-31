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
            GeometryReader { geometry in
                List{
                    ForEach(newsList, id: \.id) { news in
                        NewsOption(news: news)
                    }
                    
                }
            }.navigationTitle("Covid-19 News")
                .accentColor(Color.black)
            
        }.listStyle(InsetGroupedListStyle())
        
    }
}



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
