//
//  ContentView.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
//@State var clrBackgroundColor = Color.white
    
    var body: some View {
        NavigationView {
            ZStack {
               //backgroundLayer
                VStack{
                    DateView()
                    CalenderView()
                    PhotoCommandView()
                }
            }
        }
    }
//    var backgroundLayer: some View {
//        clrBackgroundColor
//            .edgesIgnoringSafeArea(.all)
//    }
}
#Preview {
    ContentView()
}
