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
    @State var isSidebarVisible = false
    var body: some View {
        NavigationView {
            ZStack {
                //backgroundLayer
                VStack{
                    DateView(/*isSidebarVisible: $isSidebarVisible*/)
                    HStack(/*spacing: 0*/){
                        //                        if isSidebarVisible {
                        //                            Sidebar(isSidebarVisible: $isSidebarVisible)
                        //                        }
                        CalenderView()
                    }
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
