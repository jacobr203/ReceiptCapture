//
//  CameraView.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

//import SwiftUI
//import UIKit
//import AVFoundation
//
//struct CameraView: View {
//  @Binding var image: UIImage?
//  @State private var isShowingImagePicker = false
//
//  func takePicture() {
//    AVCaptureDevice.requestAccess(for: .video) { granted in
//      DispatchQueue.main.async {
//        if granted {
//          isShowingImagePicker = true
//        } else {
//          // Handle permission denied case
//          print("Camera permission denied")
//        }
//      }
//    }
//  }
//
//  var body: some View {
//    VStack {
//      if let image = image {
//        Image(uiImage: image)
//          .resizable()
//          .aspectRatio(contentMode: .fit)
//      } else {
//        Text("No image taken yet")
//      }
//      Button("Take Picture") {
//        takePicture()
//      }
//    }
//    .fullScreenCover(isPresented: $isShowingImagePicker) {
//      CustomImagePickerView(image: $image, isShowing: $isShowingImagePicker)
//    }
//  }
//}
//
//struct CustomImagePickerView: UIViewRepresentable {
//  @Binding var image: UIImage?
//  @Binding var isShowing: Bool
//
//  func makeUIView(context: Context) -> UIView {
//    let picker = UIImagePickerController()
//    picker.sourceType = .camera
//    picker.delegate = context.coordinator
//    return picker.view
//  }
//
//  func updateUIView(_ uiView: UIView, context: Context) { 
//    // Update picker here if needed
//  }
//
//  func makeCoordinator() -> Coordinator {
//    Coordinator(self)
//  }
//
//  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    let parent: CustomImagePickerView
//
//    init(_ parent: CustomImagePickerView) {
//      self.parent = parent
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//      guard let image = info[.originalImage] as? UIImage else { return }
//      parent.image = image
//      parent.isShowing = false
//      picker.dismiss(animated: true)
//    }
//  }
//}
import SwiftUI
import UIKit
import AVFoundation

struct CameraView: View {
    @State private var isShowingImagePicker = false
    @State private var image: UIImage? = nil
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
