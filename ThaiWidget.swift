//
//  ThaiWidget.swift
//  ThaiWidget
//
//  Created by E2318556 on 10/8/2564 BE.
//

import SwiftUI

struct ThaiWidget: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("1. จากหน้าจอโฮม ให้แตะวิดเจ็ตหรือพื้นที่ว่างค้างไว้จนกว่าแอพจะสั่น")
            
            HStack{
                Spacer()
                Image("widget4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            }
            
            Text("2. แตะปุ่ม '+' ปุ่มเพิ่มสีเทา ที่มุมซ้ายบน")
            
            Text("3. เลือกวิดเจ็ต แล้วเลือกจากขนาดวิดเจ็ตสามขนาด จากนั้นแตะเพิ่มวิดเจ็ต")
            
            HStack{
                Spacer()
                Image("widget1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            }

            Text("4. แตะเสร็จสิ้น")
                 
            HStack{
                Spacer()
                Image("widget3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            }

        }
    }
}

struct ThaiWidget_Previews: PreviewProvider {
    static var previews: some View {
        ThaiWidget()
    }
}
