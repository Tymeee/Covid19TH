//
//  ConfirmedWidgetView.swift
//  ConfirmedWidgetView
//
//  Created by E2318556 on 3/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct ConfirmedWidgetView: View{
    let data: Model
    
    var body: some View{
        if #available(iOS 15.0, *) {
            VStack(spacing: 0){
                Text("\(data.covidData.UpdateDate)")
                    .frame(height: 30)
                    .font(.system(size: 10))
                
                Rectangle()
                    .foregroundColor(Color(red: 229/255, green: 56/255, blue: 59/255))
                    .overlay{
                        VStack(spacing: -1){
                            Text("ติดเชื้อ")
                            
                            Text("\(data.covidData.NewConfirmed)")
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                
                            
                            
                            
                        }.font(.system(size: 15))
                            .foregroundColor(Color.white)
                    }
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}

struct Covid19_Widget_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Covid19_WidgetEntryView(data: Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, active: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: "")))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            
        }
    }
}
