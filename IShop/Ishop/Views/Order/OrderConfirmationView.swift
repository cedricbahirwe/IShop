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
    var subtitle: String? = nil
    var state: OrderState
    
    static let orderStatusSteps: [OrderStatus] = [
        OrderStatus(title: "Packing", state: .complete),
        OrderStatus(title: "En Route", state: .progress),
        OrderStatus(title: "Packing",
                    subtitle: "Estimated delivery (6:00pm)", state: .initial),
    ]
}

struct OrderConfirmationView: View {
    @State private var rating: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            BottomSheetHeader("Current order")
            ScrollView {
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
                        VStack(alignment: .leading, spacing: 25) {
                            ForEach(0..<OrderStatus.orderStatusSteps.count) { index in
                                let step = OrderStatus.orderStatusSteps[index]
                                Circle()
                                    .foregroundColor(Color.primary)
                                    .frame(width: 30, height: 30)
                                    .overlay(
                                        ZStack {
                                            if step.state == .complete {
                                                Image(systemName: "checkmark")

                                            } else {
                                                Text("\(index+1)")
                                            }
                                        }
                                        .font(Font.footnote.weight(.semibold))
                                        .foregroundColor(.mainBackground)
                                    )
                                    .overlay(
                                        ZStack {
                                            if index != 0 {
                                                Color.secondary
                                                    .frame(width: 2, height: 25)
                                                    .overlay(
                                                        Color.primary
                                                            .frame(width: 2, height: 15)
                                                            .opacity(index == 1 ? 1 : 0)
                                                        , alignment: .top
                                                    )
                                                    .offset(y: -25)
                                            }
                                        }
                                        , alignment: .top
                                    )
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 25) {
                            ForEach(OrderStatus.orderStatusSteps) { step in
                                VStack(alignment: .leading) {
                                    Text(step.title)
                                        .font(.footnote)
                                    if let subtitle = step.subtitle {
                                        Text(subtitle)
                                            .font(.caption)
                                    }
                                }
                                .frame(height: 30)
                                    
                               
                            }
                        }
                    }
                    
                    .padding(10)
                    myOrderSection
                        .padding(.leading, 10)
                        .redacted(reason: .placeholder)

                    VStack(spacing: 10) {
                        LargeRatingView(rating: $rating)
                        
                        freeDeliveryToast
                        
                        LargePrimaryButton("Show on map", action: { })
                        
                        LargeBlackButton("Contact your driver", action: { })
                    }
                    .padding(10)
                }
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
