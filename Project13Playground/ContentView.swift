//
//  ContentView.swift
//  Project13Playground
//
//  Created by Henrieke Baunack on 12/26/23.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    func loadImage() {
        // this is how you would just load the image direclty
        // image = Image(.example)
        
        // using core image you can add image filters/effects etc.
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        
        // the following two lines leverage the new APIs, setting intensity etc directly
        // this is good if you select one specific filter
        
//        currentFilter.intensity = 0.5
//        currentFilter.scale = 100
        
        // if you are switching filters more dynamically, the old APIs are more helpful
        // there you basically check what atributes the filter supports and set them dynamically
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        // checking what keys/attributes are supported/needed for the filter and setting them
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(amount, forKey: kCIInputIntensityKey)}
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
        
    }
}

#Preview {
    ContentView()
}
