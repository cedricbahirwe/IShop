//
//  ChangeAddressView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct ChangeAddressView: View {
    @State private var searchAddress: String = ""
    private let addresses: [String] = ["Himbi", "Office", "Ndosho", "Kyeshero"]
    @Environment(\.presentationMode) private  var presentationMode

    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Enter your address", text: $searchAddress)
                        .textContentType(.addressCityAndState)
                        
                    Image(systemName: "mic.fill")
                    
                }
                .padding(5)
                .background(Color(.tertiarySystemGroupedBackground))
                .cornerRadius(8)
                .foregroundColor(Color.mainBlack.opacity(0.6))
                
                
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)


            if !searchAddress.isEmpty {
                List(addresses, id: \.self) { address in
                    HStack(alignment: .top){
                        Image(systemName: "multiply.square")
                        VStack(alignment: .leading) {
                            Text("Av Du Musee, No. 52")
                                .font(.callout)
                            Text(address)
                                .font(.caption)
                                .opacity(0.8)
                        }
                    }
                    
                }
                .listStyle(InsetListStyle())
            } else {
                VStack {
                    Spacer()
                    Image("location.pin")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Text("Please enter your address \nor allow access to geolocation")
                        .multilineTextAlignment(.center)

                    HStack(spacing: 2) {
                        Text("services in")
                        Button(action: {
                            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString + "&path=PRIVACY")!)
                        }, label: {
                            Text("settings")
                        })
                    }
                    Spacer()
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct ChangeAddressView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAddressView()
//            .preferredColorScheme(.dark)
    }
}
