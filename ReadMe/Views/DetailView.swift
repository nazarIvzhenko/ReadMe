//
//  DetailView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

import PhotosUI.PHPicker
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
        
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    book.readMe.toggle()
                } label: {
                    Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 48, weight: .light))
                }
                
                TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            }
            
            ReviewAndImageStack(book: book, image: $library.images[book])
            
            Spacer()
        }
        .onDisappear {
            withAnimation {
                library.sortBooks()
            }
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
            .environmentObject(Library())
            .previewInAllColorSchemes
    }
}
