//
//  ImageData.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/26/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model

final class ImageData {
  @Attribute(.unique)
  var id = UUID()
  var name: String
  var imageData: Data


    init(rawId: UUID, rawName: String, imageDataRaw: Data) {
        self.id = rawId
        self.name = rawName
        self.imageData = imageDataRaw
    }

    

    


    
  // Additional image data properties if needed
}
