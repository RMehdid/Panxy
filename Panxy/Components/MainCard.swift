//
//  MainCard.swift
//  Panxy
//
//  Created by Samy Mehdid on 29/10/2022.
//

import SwiftUI

extension Operation: Identifiable {
    var id: UUID { UUID() }
}

enum Operation: String, CaseIterable {
    case empty
    case none
    case Add
    case Send
    case Request
    case Bill
}

struct MainCard: View {
    @Binding var operating: Operation
    
    @StateObject var adding = Adding()
    @StateObject var sending = Sending()
    @StateObject var requesting = Requesting()
    
    var body: some View {
        VStack(spacing: 48){
                HStack{
                    Button {
                        //
                    } label: {
                        HStack(spacing: 8){
                            Image("profile-placeholder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 58)
                                .cornerRadius(16)
                            
                            Text("Hello, Samy")
                                .font(.custom("Rubik-Medium", size: 18))
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Image("Category")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            switch operating {
            case .none:
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Wallet (USD)")
                            .font(.custom("Rubik-Medium", size: 18))
                            .opacity(0.5)
                        Text("$ 7,586.00")
                            .font(.custom("Rubik-Medium", size: 42))
                    }
                    HStack(spacing: 24){
                        ForEach(Operation.allCases){ operation in
                            if operation != .none && operation != .empty {
                                Button {
                                    withAnimation {
                                        operating = operation
                                    }
                                } label: {
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 24)
                                                .fill(Color.white.opacity(0.3))
                                            Image(operation.rawValue)
                                                .rotationEffect(Angle(degrees: operation == .Send ? 30.0 : 0))
                                                .padding(24)
                                        }
                                        .fixedSize()
                                        .shadow(radius: 20)
                                        Text(operation.rawValue)
                                            .font(.custom("Rubik-Medium", size: 18))
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 42)
            case .Add:
                VStack(spacing: 24){
                    VStack(alignment: .leading){
                        Text("Card number:")
                            .font(.custom("Rubik-Medium", size: 20))
                            .padding(.horizontal, 6)
                        TextField("", text: $adding.cardNumber)
                            .padding()
                            .background(Color.black.opacity(0.2).cornerRadius(16))
                            .foregroundColor(.white)
                            .placeholder(when: adding.cardNumber.isEmpty) {
                                Text("Enter your card number:")
                                    .foregroundColor(.white)
                                    .font(.custom("Rubik-Regular", size: 16))
                            }
                            .shadow(radius: 20)
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("Experation date: ")
                                .font(.custom("Rubik-Medium", size: 16))
                                .padding(.horizontal, 6)
                            HStack{
                                TextField("", text: $adding.experationMonth)
                                    .padding()
                                    .background(Color.black.opacity(0.2).cornerRadius(16))
                                    .foregroundColor(.white)
                                    .placeholder(when: adding.experationMonth.isEmpty) {
                                        Text("MM")
                                            .foregroundColor(.white)
                                            .font(.custom("Rubik-Regular", size: 16))
                                    }
                                    .frame(width: 62, height: 56)
                                    .shadow(radius: 20)
                                Text("/")
                                    .font(.custom("Rubik-SemiBold", size: 24))
                                TextField("", text: $adding.experationYear)
                                    .padding()
                                    .background(Color.black.opacity(0.2).cornerRadius(16))
                                    .foregroundColor(.white)
                                    .placeholder(when: adding.experationYear.isEmpty) {
                                        Text("YYYY")
                                            .foregroundColor(.white)
                                            .font(.custom("Rubik-Regular", size: 16))
                                    }
                                    .frame(width: 78, height: 56)
                                    .shadow(radius: 20)
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text("CCV:")
                                .font(.custom("Rubik-Medium", size: 16))
                                .padding(.horizontal, 6)
                            TextField("", text: $adding.ccv)
                                .padding()
                                .background(Color.black.opacity(0.2).cornerRadius(16))
                                .foregroundColor(.white)
                                .placeholder(when: adding.ccv.isEmpty) {
                                    Text("CVV")
                                        .foregroundColor(.white)
                                        .font(.custom("Rubik-Regular", size: 16))
                                }
                                .frame(width: 68, height: 56)
                                .shadow(radius: 20)
                        }
                    }
                    HStack{
                        Spacer()
                        Button {
                            withAnimation {
                                operating = .none
                            }
                        } label: {
                            Text("Cancel")
                                .font(.custom("Rubik-Regular", size: 22))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(.infinity)
                        }
                        
                        Button {
                            withAnimation {
                                operating = .none
                            }
                        } label: {
                            Text("Add")
                                .font(.custom("Rubik-Regular", size: 22))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(.infinity)
                        }
                    }
                }
            case .Send:
                VStack(spacing: 30){
                    VStack(alignment: .leading){
                        Text("Destination ID: ")
                            .font(.custom("Rubik-Medium", size: 20))
                        TextField("", text: $sending.destinationID)
                            .padding()
                            .background(Color.black.opacity(0.2).cornerRadius(16))
                            .foregroundColor(.white)
                            .placeholder(when: sending.destinationID.isEmpty) {
                                Text("Enter your receiver id:")
                                    .foregroundColor(.white)
                                    .font(.custom("Rubik-Regular", size: 16))
                            }
                            .shadow(radius: 20)
                    }
                    VStack(alignment: .leading){
                        Text("Amount:")
                            .font(.custom("Rubik-Medium", size: 20))
                        TextField("", text: $sending.amount)
                            .padding()
                            .background(Color.black.opacity(0.2).cornerRadius(16))
                            .foregroundColor(.white)
                            .placeholder(when: sending.destinationID.isEmpty) {
                                Text("Enter amount in $USD:")
                                    .foregroundColor(.white)
                                    .font(.custom("Rubik-Regular", size: 16))
                            }
                            .shadow(radius: 20)
                    }
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                operating = .none
                            }
                        } label: {
                            Text("Cancel")
                                .font(.custom("Rubik-Regular", size: 22))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(.infinity)
                        }
                        
                        Button {
                            withAnimation {
                                operating = .none
                            }
                        } label: {
                            Text("Send")
                                .font(.custom("Rubik-Regular", size: 22))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(.infinity)
                        }
                    }
                }
            case .Request:
                VStack(spacing: 30){
                    VStack(alignment: .leading){
                        Text("Request from: ")
                            .font(.custom("Rubik-Medium", size: 20))
                        TextField("", text: $requesting.requestFromID)
                            .padding()
                            .background(Color.black.opacity(0.2).cornerRadius(16))
                            .foregroundColor(.white)
                            .placeholder(when: requesting.requestFromID.isEmpty) {
                                Text("Enter your request body id:")
                                    .foregroundColor(.white)
                                    .font(.custom("Rubik-Regular", size: 16))
                            }
                            .shadow(radius: 20)
                    }
                    VStack(alignment: .leading){
                        Text("Amount:")
                            .font(.custom("Rubik-Medium", size: 20))
                        TextField("", text: $requesting.amount)
                            .padding()
                            .background(Color.black.opacity(0.2).cornerRadius(16))
                            .foregroundColor(.white)
                            .placeholder(when: requesting.requestFromID.isEmpty) {
                                Text("Enter amount in $USD:")
                                    .foregroundColor(.white)
                                    .font(.custom("Rubik-Regular", size: 16))
                            }
                            .shadow(radius: 20)
                    }
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                operating = .none
                            }
                        } label: {
                            Text("Cancel")
                                .font(.custom("Rubik-Regular", size: 22))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(.infinity)
                        }
                        
                        Button {
                            withAnimation {
                                operating = .none
                            }
                        } label: {
                            Text("Request")
                                .font(.custom("Rubik-Regular", size: 22))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(.infinity)
                        }
                    }
                }
            case .Bill:
                VStack(spacing: 48){
                    Text("Pay your Bill")
                        .font(.custom("Rubik-Medium", size: 32))
                    VStack(spacing: 16){
                        Image(systemName: "iphone")
                            .resizable()
                            .frame(width: 56, height: 88)
                        Text("Hold near reader")
                            .font(.custom("Rubik-Regular", size: 20))
                    }
                    Button{
                        withAnimation {
                            operating = .none
                        }
                    } label: {
                        Text("Cancel")
                            .font(.custom("Rubik-Regular", size: 22))
                            .padding(.horizontal, 22)
                            .padding(.vertical, 12)
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(.infinity)
                    }
                }
            case .empty:
                EmptyView()
            }
        }
        .foregroundColor(.white)
        .padding()
        .padding(.top, 42)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color("backgroundTabbar")]), startPoint: .bottomTrailing, endPoint: .topLeading)
                LinearGradient(gradient: Gradient(colors: [Color("Ceal"), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .cornerRadius(operating == .empty ? 16 : 38)
    }
}

struct MainCard_Previews: PreviewProvider {
    static var previews: some View {
        MainCard(operating: .constant(.none))
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
                .padding()
            self
        }
    }
}
