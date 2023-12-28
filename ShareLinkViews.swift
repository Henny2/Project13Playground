//
//  ShareLinkViews.swift
//  Project13Playground
//
//  Created by Henrieke Baunack on 12/27/23.
//

import SwiftUI

struct ShareLinkViews: View {
    var body: some View {
        VStack{
            Spacer()
            ShareLink(item: URL(string: "https://google.com")!)
            Spacer()
            let exampleImage = Image(.example)
            // shareLink view for images needs a preview
            ShareLink(item:exampleImage, preview: SharePreview("Example Image", image: exampleImage)) {
                Label("Share an image", systemImage: "photo")
            }
            Spacer()
        }
    }
}

#Preview {
    ShareLinkViews()
}
