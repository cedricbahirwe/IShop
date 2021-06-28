//
//  MyOrdersView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import SwiftUI


fileprivate struct OrderItem: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
    let price: Double
}
struct MyOrdersView: View {
    private let orders:[OrderItem]  = [
        .init(name: "Gatorade Frost", quantity: 1, price: 1.59),
        .init(name: "Caprisun", quantity: 1, price: 2.89),
        .init(name: "Starbucks Mocha", quantity: 2, price: 2.39),
        .init(name: "Snapple Tea", quantity: 1, price: 1.79),
        
    ]
    
    private var ordersTotal: Double {
        orders.map(\.price).reduce(0, +)
    }
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var body: some View {
        VStack(alignment: .leading) {
            TopNavigationHeaderView(title: "My Orders")
                .overlay(
                    Button("Support") { }
                        .font(Font.callout.weight(.semibold))
                        .foregroundColor(.mainBlack)
                        .padding(.trailing, 10)
                    , alignment: .trailing
                )
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Current order")
                            .font(Font.title3.bold())
                        Spacer()
                        Text("\(Date(), formatter: Self.dateFormat)")
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                        Text("Order status")
                        Spacer()
                        Text("Packing")
                    }
                    .font(Font.body.weight(.semibold))
                    
                    ForEach(orders, content: OrderStatusDisplay.init)
                    
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(ordersTotal.formattedPrice)
                    }
                    .font(Font.body.bold())
                    .padding(.vertical, 8)
                    
                    LargeBlackButton("Show on map", action: { })
                    
                    LargePrimaryButton("Cancel order", action: { })
                    
                    
                    Section(header:
                                HStack {
                                    Text("Yesterday")
                                        .font(Font.title3.bold())
                                    Spacer()
                                    Text("\(Date(), formatter: Self.dateFormat)")
                                }
                                .padding(.vertical, 10)) {
                        HStack {
                            Text("Order status")
                            Spacer()
                            Text("Cancel")
                        }
                        .font(Font.body.weight(.semibold))
                        
                        totalSection
                    }
                    
                }
                .padding(10)
            }
        }
        .navigationBarHidden(true)
    }
    
    
    private var totalSection: some View {
        HStack {
            Text("Total")
            Spacer()
            Text(ordersTotal.formattedPrice)
        }
        .font(Font.body.bold())
        .padding(.vertical, 8)
    }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}
struct OrderStatusDisplay: View {
    fileprivate let order: OrderItem
    var body: some View {
        HStack(spacing: 3) {
            Text(order.name)
            Spacer()
            Text(order.quantity.description + "x")
            Text(order.price.formattedPrice)
            
        }
        .foregroundColor(.secondary)
        .font(.callout)
        .padding(.vertical,1)
    }
}
