//
//  AboutUsView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 25/06/2021.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack {
            TopNavigationHeaderView(title: "About IShop")
            RoundedRectangle()
//                .fr
//            TopNavigationHeaderView(didPop: <#T##(() -> ())?##(() -> ())?##() -> ()#>)
            Text("Hello, World!")
//            Spacer()
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
