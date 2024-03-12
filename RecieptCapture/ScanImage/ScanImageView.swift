//
//  ScanImageView.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/11/24.
//

import SwiftUI

struct ScanImageView: View {
    @State var booleanbind: Bool = false
    var body: some View {
        CameraView(isShown: $booleanbind)
    }
}

#Preview {
    ScanImageView()
}
