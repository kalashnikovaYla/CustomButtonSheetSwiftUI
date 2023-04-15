//
//  ContentView.swift
//  CustomButtonSheetSwiftUI
//
//  Created by sss on 13.04.2023.
//

import SwiftUI

struct ContentView <Content: View>: View {
    
    let content: () -> Content
    
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transition in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { value in
                
                let maxHeight = UIScreen.main.bounds.height - 100
                
                
                withAnimation {
                    if -currentMenuOffsetY > maxHeight {
                        currentMenuOffsetY = -maxHeight
                    } else {
                        currentMenuOffsetY = 0 
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    
    func onChangeMenuOffset() {
        DispatchQueue.main.async {
            self.currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
        }
        
    }
    
    var body: some View {
        
        ZStack{
            Color("background")
            
            content()
            
            .frame(height: UIScreen.main.bounds.height + 100)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("alert")))
            .ignoresSafeArea(.all, edges: .bottom)
            .offset(y: UIScreen.main.bounds.height)
            .offset(y: currentMenuOffsetY)
            .gesture(dragGesture)
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView {
            VStack {
                
                Capsule()
                    .fill(.white)
                    .frame(width: 80, height: 3)
                    .padding(.top)
                
                ForEach(0..<4) {_ in
                    RoundedRectangle(cornerRadius: 20 )
                        .fill(Color("action"))
                        .frame(height: 100)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}
