//
//  News.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//


import SwiftUI
import WebKit

struct AppOption: View {
    
    @State private var showWebView = false
    var apps: Apps
    
    var body: some View {
        
        
        HStack{
            
            Image(apps.appsLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .cornerRadius(10)
            
            

            Button{
                if let url = URL(string: apps.appsURL) {
                    UIApplication.shared.open(url)
                }
                
            }label: {
                Text(apps.appsName)
            }
        }.padding([.top, .bottom], 8)
    }
    
}



struct AppOption_Previews: PreviewProvider {
    static var previews: some View {
        AppOption(apps: appsList[0])
    }
}
