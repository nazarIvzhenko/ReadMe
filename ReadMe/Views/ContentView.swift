//
//  ContentView.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 27.01.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: Library
    @State var addingNewBook = false
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    addingNewBook = true
                } label: {
                    Spacer()
                    VStack(spacing: 6) {
                        Image(systemName: "book.circle")
                            .font(.system(size: 60))
                        Text("Add New Book")
                            .font(.title2)
                    }
                    Spacer()
                }
                .buttonStyle(.borderless)
                .padding(.vertical, 8)
                .sheet(isPresented: $addingNewBook) {
                    NewBookView()
                    Spacer()
                }
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    return 0
                }

                ForEach(Section.allCases, id: \.self) {
                    SectionView(section: $0)
                }
            }
            .listStyle(.plain)
            .navigationTitle("My Library")
        }
    }
}

private struct BookRow: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationLink {
            DetailView(book: book)
        } label: {
            HStack {
                Book.Image(image: library.images[book], title: book.title, size: 80, cornerRadius: 12)
                
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

private struct SectionView: View {
    let section: Section
    @EnvironmentObject var library: Library
    
    var title: String {
        switch section {
        case .readMe:
            return "Read Me!"
        case .finished:
            return "Finished!"
        }
    }
    
    var body: some View {
        if let books = library.sortedBooks[section] {
            SwiftUI.Section {
                ForEach(books) { book in
                    BookRow(book: book)
                        .swipeActions(edge: .leading) {
                            Button {
                                withAnimation {
                                    book.readMe.toggle()
                                    library.sortBooks()
                                }
                            } label: {
                                book.readMe ? Label("Finished", systemImage: "bookmark.slash") : Label("Read Me!", systemImage: "bookmark")
                            }
                            .tint(.accentColor)

                        }
                }
                .labelStyle(.iconOnly)
            } header: {
                ZStack {
                    Image("BookTexture")
                        .resizable()
                        .scaledToFit()
                    
                    Text(title)
                        .font(.custom("American Typewriter", size: 24))
                        .foregroundColor(.primary)
                    
                }
                .listRowInsets(.init())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
            .previewInAllColorSchemes
    }
}
