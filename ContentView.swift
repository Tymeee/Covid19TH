//
//  ContentView.swift
//  CovidApp2
//
//  Created by 18556 on 7/7/21.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        
        LaunchScreen(imageSize: CGSize(width: 128, height: 128)) {
            
            TabView {
                DashboardView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                NewsView()
                    .tabItem{
                        Image(systemName: "newspaper.fill")
                        Text("News")
                    }
                
                InformationView()
                    .tabItem{
                        Image(systemName: "info.circle.fill")
                        Text("Information")
                    }
            
            }.accentColor((Color(red: 229/255, green: 56/255, blue: 59/255)))
            
        } logoView: {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)

        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}


