//
//  ContentView.swift
//  Shared
//
//  Created by E2318556 on 5/9/2564 BE.
//

import SwiftUI


struct ProvinceView: View {
    @StateObject var viewModel = ViewModel()
    
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


struct ProvinceView_Previews: PreviewProvider {
    static var previews: some View {
        ProvinceView()
    }
}
