//
//  News.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import SwiftUI
import WebKit

struct NewsBox: View {
    
    @State private var showWebView = false
    
    var body: some View {
 
        
        Button {
            showWebView.toggle()
        } label: {
            HStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                Text("Hello World")
            }
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: "https://www.thairath.co.th/timeline_corona")!)
        }
        
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

struct NewsBox_Previews: PreviewProvider {
    static var previews: some View {
        NewsBox()
    }
}
