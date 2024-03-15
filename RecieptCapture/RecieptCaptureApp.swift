////
////  RecieptCaptureApp.swift
////  RecieptCapture
////
////  Created by jacob rego on 2/25/24.
////
//
import SwiftUI
import SwiftData
//let dependencies = [
//  "TensorFlowLiteSwift: https://github.com/tensorflow/tensorflow-lite-swift.git",
//  "TesseractOCR: https://github.com/tesseract-ocr/tesseract-ocr.git",
//]


// Entry point for the app

@main
struct ReceiptCaptureApp: App {
  var body: some Scene {
    WindowGroup {
        ContentView(RecModel: ReceiptModel(db: openDatabase()))
    }
  }
    
}
