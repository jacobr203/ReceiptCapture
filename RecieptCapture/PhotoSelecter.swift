//
//  PhotoSelecter.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/28/24.
//

import SwiftUI
import PhotosUI
import SQLite3

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
    @Binding var showPicker: Bool //switch back to bindings
    @Binding var selectedImages: [UIImage] //switch back to bindings
    
    var body: some View {
        Button(action: {
            selectedImages.removeAll()
            showPicker.toggle()
        }, label: {
            Text("Add Images from Album")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    Color.blue
                        .cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
        })
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

//#Preview {
//    ShowLibrary(showPicker: false, selectedImages: [
//        UIImage(systemName: "square.grid.3x1.folder.fill.badge.plus")!,
//        UIImage(systemName: "square.grid.3x1.folder.fill.badge.plus")!
//    ])
//}
//
