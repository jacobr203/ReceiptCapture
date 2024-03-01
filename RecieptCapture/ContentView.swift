//
//  ContentView.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

import SwiftUI
import UIKit

struct ReceiptCaptureApp: View {
    @State var isShown: Bool = false
    @StateObject var imageViewModel = ImageViewModel()
    @State var showPicker: Bool = false
    @State var selectedImages: [UIImage] = []
    
    var body: some View {
        NavigationView {
            VStack { //this is the Image Library from Photos
                ShowLibrary(showPicker: $showPicker, selectedImages: $selectedImages)
                    .onDisappear{
                        saveCleanExit()
                        //this is where you add the files to the directory and assign hash
                    }
                //This is the image library saved onto the app
                List(imageViewModel.images) { imageData in
                    Image(uiImage: FileManager.default.loadImage(fromURL: imageData.imageURL)!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    //Text(imageData.name)
                }
                .onAppear {
                    if let imageURLs = try? FileManager.default.contentsOfDirectory(at: FileManager.documentsDirectory, includingPropertiesForKeys: nil) {
                        for imageURL in imageURLs {
                            let imageName = imageURL.lastPathComponent
                            let imageData = ImageData(name: imageName, imageURL: imageURL, hash: "123")
                            imageViewModel.images.append(imageData)
                        }
                    }}
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
                NavigationLink(destination:  CameraView(isShown: $isShown)) {
                    Text("Take Picture")
                }
            }
        }
    }
    private func saveCleanExit() {
        if selectedImages.count > 0 {
            for image in selectedImages {
                let imageName = "ReceiptCapture." + UUID().uuidString
                FileManager.default.saveImage(image, withName: imageName)
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



#Preview {
    
    ReceiptCaptureApp()
        .modelContainer(for: Item.self, inMemory: true)
}
