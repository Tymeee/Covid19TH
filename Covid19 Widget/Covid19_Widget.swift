//
//  Covid19_Widget.swift
//  Covid19 Widget
//
//  Created by E2318556 on 29/7/2564 BE.
//

import WidgetKit
import SwiftUI

struct Model: TimelineEntry {
    var date : Date
    var covidData: CovidData
}



struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> Model {
        let loadingData = Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, active: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: ""))
        
        return loadingData
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Model) -> ()) {
        let entry = Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, active: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: "01/01/2021 12:00"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> Void) {
        
        getData{ (modelData) in
            
            let date = Date()
            let data = Model(date: date, covidData: modelData)
            
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 60, to: date)
            
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            
            completion(timeline)
        }
    }
}

//Fetch JSON API
func getData(completion: @escaping (CovidData)->()){
    
    let url = "https://static.easysunday.com/covid-19/getTodayCases.json"
    
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: URL(string: url)!){ (data, _,err) in
        
        if err != nil{
            NSLog("qqq: \(err!)")
            
            return
        }
        
        do{
            let jsonData = try JSONDecoder().decode(CovidData.self, from: data!)
            completion(jsonData)
            
        }catch{
            NSLog("qqq: \(err!)")
        }
        
    }.resume()
}




// Entry Views
struct Covid19_WidgetEntryView : View {
    let data: Model
    
    var body : some View {
        ConfirmedWidgetView(data: data)
    }
}

struct Covid19_Widget2EntryView : View{
    let data: Model
    
    var body: some View {
        RecoveredWidgetView(data: data)
    }
}

struct Covid19_Widget3EntryView : View{
    let data: Model
    
    var body: some View{
        DeathsWidgetView(data: data)
    }
}

struct Covid19_Widget4EntryView : View{
    let data: Model
    
    var body: some View{
        HospitalizedWidgetView(data: data)
    }
}

struct Covid19_Widget5EntryView : View{
    let data: Model
    
    var body: some View{
        MediumWidgetView(data: data)
    }
}


//Widget
struct Covid19_Widget: Widget {
    let kind: String = "Covid19_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()){ data in
            Covid19_WidgetEntryView(data: data)
        }
        .configurationDisplayName("Covid-19 Widget")
        .description("Daily confirmed cases")
        .supportedFamilies([.systemSmall])
    }
}

struct Covid19_Widget2: Widget {
    let kind: String = "Covid19_Widget2"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()){ data in
            Covid19_Widget2EntryView(data: data)
        }
        .configurationDisplayName("Covid-19 Widget")
        .description("Daily recovered cases")
        .supportedFamilies([.systemSmall])
    }
}

struct Covid19_Widget3: Widget {
    let kind: String = "Covid19_Widget3"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()){ data in
            Covid19_Widget3EntryView(data: data)
        }
        .configurationDisplayName("Covid-19 Widget")
        .description("Daily deaths cases")
        .supportedFamilies([.systemSmall])
    }
}

struct Covid19_Widget4: Widget {
    let kind: String = "Covid19_Widget4"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()){ data in
            Covid19_Widget4EntryView(data: data)
        }
        .configurationDisplayName("Covid-19 Widget")
        .description("Daily hospitalized cases")
        .supportedFamilies([.systemSmall])
    }
}

struct Covid19_Widget5: Widget {
    let kind: String = "Covid19_Widget5"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()){ data in
            Covid19_Widget5EntryView(data: data)
        }
        .configurationDisplayName("Covid-19 Widget")
        .description("All daily cases")
        .supportedFamilies([.systemMedium])
    }
}


