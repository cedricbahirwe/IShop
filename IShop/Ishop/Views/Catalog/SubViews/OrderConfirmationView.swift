//
//  OrderConfirmationView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

enum OrderState {
    case pending, initial, progress, complete
}
struct OrderStatus: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String? = nil
    var state: OrderState
    
    static let orderStatusSteps: [OrderStatus] = [
        OrderStatus(title: "Packing", state: .complete),
        OrderStatus(title: "En Route", state: .progress),
        OrderStatus(title: "Packing", state: .initial),
    ]
}

struct OrderConfirmationView: View {
    var body: some View {
        VStack {
            BottomSheetHeader("Current order")
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 10)  {
                    Text("Your order is confirmed")
                        .font(Font.title2.bold())
                    HStack(alignment: .top) {
                        Image(systemName: "mappin.and.ellipse")
                        VStack(alignment: .leading) {
                            Text("Himbi, Riviera Hotel")
                                .font(.callout)
                            Text("Goma, Av Du Musee")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                }
                .padding(10)
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(OrderStatus.orderStatusSteps) { step in
                            Circle()
                                .foregroundColor(Color.primary)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    ZStack {
//                                       swit
                                    }
                                )
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(OrderStatus.orderStatusSteps) { step in
                            Text(step.title)
                                .font(.footnote)
                        }
                    }
                }
                
                myOrderSection
                    .padding(.leading, 10)

                VStack(spacing: 10) {
                    LargeRatingView(rating: .constant(0))
                    freeDeliveryToast
                    
                    LargePrimaryButton("Show on map", action: { })
                    
                    LargeBlackButton("Contact your driver", action: { })
                }
                .padding(10)
            }
        }
    }
    private var myOrderSection: some View {
        Section(header: Text("My order").font(Font.title3.bold())) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 10) { item in
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.lightGray)
                                .frame(width: 80, height: 80)
                            Text("Title")
                                .font(.footnote)
                            Text("Subtitle")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                        }
                    }
                }
            }
            
        }
    }
    private var freeDeliveryToast: some View {
        Text("Free delivery, when \nYou invite your friend.")
            .bold()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.lightGray)
            .cornerRadius(10)
    }
}

struct OrderConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationView()
    }
}
