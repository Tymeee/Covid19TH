//
//  VaccineView.swift
//  CovidApp2
//
//  Created by 18556 on 7/9/21.
//

import SwiftUI

struct InfoView: View {
    
    @State private var vaccineIcons: [String] = ["mrnaicon", "viralicon", "inactivatedicon", "proteinicon"]
    
    @State private var vaccineDescriptions: [String] =
    ["mRNA - วัคซีนชนิดสารพันธุกรรม",
     "Viral vector - วัคซีนชนิดใช้ไวรัสเป็นพาหะ",
     "Inactivated vaccine - วัคซีนชนิดเชื้อตาย",
     "Protein based - วัคซีนที่ทําจากโปรตีนส่วนหนึ่งของเชื้อ"]
    
    @State private var mrnaSwitch = false
    @State private var astraSwitch = false
    @State private var sinoSwitch = false
    @State private var novaSwitch = false
    
    
    
    
    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical){
                VStack{
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        VaccineScrollView()
                    }
                    
                    //mRNA
                    Button(action: {
                        self.mrnaSwitch.toggle()
                    }) {
                        RowStackView(vaccineIcon: $vaccineIcons[0], vaccineDescription: $vaccineDescriptions[0])
                    }.sheet(isPresented: $mrnaSwitch) {
                        MRNAView()
                    }
                    
                    
                    //Viral vector
                    Button(action: {
                        self.astraSwitch.toggle()
                    }) {
                        RowStackView(vaccineIcon: $vaccineIcons[1], vaccineDescription: $vaccineDescriptions[1])
                    }.sheet(isPresented: $astraSwitch) {
                        AstraView()
                    }
                    
                    
                    //Inactivated vaccine
                    Button(action: {
                        self.sinoSwitch.toggle()
                    }) {
                        RowStackView(vaccineIcon: $vaccineIcons[2], vaccineDescription: $vaccineDescriptions[2])
                    }.sheet(isPresented: $sinoSwitch) {
                        SinoView()
                    }
                    
                    
                    //Protein based
                    Button(action: {
                        self.novaSwitch.toggle()
                    }) {
                        RowStackView(vaccineIcon: $vaccineIcons[3], vaccineDescription: $vaccineDescriptions[3])
                    }.sheet(isPresented: $novaSwitch) {
                        NovaView()
                    }
                    
                    
                }.navigationBarTitle("Information")
            }
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


