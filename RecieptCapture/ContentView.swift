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
    @StateObject var RecModel =  ReceiptModel.init(db: openDatabase())
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    DateView()
                    HStack(){
                        CalenderView()
                        .environmentObject(RecModel)
                    }
                    PhotoCommandView()
                }
            }
        }
    }
}
#Preview {
    ContentView(RecModel: ReceiptModel(db: openDatabase()))
}
