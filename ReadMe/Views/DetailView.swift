//
//  DetailView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            
            Book.Image(title: book.title)
            
            Spacer()
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(book: .init())
        }
    }
}
