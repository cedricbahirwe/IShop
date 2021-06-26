//
//  AccountDetails.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct AccountDetails: View {
    @State private var showPassword: Bool = false
    @State private var password: String = ""
    @State private var State: LoadingButton.ButtonState = .initial
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .font(Font.body.bold())
                Spacer()
                Text("Account details")
                    .font(Font.headline.bold())
                Spacer()
            }
            .padding(10)
            Divider()
            
            VStack(alignment: .leading) {
                Text("Almost done, next lets add:")
                HStack {
                    TextField("First name", text: .constant(""))
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                    
                    TextField("Last name", text: .constant(""))
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                }
                
                TextField("Your email", text: .constant(""))
                    .frame(height: 50)
                    .padding(.leading, 10)
                    .background(Color.lightGray)
                    .cornerRadius(10)
                
                
                HStack(spacing: 0) {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .padding()
                        .onTapGesture { }
                }
                .frame(height: 50)
                .padding(.leading, 10)
                .background(Color.lightGray)
                .cornerRadius(10)
            }
            .padding(10)
            Divider()
            
            Button(action: {
                withAnimation {
                    State = State == .initial ? .loading : State == .loading ? .finished : .initial
                    
                }
            }, label: {
                Text("Continue")
                    .font(Font.callout.weight(.semibold))
                    .padding()
                    .foregroundColor(.mainBackground)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainDark)
                    .cornerRadius(8)
            })
            .padding(10)
            LoadingButton(title: "Continue", state: State)
                .padding()
            
        }
    }
}

struct AccountDetails_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetails()
    }
}


struct LoadingButton: View {
    
    enum ButtonState {
        case initial, loading, finished
    }
    let title: String
    
    var state: ButtonState
    @State private var animate: Bool = false
    
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            ZStack {
                switch state {
                case .initial:
                    Text(title)
                        .font(Font.callout.weight(.semibold))
                    
                case .loading:
                    
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .rotationEffect(Angle(degrees: animate ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    Image(systemName: "circle.dashed")
                        .imageScale(.large)
                        .rotationEffect(Angle(degrees: animate ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                default :
                    Image(systemName: "checkmark.circle")
                        .imageScale(.large)
                }
            }
            .padding()
            .foregroundColor(.mainBackground)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.mainDark)
            .cornerRadius(8)
            .animation(.easeIn)
            .onChange(of: state) {
                animate = $0 == .loading ? true : false
            }
        }
    }
}
