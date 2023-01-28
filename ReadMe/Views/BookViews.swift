//
//  BookViews.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

import SwiftUI

struct TitleAndAuthorStack: View {
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
    }
}

extension Book {
    struct Image: View {
        let title: String
        var size: CGFloat?
        
        var body: some View {
            let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "book")
            
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .font(Font.title2.weight(.light))
                .foregroundColor(.secondary.opacity(0.5))
        }
    }
}

extension Image {
    init?(title: String) {
        guard let character = title.first,
              case let systemName = "\(character.lowercased()).square",
              UIImage(systemName: systemName) != nil
        else {
            return nil
        }
        
        self.init(systemName: systemName)
    }
}

struct Book_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleAndAuthorStack(book: .init(), titleFont: .title2, authorFont: .title3)
            Book.Image(title: Book().title, size: 120)
            Book.Image(title: "", size: 120)
            Book.Image(title: "📖", size: 120)
        }
    }
}
