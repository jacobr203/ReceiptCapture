//
//  FileManager.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/28/24.
//
import SwiftUI

struct ImageData: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: URL
    var imageCategory: String
}

// FileManager extension to handle file operations
extension FileManager {
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveImage(_ image: UIImage, withName name: String) -> URL? {
        let fileURL = Self.documentsDirectory.appendingPathComponent(name)
        guard let imageData = image.jpegData(compressionQuality: 1.0) else { return nil }
        do {
            try imageData.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving image: \(error.localizedDescription)")
            return nil
        }
    }
    
    func loadImage(fromURL url: URL) -> UIImage? {
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: imageData)
    }
}

// ViewModel to manage image data
class ImageViewModel: ObservableObject {
    @Published var images: [ImageData] = []
    
    func saveImage(_ image: UIImage, withName name: String, imgCategory imageCategory: String) {
        if let imageURL = FileManager.default.saveImage(image, withName: name) {
            let imageData = ImageData(name: name, imageURL: imageURL, imageCategory: imageCategory)
            images.append(imageData)
        }
    }
}
//
//// Example usage
//struct ContentView: View {
//    @StateObject var imageViewModel = ImageViewModel()
//    
//    var body: some View {
//        VStack {
//            Text("Images")
//            List(imageViewModel.images) { imageData in
//                Image(uiImage: FileManager.default.loadImage(fromURL: imageData.imageURL)!)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                Text(imageData.name)
//            }
//            .onAppear {
//                // Load existing images
//                // You might want to implement this according to your app's logic
//            }
//        }
//    }
//}
