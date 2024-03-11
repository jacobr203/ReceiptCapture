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
    let hash: String?
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
    
    //TODO add crieria to check for sha256 has when adding photos. If exists, photo exists.
    func saveImage(_ image: UIImage, withName name: String, imgCategory imageCategory: String) {
        if let imageURL = FileManager.default.saveImage(image, withName: name) {
            let hash = image.sha256Hash()
            let imageData = ImageData(name: name, imageURL: imageURL, hash: hash)
            images.append(imageData)
        }
    }
}
