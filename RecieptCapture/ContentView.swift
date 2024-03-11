//
//  ContentView.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

import SwiftUI
import UIKit

struct ReceiptCaptureApp: View {
    @State var clrBackgroundColor = Color.gray
    
    var body: some View {
        ZStack {
            backgroundLayer
            VStack{
                DateView()
                CalenderView()
                PhotoCommandView()
            }
        }
    }
    
    var backgroundLayer: some View {
        clrBackgroundColor
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    
    ReceiptCaptureApp()
        
}
