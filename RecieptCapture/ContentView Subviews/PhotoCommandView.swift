//
//  PhotoCommandView.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/11/24.
//

import SwiftUI

struct PhotoCommandView: View {
    let strCameraIcon = "camera.circle"
    let strAlbumIcon = "book.circle"
    
    var body: some View {
        Spacer()
        HStack{
            Button(action: {
                //button code
            }) {
                Image(systemName: strCameraIcon)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .font(.system(size: 40))
                    .padding(.leading, 40)
            }

            Spacer()
            Button(action: {
                //button code
            }) {
                Image(systemName: strAlbumIcon)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .font(.system(size: 40))
                    .padding(.trailing, 40)
            }
        }
        .frame(width: 400)
    }
}

#Preview {
    PhotoCommandView()
}
