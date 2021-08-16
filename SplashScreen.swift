//
//  SplashScreen.swift
//  SplashScreen
//
//  Created by E2318556 on 13/8/2564 BE.
//

import SwiftUI

struct SplashScreen<Content: View, Logo: View>: View {
    
    var content: Content
    var logoView: Logo
    
    var imageSize: CGSize
    
    init(imageSize: CGSize,@ViewBuilder content: @escaping () -> Content, @ViewBuilder logoView: @escaping () -> Logo){
        
        self.content = content()
        self.logoView = logoView()
        
        self.imageSize = imageSize
    }
    
    @State var imageAnimation = false
    @State var endAnimation = false

    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 0){
            
            
            ZStack{
                Color(red: 229/255, green: 56/255, blue: 59/255)
                    .background(Color(red: 229/255, green: 56/255, blue: 59/255))
                
                
                if !endAnimation{
                    
                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                    
                }
                
                HStack{
                    
                    
                    Spacer()
                    
                    if endAnimation{
                        
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(height: 0)
                    }
                    
                    
                }
                
            }
            .frame(height: endAnimation ? 0 : nil)
            .ignoresSafeArea()
            .zIndex(1)
            
            content
                .frame(height: endAnimation ? nil : 0)
                .zIndex(0)
        }
        .frame(maxHeight: .infinity, alignment: .top)

        .onAppear{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                withAnimation(.spring()){
                    

                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)){
                    
                    
                    endAnimation.toggle()
                }
            }
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
