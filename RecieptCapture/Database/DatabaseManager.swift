//
//  DatabaseManager.swift
//  RecieptCapture
//
//  Created by jacob rego on 2/26/24.
//

import Foundation
import SwiftData

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    func createItemsTable() -> Bool {
        let query = "CREATE TABLE IF NOT EXISTS items (id INTEGER PRIMARY KEY, name TEXT, description TEXT);"
        return executeChange(query)
    }
    
    func insertItem(name: String, description: String) -> Bool {
        let query = "INSERT INTO items (name, description) VALUES (?, ?);"
        return executeChange(query, withArgs: [name, description])
    }
    
    func getAllItems() -> [[String: Any]] {
        let query = "SELECT * FROM items;"
        return executeQuery(query)
    }
}
