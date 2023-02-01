//
//  Library.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

import SwiftUI

enum Section: CaseIterable {
    case readMe
    case finished
}

class Library: ObservableObject {
    var sortedBooks: [Section:[Book]] {
        let groupedBooks = Dictionary(grouping: booksCache, by: \.readMe)
        return Dictionary(uniqueKeysWithValues: groupedBooks.map {
            (($0.key ? .readMe : .finished), $0.value)
        })
    }
    
    func sortBooks() {
        booksCache = sortedBooks.sorted { $1.key == .finished }.flatMap { $0.value }
        objectWillChange.send()
    }
    
    /// Adds a new book at the start of library's manually-sorted books.
    func addNewBook(_ book: Book, image: Image?) {
        booksCache.insert(book, at: 0)
        images[book] = image
        
    }
    
    /// An in-memory cache of the manually-sorted books.
    @Published private var booksCache: [Book] = [
        .init(title: "Atomic Habits", author: "James Clear", microReview: "A great book to understand how habits affect life and how to bring good habits into your life."),
        .init(title: "Essentialism", author: "Greg McKeown"),
        .init(title: "How to Win Friends & Influence People", author: "Dale Carnegie", microReview: "Valuable information."),
        .init(title: "Can't Hurt Me", author: "David Goggins", microReview: "🤯"),
        .init(title: "the War of Art", author: "Steven Pressfield")
    ]
    
    @Published var images: [Book: Image] = [:]
}
