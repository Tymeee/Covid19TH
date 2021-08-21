import SwiftUI
struct CardView: View{
    
    private let cardHeight: CGFloat = 240
    private let imageHeight: CGFloat = 180
    private let cornerRadius: CGFloat = 20
    
    @Binding var resourceImage: String
    @Binding var resourceName: String
    @Binding var resourceDescription: String
    @Binding var borderColor: Color
    @Binding var URLsource: String
    
    var body: some View {


        Button(action:{
            UIApplication.shared.open(URL(string: URLsource)!)
        }, label:{
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(borderColor, lineWidth: 4)
                    .frame(height: cardHeight)
                    .background(Color.white)
                    .cornerRadius(cornerRadius)

                VStack(spacing: 5) {
                    Image(resourceImage)
                        .resizable()
                        .background(Color.gray)
                        .opacity(0.8)
                        .frame(height: imageHeight)
                        .cornerRadius(cornerRadius)
                        .clipped()
                    
                    LazyVStack(alignment: .leading, spacing: 3) {
                        Text(resourceName)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text(resourceDescription)
                            .font(.system(size: 12))
                            .padding(.bottom, 15)
                            .foregroundColor(.black)
                    }.padding([.leading, .trailing])
                }.frame(height: cardHeight)
            }

        })
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(resourceImage: Binding.constant("thai.care"), resourceName: Binding.constant("Name"), resourceDescription: Binding.constant("Description"), borderColor:Binding.constant(Color.gray), URLsource: Binding.constant("jitasa.care"))
            
            
    }
}
