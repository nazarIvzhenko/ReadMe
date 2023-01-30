//
//  NewBookView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 30.01.2023.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: Image? = nil
    @EnvironmentObject var library: Library
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $book.title)
                    .padding(.bottom)
                TextField("Author", text: $book.author)
                    .padding(.bottom)
                ReviewAndImageStack(book: book, image: $image)
            }
            .padding()
            .navigationTitle("Got a new book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to Library") {
                        library.addNewBook(book, image: image)
                        dismiss()
                    }
                    .disabled([book.title, book.author]
                        .contains(where: \.isEmpty))
                }
            }
        }
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView()
            .environmentObject(Library())
    }
}
