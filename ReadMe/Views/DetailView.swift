//
//  DetailView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

import PhotosUI.PHPicker
import SwiftUI

struct DetailView: View {
    let book: Book
    @Binding var image: Image?
    @State var showingImagePicker = false
    @State var showingDeletionAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            
            VStack {
                Book.Image(image: image, title: book.title, cornerRadius: 16)
                    .scaledToFit()
                
                HStack(spacing: 30) {
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
            
            Spacer()
        }
        .padding()
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(book: .init(), image: .constant(nil))
        }
    }
}
