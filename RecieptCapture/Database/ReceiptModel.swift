//
//  Receipt.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/15/24.
//

import Foundation
import SQLite3

struct Receipt {
    var strUUID: String
    var intBusiness: Int32
    var strVendor: String
    var strPurchaseDate: String
    var strCategory: String
    var strTotal: String
    
    init(strUUID: String?, intBusiness: Int32, strVendor: String?, strPurchaseDate: String?, strCategory: String?, strTotal: String) {
        
        //UUID
        if let setUUID: String = strUUID {
            self.strUUID = setUUID
        } else {
            self.strUUID = UUID().uuidString
        }
        //Business boolean
        if intBusiness != 1,intBusiness != 0 {
            self.intBusiness = 0
        } else {
            self.intBusiness = intBusiness
        }
        //Vendor
        if let setVendor: String = strVendor {
            self.strVendor = setVendor
        } else {
            self.strVendor = "No Vendor"
        }
        //Purchase Date
        if let setPurchaseDate: String = strPurchaseDate {
            self.strPurchaseDate = setPurchaseDate
        } else {
            self.strPurchaseDate = convertDatetoString(dtmDate: Date())
        }
        //Category
        if self.intBusiness == 1 {
            self.strCategory = "Business"
        } else if let newStrCategory = strCategory {
            self.strCategory = newStrCategory
        } else {
            self.strCategory = "None"
        }
        //Total
        if isCurrency(strAmount: strTotal) {
            self.strTotal = strTotal
        } else {
            self.strTotal = "$0.00"
        }
    }

}

class ReceiptModel: ObservableObject{
    @Published var allReceipts: [Receipt] = []
    
    init(db: OpaquePointer?) {
        self.allReceipts = selectFromtblReceipts(db: db, queryString: "SELECT * FROM tblReceipts")
    }
    func insert(newReceipt: Receipt, db: OpaquePointer?) -> () {
        insertIntotblReceipts(db: db, strUUID: newReceipt.strUUID, intBusiness: newReceipt.intBusiness, strVendor: newReceipt.strVendor, strPurchaseDate: newReceipt.strPurchaseDate, strCategory: newReceipt.strCategory, strTotal: newReceipt.strTotal)
        self.allReceipts.append(newReceipt)
    }
}

func convertDatetoString(dtmDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter.string(from: dtmDate)
}

func convertStringToDate(strDate: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    if let newDate = dateFormatter.date(from: strDate) {
        return newDate
    }else{
        return Date()
    }
}

func isCurrency(strAmount: String) -> Bool {
    let pattern = "^\\$?([1-9]\\d{0,2}(,\\d{3})*|(0|(\\d{1,3}))(,\\d{3})*)(\\.\\d{2})?$"
    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
        return false
    }
    
    let range = NSRange(location: 0, length: strAmount.utf16.count)
    return regex.firstMatch(in: strAmount, options: [], range: range) != nil
}
