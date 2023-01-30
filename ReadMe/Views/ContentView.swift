//
//  ContentView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 27.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var library = Library()
    
    var body: some View {
        NavigationStack {
            List(library.sortedBooks) { book in
                BookRow(book: book, image: $library.images[book])

            }
            .listStyle(.plain)
            .navigationTitle("My Library")
        }
    }
}

struct BookRow: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink {
            DetailView(book: book, image: $image)
        } label: {
            HStack {
                Book.Image(image: image, title: book.title, size: 80, cornerRadius: 12)
                
                VStack(alignment: .leading) {
                    TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    
                    if !book.microReview.isEmpty {
                        Spacer()
                        Text(book.microReview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .lineLimit(1)
            }
            .padding(.vertical, 8.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
