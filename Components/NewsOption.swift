//
//  News.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import SwiftUI
import WebKit

struct NewsOption: View {
    
    @State private var showWebView = false
    var news: News
    
    var body: some View {
        
        
        NavigationLink(destination: WebView(url: URL(string: news.newsURL)!)) {
            
            Image(news.newsLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .cornerRadius(10)
            
            Text(news.newsName)
            
        }.padding([.top, .bottom], 8)
    }
    
}



struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct NewsOption_Previews: PreviewProvider {
    static var previews: some View {
        NewsOption(news: newsList[0])
    }
}
