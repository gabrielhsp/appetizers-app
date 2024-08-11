//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 23/06/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    // MARK: - Properties
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(uiImage: .foodPlaceholder).resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader: ImageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
