//
//  RecFromAlbumView.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/11/24.
//
//  Grabs receipts from album, aggregates data, displays data to user

import SwiftUI

struct RecFromAlbumView: View {
    @State var showLib: Bool = false
    @State var libImages: [UIImage] = []
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if libImages.isEmpty {
            AddImages
        } else {
            ResultsView
            SaveButton
        }
    }
    
    var AddImages: some View {
        NavigationView {
            ShowLibrary(showPicker: $showLib, selectedImages: $libImages)
        }
        
    }
    
    var ResultsView: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(libImages, id: \.self) { image in
                    HStack{
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading, 20)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                //processed receipt info here.
                                Text("Category 1")
                                Text("Category 1")
                                Text("Category 1")
                                Text("Category 1")
                                Text("Category 1")
                                Text("Category 1")
                                Text("Category 1")
                            }}
                    }}
            }
        }
    }
    
    var SaveButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Save")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    Color.blue
                        .cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )}
    }
}
    
#Preview {
    RecFromAlbumView()
}
