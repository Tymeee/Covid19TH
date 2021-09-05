//
//  ContentView.swift
//  Shared
//
//  Created by E2318556 on 5/9/2564 BE.
//

import SwiftUI


struct ProvinceView: View {
    @StateObject var viewModel = ViewModel()
    @State var searchText = ""
    
    var body: some View {
        
            VStack{
    
                ScrollView{
                    ForEach((viewModel.courses), id: \.self) { course in
                        HStack{
                            Text((course.province))
                                .scaleEffect(1.05)
                            Spacer()
                            
                            Text("\(course.new_case)")
                                .fontWeight(.semibold)
                                .padding(.trailing, 20)
                                .scaleEffect(1.2)

    
                            
                        }
                        
                        Divider()
                            
                        
                        
                    }
                }.frame(height: 500)
                
                
            }
            .onAppear{
                viewModel.fetch()
            }
        
    }
}

struct Course: Hashable, Codable{
    var province: String
    var new_case: Int
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

struct ProvinceView_Previews: PreviewProvider {
    static var previews: some View {
        ProvinceView()
    }
}
