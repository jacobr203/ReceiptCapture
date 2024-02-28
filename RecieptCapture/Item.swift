//
//  Item.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/25/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
