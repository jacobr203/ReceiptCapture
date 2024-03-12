//
//  DeleteButton.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/11/24.
//

import SwiftUI

class ImageModel: ObservableObject {
    @Published var images: [UIImage] = [UIImage(named: "testReceipt")!]
}

struct DeleteButton: View {
    @ObservedObject var imageModel: ImageModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(imageModel.images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Images")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        imageModel.images.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(imageModel: ImageModel())
    }
}
