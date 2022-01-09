//
//  PhoneView.swift
//  PhoneView
//
//  Created by E2318556 on 10/8/2564 BE.
//

import SwiftUI

struct PhoneBox: View {
    
    
    var body: some View {
        ForEach(Array(zip(phoneCalls, govAgencies)), id: \.0) { item in
                Link(destination: URL(string: "tel:\(item.0)")!, label: {
                    HStack{
                        Text("\(item.0)")
                            .font(.system(size: 23))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.red)
                        
                        Text("- \(item.1)")
                            .font(.system(size: 18))
                            .foregroundColor(Color("AccentColor"))
                        
                        Image(systemName: "phone.circle.fill")
                            .foregroundColor(Color(red: 0/255, green: 127/255, blue: 95/255))
                    }
                })
            .padding([.top, .bottom],8)
        }
    }
}

struct PhoneBox_Previews: PreviewProvider {
    static var previews: some View {
        PhoneBox()
            
    }
}
