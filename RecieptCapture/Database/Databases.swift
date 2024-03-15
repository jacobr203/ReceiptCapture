//
//  DataBase.swift
//  TestEnv
//
//  Created by jacob rego on 3/2/24.
//
import SQLite3
import Foundation
//Database for the application
func openDatabase() -> OpaquePointer? {
    var db: OpaquePointer? = nil
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Database.sqlite")
    
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        print("error opening database")
        return nil
    }
    
    return db
}

func createTableReceipts(db: OpaquePointer?) {
    let createTableString = "CREATE TABLE IF NOT EXISTS tblReceipts(strUUId TEXT PRIMARY KEY,intBusiness INTEGER, strVendor TEXT,strPurchaseDate TEXT, strCategory TEXT, strTotal TEXT);"
    var createTableStatement: OpaquePointer? = nil
    
    if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
        if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("Test table created.")
        } else {
            print("Test table could not be created.")
        }
    } else {
        print("CREATE TABLE statement could not be prepared.")
    }
    sqlite3_finalize(createTableStatement)
}


		
