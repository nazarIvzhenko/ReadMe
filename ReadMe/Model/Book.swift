//
//  Book.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 28.01.2023.
//

struct Book: Hashable {
    let title: String
    let author: String
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }
}
