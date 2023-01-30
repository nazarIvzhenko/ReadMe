//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 30.01.2023.
//

import PhotosUI.PHPicker
import SwiftUI

struct ReviewAndImageStack: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State var showingImagePicker = false
    @State var showingDeletionAlert = false
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical)
            TextField("Review…", text: $book.microReview, axis: .vertical)
            Divider()
                .padding(.vertical)
            
            Book.Image(image: image, title: book.title, cornerRadius: 16)
                .scaledToFit()
            
            HStack {
                if image != nil {
                    Spacer()
                    Button("Delete Image") {
                        showingDeletionAlert = true
                    }
                }
                Spacer()
                Button("Update Image…") {
                    showingImagePicker = true
                }
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog("Delete image for \(book.title)?", isPresented: $showingDeletionAlert) {
            Button("Delete", role: .destructive) {
                image = nil
            }
        } message: {
            Text("Delete image for \(book.title)?")
        }
    }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(book: .init(), image: .constant(nil))
            .padding(.horizontal)
            .previewInAllColorSchemes
    }
}
