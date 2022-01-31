//
//  MapView.swift
//  Covid19App (iOS)
//
//  Created by E2318556 on 24/1/2565 BE.
//

import SwiftUI
import WebKit

struct MapView: View {
    var body: some View {
        NavigationView{
            VStack{
                WebView(url: URL(string: "https://jitasa.care/")!)
                    .padding(20)
                    .cornerRadius(20)
            }.navigationTitle("Map")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
