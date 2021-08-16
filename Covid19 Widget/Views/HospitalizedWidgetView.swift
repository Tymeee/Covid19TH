//
//  HospitalizedWidgetView.swift
//  HospitalizedWidgetView
//
//  Created by E2318556 on 3/8/2564 BE.
//

import SwiftUI
import WidgetKit

//
//  DeathsWidgetView.swift
//  DeathsWidgetView
//
//  Created by E2318556 on 3/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct HospitalizedWidgetView: View{
    let data: Model
    
    var body: some View{
        if #available(iOS 15.0, *) {
            VStack(spacing: 0){
                Text("\(data.covidData.UpdateDate)")
                    .frame(height: 30)
                    .font(.system(size: 10))
                
                Rectangle()
                    .foregroundColor(Color(red: 256/255, green: 172/255, blue: 60/255))
                    .overlay{
                        VStack(alignment: .center, spacing: 2){
                            Text("รักษาอยู่")
                                
                            Text("\(data.covidData.NewHospitalized)")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            
                        }.foregroundColor(Color.white)
                            .font(.system(size: 15))
                    }
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}


struct Covid19_Widget4_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Covid19_Widget4EntryView(data: Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, active: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: "")))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}


