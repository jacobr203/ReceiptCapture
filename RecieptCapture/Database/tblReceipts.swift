//
//  tblReceipts
//  TestEnv
//
//  Created by jacob rego on 3/2/24.
//  tblReceipts Statements

import SQLite3
// SELECT STATEMENTS
func selectFromtblReceipts(db: OpaquePointer?, queryString: String) -> [Receipt] {
    
    var selectString: String
    var returnReceipts: [Receipt] = []
    selectString = queryString
    if queryString.isEmpty {
        selectString = "SELECT * FROM tblReceipts;"
    }
    
    var queryStatement: OpaquePointer? = nil
    
    guard let db = openDatabase() else {
        return []
    }
    createTableReceipts(db: db)
    
    if sqlite3_prepare_v2(db, selectString, -1, &queryStatement, nil) == SQLITE_OK {
        //needs to account for other values
        while sqlite3_step(queryStatement) == SQLITE_ROW {
            var strRetUUID: String = ""
            var intRetBusiness: Int32 = 0
            var strRetVendor: String = ""
            var strRetPurchaseDate: String = ""
            var strRetCategory: String = ""
            var strRetTotal: String = ""
            
            //select binding start
            if let retUUID = sqlite3_column_text(queryStatement, 1) {
                 strRetUUID = String(cString: retUUID)
            } else {
                strRetUUID = "NoUUID"
            }
            intRetBusiness = sqlite3_column_int(queryStatement, 2)
            if let retVendor = sqlite3_column_text(queryStatement, 3) {
                strRetVendor = String(cString: retVendor)
            } else {
                strRetVendor = "None"
            }
            if let retPurchaseDate = sqlite3_column_text(queryStatement, 4) {
                strRetPurchaseDate = String(cString: retPurchaseDate)
            } else {
                strRetPurchaseDate = "None"
            }
            if let retCategory = sqlite3_column_text(queryStatement, 5) {
                strRetCategory = String(cString: retCategory)
            } else {
                strRetCategory = "None"
            }
            if let retTotal = sqlite3_column_text(queryStatement, 6) {
                strRetTotal = String(cString: retTotal)
            } else {
                strRetTotal = ""
            }
            //select binding end
            
            let newReceipt = Receipt(strUUID: strRetUUID, intBusiness: intRetBusiness, strVendor: strRetVendor, strPurchaseDate: strRetPurchaseDate, strCategory: strRetCategory, strTotal: strRetTotal)
            returnReceipts.append(newReceipt)
        }
    } else {
        return returnReceipts
    }
    
    sqlite3_finalize(queryStatement)
    sqlite3_close(db)
    return returnReceipts
}

// INSERT STATEMENTS
func insertIntotblReceipts(db: OpaquePointer?, strUUID: String, intBusiness: Int32, strVendor: String, strPurchaseDate: String, strCategory: String, strTotal: String) {
    let insertStatement = "INSERT INTO tblReceipts (strUUID, intBusiness, strVendor, strPurchaseDate, strCategory, strTotal) VALUES (?, ?, ?, ?, ?, ?);"
    var statement: OpaquePointer?
    guard let db = openDatabase() else {
        return
    }
    createTableReceipts(db: db)
    if sqlite3_prepare_v2(db, insertStatement, -1, &statement, nil) == SQLITE_OK {
        //Start bindings
        sqlite3_bind_text(statement, 1, strUUID, -1, nil)
        sqlite3_bind_int(statement, 2, intBusiness)
        sqlite3_bind_text(statement, 3, strVendor, -1, nil)
        sqlite3_bind_text(statement, 4, strPurchaseDate, -1, nil)
        sqlite3_bind_text(statement, 5, strCategory, -1, nil)
        sqlite3_bind_text(statement, 6, strTotal, -1, nil)
        //END bindings
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Successfully inserted row.")
        } else {
            print("Could not insert row.")
        }
    } else {
        print("INSERT statement could not be prepared.")
    }
    sqlite3_finalize(statement)
    sqlite3_close(db)
}

// UPDATE STATEMENTS TODO
func updatetblReceipts(db: OpaquePointer?, id: Int, newName: String, newAge: Int) {
    let updateStatement = "UPDATE tblReceipts SET id = ? WHERE newName = ? AND age = ?;"
    var statement: OpaquePointer?
    if sqlite3_prepare_v2(db, updateStatement, -1, &statement, nil) == SQLITE_OK {
        sqlite3_bind_int(statement
                         , 1, Int32(id))
        sqlite3_bind_text(statement, 2, newName, -1, nil)
        sqlite3_bind_int(statement, 3, Int32(newAge))
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Successfully updated row.")
        } else {
            print("Could not update row.")
        }
    } else {
        print("UPDATE statement could not be prepared.")
    }
    
    sqlite3_finalize(statement)
}

// DELETE STATEMENTS
//func deleteFromtblReceipts(db: OpaquePointer?, id: Int) {
//    let deleteQuery = "DELETE FROM tblReceipts WHERE Id = ?;"
//    var deleteStatement: OpaquePointer? = nil
//    
//    createTablePhotos(db: db)
//    if sqlite3_prepare_v2(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
//        sqlite3_bind_int(deleteStatement, 1, Int32(id))
//        
//        if sqlite3_step(deleteStatement) == SQLITE_DONE {
//            print("Deleted row from tblReceipts.")
//        } else {
//            print("Could not delete row from tblReceipts.")
//        }
//    } else {
//        print("DELETE statement could not be prepared.")
//    }
//    
//    sqlite3_finalize(deleteStatement)
//}
//
//// GENERAL STATEMENTS

class person {
    let id: Int32
    let name: String
    let age: Int32
    init(id: Int32?, name: String?, age: Int32?) {
        if let intValue = id {
            self.id = intValue
        } else {
            self.id = -1
        }
        if let stringValue = name {
            self.name = stringValue
        } else {
            self.name = ""
        }
        if let intValue = age {
            self.age = intValue
        } else {
            self.age = -1
        }
    }
    
}


