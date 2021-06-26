//
//  CodeVerificationBottomSheet.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct CodeVerificationBottomSheet: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .font(Font.body.bold())
                Spacer()
                Text("Verification")
                    .font(Font.headline.bold())
                Spacer()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            Divider()
            VStack(alignment: .leading) {
                Text("We sent SMS with secure code to verify your phone numer: +243 972 628 511")
                HStack {
                    Text("Code:")
                        .font(.callout)
                    
                    TextField("····", text: .constant(""))
                    ProgressView()
                }
                .padding(10)
                .background(Color.lightGray)
                .cornerRadius(8)
                
                Group {
                    Text("Code verified")
                    // Will show reamining time before available options
                    Text("Code sent: New code will be available in 29...")
                    // Will be used when time elapse and code is not entered
                    HStack {
                        Text("Didn't get the code?")
                            .foregroundColor(.gray)
                        
                        Text("Invalid code.") // Used for invalid code
                            .foregroundColor(.red)
                        Button("Resend", action: {})
                            .foregroundColor(.accentColor)
                        
                    }
                    
                    Text("We sent new code. Re-sending the code will be available in 24...")
                        .foregroundColor(.gray)
                }
                .font(.caption)
                .foregroundColor(.gray)

                
            }
            .padding(10)
            
        }
    }
}

struct CodeVerificationBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        IBottomSheetView(initialOffsetY: 380, showCard: .constant(true)) {
            CodeVerificationBottomSheet()
        }
    }
}
