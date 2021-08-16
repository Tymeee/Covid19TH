//
//  ContentView.swift
//  CovidApp2
//
//  Created by 18556 on 7/7/21.
//

import SwiftUI


struct ContentView: View {
    
   
    var body: some View {
        
        
        SplashScreen(imageSize: CGSize(width: 128, height: 128)) {
            
            TabView {
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                        
                    }
                MapView()
                    .tabItem{
                        Image(systemName: "map.fill")
                        Text("Map")
                    }
                
                InformationView()
                    .tabItem{
                        Image(systemName: "info.circle.fill")
                        Text("Information")
                    }
                
                
                
            }.accentColor((Color(red: 229/255, green: 56/255, blue: 59/255)))

            
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }.onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
            
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


