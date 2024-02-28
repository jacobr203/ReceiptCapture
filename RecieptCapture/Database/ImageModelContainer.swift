//
//  ImageModelContainer.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/26/24.
//

import SwiftUI

class ImageModelContainer: ObservableObject {
    @Published var imageItems: [ImageData] = []
    @Published var isEmpty: Bool = true
    func fetchImageData() {
        // Load image data from files
        let imageNames = ["testReceipt", "image2", "image3"] // Assuming you have image files named image1, image2, image3...
        
        for name in imageNames {
            if let image = UIImage(named: name), let imageData = image.pngData() {

                let newItem = ImageData.init(rawId: UUID(), rawName: name, imageDataRaw: imageData)
                imageItems.append(newItem)
                isEmpty = false
            }
        }
    }
    func checkIsEmpty() {
        isEmpty = imageItems.count == 0
    }
}
