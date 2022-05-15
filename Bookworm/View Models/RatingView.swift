//
//  RatingView.swift
//  Bookworm
//
//  Created by Michael & Diana Pascucci on 5/15/22.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - PROPERTIES
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    // var offImage: Image?             // Paul uses the .nil but I chose the unfilled star
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    // var offColor = Color.gray        // Paul uses the gray color but I chose the yellow color as an outline
    var offColor = Color.yellow
    var onColor = Color.yellow
    
    // MARK: - BODY
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    // MARK: - METHODS
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage // ?? onImage
        } else {
            return onImage
        }
    }
}

// MARK: - PREVIEWS
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
