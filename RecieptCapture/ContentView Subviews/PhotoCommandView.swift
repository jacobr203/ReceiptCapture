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
                ScanImgButton
                Spacer()
                PhotoAlbumButton
            //.background(.blue)
        }
        .frame(width: 400, height:70, alignment: .bottom)
        .navigationBarHidden(true)
    }
    var ScanImgButton: some View {
        NavigationLink(destination: ScanImageView()) {
            Image(systemName: strCameraIcon)
                .foregroundColor(.white)
                //.frame(width:40, height: 30)
                .font(.system(size: 40))
                .padding(.leading, 40)
        }
    }
    
    var PhotoAlbumButton: some View {
        NavigationLink(destination: RecFromAlbumView()) {
            Image(systemName: strAlbumIcon)
                .foregroundColor(.white)
                //.frame(width:40, height: 30)
                .font(.system(size: 40))
                .padding(.trailing, 40)
        }
    }
}


#Preview {
    PhotoCommandView()
}
