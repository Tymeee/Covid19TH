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
            List(newsList, id: \.id) { news in
                NewsBox(news: news)
                
            }.accentColor(Color.black)
            .navigationTitle("Covid-19 News")
                
        }
        
    }
}



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
