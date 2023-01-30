//
//  Library.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

import SwiftUI

struct Library {
    var sortedBooks: [Book] {
        booksChache
    }
    
    /// An in-memory cache of the manually-sorted books.
    private var booksChache: [Book] = [
        .init(title: "Atomic Habits", author: "James Clear", microReview: "A great book to understand how habits affect life and how to bring good habits into your life."),
        .init(title: "Essentialism", author: "Greg McKeown"),
        .init(title: "How to Win Friends & Influence People", author: "Dale Carnegie", microReview: "Valuable information."),
        .init(title: "Can't Hurt Me", author: "David Goggins", microReview: "🤯"),
        .init(title: "the War of Art", author: "Steven Pressfield")
    ]
    
    var images: [Book: Image] = [:]
}
