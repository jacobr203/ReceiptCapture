//
//  ImageCaptured.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/26/24.
//

import Foundation
import SwiftData

@Model
class ImageCaptured {
    @Attribute(.unique) var name: String
    var age: Int
    
    required init() {} //build out init
    
}

// Create a predicate to find users older than 25
let context = try! ModelContext { context in
    let predicate = #Predicate<ImageCaptured> { ImageCaptured in
        ImageCaptured.age > 25
    }
    
    // Fetch users using the predicate
    context.fetch(ImageCaptured.self, predicate: predicate) { (result: Result<[ImageCaptured], Error>) in  switch result {
    case .success(let users):
        print("Fetched users:", users)
    case .failure(let error):
        print("Error fetching users:", error)
    }
    }
}
