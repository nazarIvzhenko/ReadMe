//
//  ContentView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 27.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(Library().sortedBooks, id: \.title) { book in
                NavigationLink {
                    DetailView(book: book)
                } label: {
                    BookRow(book: book)
                }

            }
            .listStyle(.plain)
            .navigationTitle("My Library")
        }
    }
}

struct BookRow: View {
    let book: Book
    
    var body: some View {
        HStack {
            Book.Image(title: book.title, size: 80)
            
            TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                .lineLimit(1)
        }
        .padding(.vertical, 8.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
