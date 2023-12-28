//
//  PhotoPickerView.swift
//  Project13Playground
//
//  Created by Henrieke Baunack on 12/27/23.
//
import PhotosUI
import SwiftUI

struct PhotoPickerView: View {
    // selecting multiple images would use array of PickerItem and Image and loop through the selection in view with forEach in task with "for.. in.." syntax
    @State var pickerItem: PhotosPickerItem?
    @State var selectedImage: Image?
    var body: some View {
        VStack{
            PhotosPicker("Select a photo", selection: $pickerItem, matching: .images)
            selectedImage?
                .resizable()
                .scaledToFit()
        }.onChange(of: pickerItem) {
            Task{
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}
