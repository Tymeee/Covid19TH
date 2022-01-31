//
//  JSON.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import Foundation
import SwiftUI

//Dashboard
struct CovidData: Decodable {
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


//Province
struct Course: Hashable, Codable{
    var province: String
    var new_case: Int
    var new_death: Int
}

class ViewModel: ObservableObject{
    @Published var courses: [Course] = []
    
    func fetch() {
        guard let url = URL(string: "https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            //Convert to JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

