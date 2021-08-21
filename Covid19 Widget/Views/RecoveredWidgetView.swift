//
//  RecoveredWidgetView.swift
//  RecoveredWidgetView
//
//  Created by E2318556 on 3/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct RecoveredWidgetView: View{
    let data: Model
    
    var body: some View{
        if #available(iOS 15.0, *) {
            VStack(spacing: 0){
                Text("\(data.covidData.UpdateDate)")
                    .frame(height: 30)
                    .font(.system(size: 10))
                
                Rectangle()
                    .foregroundColor(Color(red: 0/255, green: 127/255, blue: 95/255))
                    .overlay{
                        VStack(spacing: -1){
                            Text("หายป่วย")
                            Text("\(data.covidData.NewRecovered)")
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                            
                        }.foregroundColor(Color.white)
                            .font(.system(size: 15))
                    }
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}

struct Covid19_Widget2_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Covid19_Widget2EntryView(data: Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, active: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: "")))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}

