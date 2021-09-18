//
//  WidgetInfo.swift
//  WidgetInfo
//
//  Created by E2318556 on 10/8/2564 BE.
//

import SwiftUI

struct EnglishView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("1. From the Home Screen, hold onto an icon icon until the apps jiggle.")
            
            HStack{
                Spacer()
                Image("widget4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            }
            
            Text("2. Tap the '+' button in the upper-left corner.")
            
            Text("3. Scroll or search for Covid19TH.")
            
            HStack{
                Spacer()
                Image("widget1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            }

            Text("4. Select a widget, choose from three widget sizes, then tap Add Widget.")
            
            Text("5. Tap Done.")
                 
            HStack{
                Spacer()
                Image("widget3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            }

        }
    }
}

struct EngWidget_Previews: PreviewProvider {
    static var previews: some View {
        EnglishView()
    }
}
