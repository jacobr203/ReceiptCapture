//
//  PhotoSelecter.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/28/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: UIViewControllerRepresentable {
    @Binding var showPicker: Bool
    @Binding var selectedImages: [UIImage]
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images // Limit to images
        configuration.selectionLimit = 0 // Allow multiple selection
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(showPicker: $showPicker, selectedImages: $selectedImages)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        @Binding var showPicker: Bool
        @Binding var selectedImages: [UIImage]
        
        init(showPicker: Binding<Bool>, selectedImages: Binding<[UIImage]>) {
            _showPicker = showPicker
            _selectedImages = selectedImages
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self.selectedImages.append(image)
                        }
                    } else {
                        print("Failed to load image:", error ?? "Unknown error")
                    }
                }
            }
            showPicker = false
        }
    }
}

struct ShowLibrary: View {
    @Binding var showPicker: Bool
    @Binding var selectedImages: [UIImage]
    var body: some View {
        Button("Select Photos") {
            showPicker.toggle()
        }
        .sheet(isPresented: $showPicker) {
            PhotoPickerView(showPicker: $showPicker, selectedImages: $selectedImages)
        }
        
        if !selectedImages.isEmpty {
            Text("Selected Photos:")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
    }
}
