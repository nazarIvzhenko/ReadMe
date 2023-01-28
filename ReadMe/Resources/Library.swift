//
//  Library.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

struct Library {
    var sortedBooks: [Book] {
        booksChache
    }
    
    /// An in-memory cache of the manually-sorted books.
    private var booksChache: [Book] = [
        .init(title: "Atomic Habits", author: "James Clear"),
        .init(title: "Essentialism", author: "Greg McKeown"),
        .init(title: "How to Win Friends & Influence People", author: "Dale Carnegie"),
        .init(title: "Can't Hurt Me", author: "David Goggins"),
        .init(title: "the War of Art", author: "Steven Pressfield")
    ]
}
