import SwiftUI
import WebKit

struct MapView: View {
    
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
    
    var body: some View {
        NavigationView{
            VStack{
                Webview(url: "https://www.koncovid.com/")
                    .cornerRadius(20)
                    .padding([.leading, .trailing])
            }
            .navigationTitle("Map📍")
            
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        HStack(spacing: -8){
                            Text("แผนที่จาก:")
                            
                            Link(destination: URL(string: "https://koncovid.com/")!, label:{ Text(" koncovid.com")})
                                .foregroundColor(Color.red)
                            
                            Text("   (non-affiliate)")
                            
                        }.font(.caption)
                    }
                }
        }
    }
}

struct Webview: UIViewRepresentable {
    
    var url: String

    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else{
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<Webview>) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View{
        MapView()
    }
}


