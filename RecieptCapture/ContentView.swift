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
    var strMenuIconName = "line.3.horizontal"
    var strRightArrow = "arrow.right"
    var strLeftArrow = "arrow.left"
    var strManualReciept = "doc.fill.badge.ellipsis"
    
    var body: some View {
        ZStack {
            backgroundLayer
            VStack{
                dateView
                Spacer()
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var backgroundLayer: some View {
        clrBackgroundColor
        .edgesIgnoringSafeArea(.all)
    }
    var dateView: some View {
        HStack {
            Button(action: {
                // Button action code to open model
            }) {
                Image(systemName: strMenuIconName)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .padding(.leading, 30)
                    .font(.system(size: 20))
            }
           Spacer()
            Button(action: {
                // Button action code to open model
            }) {
                Image(systemName: strLeftArrow)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .font(.system(size: 20))
            }
            Spacer()
            Button(action: {
                // Button action code to open model
            }) {
                Image(systemName: strRightArrow)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .font(.system(size: 20))
            }
            Spacer()
            Button(action: {
                // Button action code to open model
            }) {
                Image(systemName: strManualReciept)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .padding(.trailing, 30)
                    .font(.system(size: 20))
            }

        }
        .frame(width: 400, height: 50)
        
    }
    
    
    
}


#Preview {
    
    ReceiptCaptureApp()
        
}
