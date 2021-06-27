//
//  BottomSheetHeader.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 27/06/2021.
//

import SwiftUI

struct BottomSheetHeader: View {
    
    var leftAccessory: some View {
        HStack {
            Button(action: {
                 _ = didPressback
            }){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .font(Font.body.bold())
                    .foregroundColor(.primary)
            }
        }
        
    }
    var rightAccessory: some View =  {
        Spacer()
    }()
    let title: String
    let didPressback: (() -> Void)?
    let showBackButton: Bool
    init(_ title: String, didPressBack: (() -> Void)? = nil) {
    
        self.title = title
        self.didPressback = didPressBack
        self.showBackButton = didPressback != nil
    }
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text(title)
                    .font(Font.headline.bold())
                HStack {
                    leftAccessory
                        .opacity(showBackButton ? 1 : 0)
                    Spacer()
                    rightAccessory
                    
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            Divider()
            
        }
        
    }
}


struct BottomSheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetHeader("Title Here")
    }
}
