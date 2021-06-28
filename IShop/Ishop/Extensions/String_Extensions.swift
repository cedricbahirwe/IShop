//
//  String_Extensions.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import Foundation

extension Double {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        //        formatter.currencyCode = "CDF"
        //        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: self)) ?? "$0"
    }
    
}
