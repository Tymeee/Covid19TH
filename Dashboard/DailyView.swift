//
//  DailyCasesView.swift
//  DailyCasesView
//
//  Created by E2318556 on 10/8/2564 BE.
//

import SwiftUI

struct CovidData2: Decodable {
    var Confirmed: Int
    var Recovered: Int
    var Hospitalized: Int
    var Deaths: Int
    var active: Int
    var NewConfirmed: Int
    var NewRecovered: Int
    var NewDeaths: Int
    var NewHospitalized: Int
    var UpdateDate: String
}

struct DailyView: View {
    
    @State var covidData2: CovidData2?
    
    var body: some View {
        
        if #available(iOS 15.0, *) {
            
            
            VStack(){
                
                // New cases
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(red: 229/255, green: 56/255, blue: 59/255))
                    .frame(height: 270)
                    .padding(.bottom, 3)
                
                    .overlay(
                        VStack(spacing: 5){
                            HStack(spacing: -5){
                                Text("ติดเชื้อ ")
                                Image("virus")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .aspectRatio(contentMode: .fit)
                            }.frame(height: 30)
                            
                            
                            Text("\(covidData2?.NewConfirmed ?? 0)")
                                .DailyStatsStyle()
                            
                            Text("\(covidData2?.Confirmed ?? 0)")
                                .TotalStatsStyle()
                        }
                        
                    )
                
                //New recovered
                //New hospitalized
                HStack(spacing: 10){
                    // New recovered
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(red: 0/255, green: 127/255, blue: 95/255))
                        .overlay(
                            VStack(spacing: 5){
                                Text("หายป่วย ") + Text(Image(systemName: "cross.fill"))
                                
                                Text("\(covidData2?.NewRecovered ?? 0)")
                                    .DailyStatsStyle()
                                
                                Text("\(covidData2?.Recovered ?? 0)")
                                    .TotalStatsStyle()
                            })
                    
                    // Hospitalized
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(red: 256/255, green: 172/255, blue: 60/255))
                        .overlay(
                            VStack(spacing: 5){
                                Text("รักษาอยู่ ") + (Text(Image(systemName: "cross.case.fill")))
                                
                                Text("\(covidData2?.NewHospitalized ?? 0)")
                                    .DailyStatsStyle()
                                
                                Text("\(covidData2?.Hospitalized ?? 0)")
                                    .TotalStatsStyle()
                            }
                        )
                }.frame(height: 210)
                    .padding(.bottom, 3)
                
                
                //Deaths
                HStack(spacing: 10){
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(red: 52/255, green: 58/255, blue: 64/255))
                        .overlay(
                            VStack(spacing: 5){
                                HStack(spacing: 2){
                                    Text("เสียชีวิต")
                                    
                                    Image("deathicon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }.frame(height: 25)
                                
                                Text("\(covidData2?.NewDeaths ?? 0)")
                                    .DailyStatsStyle()
                                
                                Text("\(covidData2?.Deaths ?? 0)")
                                    .TotalStatsStyle()
                            })
                }.frame(height: 150)
                
                
                Link(destination: URL(string: "https://easysunday.com/labs-covid-19/?fbclid=IwAR0EyTiFP18210i3DCSPQZVE7-ucLzhScrIAM3OXyKX2OTfmWToj-5jqBbw")!, label: {Text("ข้อมูลจาก: Sunday Thailand")
                        .foregroundColor(Color("AccentColor"))
                        .font(.caption)
                })
                
            }.onAppear (perform: loadData2)
                .listStyle(GroupedListStyle())
                .listRowInsets(EdgeInsets())
                .foregroundColor(Color.white)
            
            
        } else {
            // Fallback on earlier versions
        }
        
    }
    public func loadData2() {
        guard let url = URL(string: "https://static.easysunday.com/covid-19/getTodayCases.json") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(CovidData2.self, from: data){
                DispatchQueue.main.async {
                    self.covidData2 = decodedData
                }
            }
        }.resume()
    }
    
    
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
