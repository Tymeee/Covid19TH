//
//  MediumWidgetView.swift
//  MediumWidgetView
//
//  Created by E2318556 on 3/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View{
    let data: Model
    
    
    var body: some View{
        if #available(iOS 15.0, *) {
            VStack(spacing: 0){
                
                Text("\(data.covidData.UpdateDate)")
                    .font(.system(size: 10))
                    .frame(height: 30)
                
                VStack(spacing: 0){
                    HStack(spacing:0){
                        
                        //Confirmed
                        Rectangle()
                            .foregroundColor(Color(red: 229/255, green: 56/255, blue: 59/255))
                            .overlay{
                                VStack(spacing: -4){
                                    Image("virus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 20)

                                    
                                    Text("\(data.covidData.NewConfirmed)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 18))
                                }
                            }
                        
                        //Recovered
                        Rectangle()
                            .foregroundColor(Color(red: 0/255, green: 127/255, blue: 95/255))
                            .overlay{
                                VStack{
                                    Image(systemName: "cross.fill");                               Text("\(data.covidData.NewRecovered)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 18))
                                }
                            }
                    }
                    //Hospitalized
                    HStack(spacing: 0){
                        Rectangle()
                            .foregroundColor(Color(red: 256/255, green: 172/255, blue: 60/255))
                            .overlay{
                                VStack{
                                    Image(systemName: "cross.case.fill");                                    Text("\(data.covidData.NewHospitalized)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 18))
                                }
                            }
                        
                        //Death
                        Rectangle()
                            .foregroundColor(Color(red: 52/255, green: 58/255, blue: 64/255))
                            .overlay{
                                VStack(spacing: -2){
                                    Image("deathicon")
                                        .resizable()
                                        .frame(width: 13, height: 18)
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("\(data.covidData.NewDeaths)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 18))
                                }
                            }
                    }
                }.foregroundColor(Color.white)
                    .font(.system(size: 13))
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}

struct Covid19_Widget5_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Covid19_Widget5EntryView(data: Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, active: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: "")))
                .previewDevice("iPhone 12 Pro")
                .previewContext(WidgetPreviewContext(family: .systemMedium))
.previewInterfaceOrientation(.portrait)
            
            
        }
    }
}

