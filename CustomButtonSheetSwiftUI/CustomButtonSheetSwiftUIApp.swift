//
//  CustomButtonSheetSwiftUIApp.swift
//  CustomButtonSheetSwiftUI
//
//  Created by sss on 13.04.2023.
//

import SwiftUI

@main
struct CustomButtonSheetSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView {
                VStack {
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 80, height: 3)
                        .padding(.top)
                    
                    ForEach(0..<1) {_ in
                        RoundedRectangle(cornerRadius: 20 )
                            .fill(Color("action"))
                            .frame(height: 400)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
        }
    }
}
