//
//  LargeRatingView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

struct LargeRatingView: View {
    @Binding var rating: Int
    var body: some View {
        VStack(spacing: 15) {
            Text("Rating your experience")
                .font(Font.title2.bold())
            
          
            HStack {
                
                ForEach(0 ..< 5) { index in
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundColor(index<rating ? .yellow :  .mainDark)
                        .onTapGesture {
                            rating = index + 1
                        }
                    if index != 4 {
                        Spacer(minLength: 0)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
            
        }
        .padding(.horizontal)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.lightGray)
        .cornerRadius(10)
    }
}

struct LargeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        LargeRatingView(rating: .constant(0))
            .padding(10)
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
