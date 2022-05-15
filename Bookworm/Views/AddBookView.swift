//
//  AddBookView.swift
//  Bookworm
//
//  Created by Michael & Diana Pascucci on 5/15/22.
//

import SwiftUI


struct AddBookView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Mystery"
    @State private var review = ""
    // Added for challenge 11.1
    var validInfoProvided: Bool {
        if !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            !author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Book Details (Required)")
                }
                
                Section {
                    TextEditor(text: $review)
                        .frame(height: 200)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        // Added for challenge 11.3
                        newBook.date = Date.now
                        try? moc.save()
                        dismiss()
                    }
                    // Added for challenge 11.1
                    .disabled(validInfoProvided)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

// MARK: - PREVIEWS
struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
