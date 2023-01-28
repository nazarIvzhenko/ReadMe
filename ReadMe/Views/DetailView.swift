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
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            
            VStack {
                Book.Image(image: image, title: book.title, cornerRadius: 16)
                    .scaledToFit()
                
                Button("Update Image…") {
                    showingImagePicker = true
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
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
