//
//  UIImageExtend.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/29/24.
//
import UIKit
import CryptoKit

extension UIImage {
    func sha256Hash() -> String? {
        guard let imageData = self.pngData() else {
            return nil // Unable to get the image data
        }
        
        let hashedData = SHA256.hash(data: imageData)
        let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
}

// Example usage:
//if let image = UIImage(named: "exampleImage") {
//    if let hash = image.sha256Hash() {
//        print("SHA-256 hash of the image: \(hash)")
//    } else {
//        print("Failed to generate hash for the image.")
//    }
//} else {
//    print("Image not found.")
//}
