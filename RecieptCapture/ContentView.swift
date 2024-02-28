//
//  ContentView.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

import SwiftUI
import UIKit
import SwiftData

struct ReceiptCaptureApp: View {
    @State private var image: UIImage? = nil
    @State private var isShown: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                Text("Scan Image or Upload library")
                    .onAppear {
                        
                    }
                    .font(.headline)
                //.fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color.blue) //
                    .navigationTitle("Reciept Capture")
                    .cornerRadius(10) // Apply corner radius to create a button shape
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Overlay a rounded rectangle to add border
                            .stroke(Color.blue, lineWidth: 2) // Set border color and width
                    )
                NavigationLink(destination:  CameraView(image: $image, isShown: $isShown)) {
                    Text("Take Picture")
                }
                
                
                
            }
        }
    }
    
    func recognizeText(from image: UIImage) {
        // Use TesseractOCR to extract text from the image
        // ...
        // Update recognizedText state with extracted text
    }
    
    func categorizeReceipt(text: String) {
        // Use TensorFlow Lite model to categorize the receipt text
        // ...
        // Update categories state with predicted categories
    }
    
    
}

#Preview {
    ReceiptCaptureApp()
        .modelContainer(for: Item.self, inMemory: true)
}
