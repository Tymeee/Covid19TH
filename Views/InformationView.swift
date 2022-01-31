//
//  InformationView.swift
//  InformationView
//
//  Created by E2318556 on 5/8/2564 BE.
//

import SwiftUI
import AVKit

struct InformationView: View {
    
    @State private var resourceImages: [String] =
    ["jitasa.care",
     "thai.care",
     "wheretotestcovid19",
     "koncovid.com"]
    
    @State private var resourceNames: [String] =
    ["Jitasa.care",
     "Thai.care",
     "เราช่วยกัน",
     "Koncovid.com"]
    
    @State private var resourceDescriptions: [String] =
    ["แพลตฟอร์มแผนที่เพื่อสนับสนุนข้อมูลและการให้ความช่วยเหลือในสถานการณ์โควิด-19.",
     "เราจะช่วยกันดูแล จนกว่าคุณจะถึงมือหมอ",
     "ค้นหาและเแลกเปลี่ยน ข้อมูลจุดตรวจโควิด-19 ด้วยพลังจากทุกคน",
     "สถานที่ตรวจโควิดในประเทศไทย"]
    
    @State private var borderColors: [Color] =
    [Color(red: 229/255, green: 56/255, blue: 59/255),
     Color(red: 0/255, green: 127/255, blue: 95/255),
     Color(red: 256/255, green: 172/255, blue: 60/255),
     Color(red: 52/255, green: 58/255, blue: 64/255)]
    
    @State private var URLsources: [String] =
    ["https://www.jitasa.care/",
     "https://www.thai.care/",
     "https://wheretotestcovid19.com/",
     "https://koncovid.com/"]
    
    @State private var isThai:Bool = true
    
    var body: some View {
        NavigationView{
            
            List(){
                Section(header: Text("Add Widgets - วิดเจ็ต")){
                    VStack(alignment: .leading, spacing: 20){
                        ThaiView()
                    }.padding(.top, 5)
                }
            }.navigationTitle("Information")
                .listStyle(SidebarListStyle())
                
            
        }
    }
    
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
        
        
        
    }
}



