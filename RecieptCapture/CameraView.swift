//
//  CameraView.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

import SwiftUI
import UIKit
import AVFoundation

struct CameraView: View {
    @State private var isShowingImagePicker = false
    @State var image: UIImage?
    @Binding var isShown: Bool
    @State private var isCameraAuthorized = false
    @State private var isLive = ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"]?.isEmpty
    
    
    var body: some View {
        
        VStack {
            if isCameraAuthorized {
                 if isLive == false, let image = UIImage(named: "testReceipt") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                else if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                    let imageName = "ReceiptCapture"+UUID().uuidString
                    if let imageURL = FileManager.default.saveImage(image, withName: imageName) {
                        Text("Image saved successfully at \(imageURL)")
                    }
                    
                } else {
                    Text("No Image Available")
                }
                
                Button("Take Picture") {
                    isShowingImagePicker = true
                }
                .padding()
                .sheet(isPresented: $isShowingImagePicker) {
                        ImagePicker(image: $image, isShown: $isShowingImagePicker)
                    
                }
            } else {
                Text("Camera access is required to use this feature.")
                
                Button("Allow Camera Access") {
                    requestCameraPermission()
                }
                .padding()
            }
        }
        .onAppear {
            checkCameraPermission()
        }
    }
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            isCameraAuthorized = true
        case .notDetermined:
            requestCameraPermission()
        default:
            isCameraAuthorized = false
        }
    }
    
    private func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                isCameraAuthorized = granted
            }
        }
    }


}
