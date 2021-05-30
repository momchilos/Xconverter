//
//  ContentView.swift
//  Xconverter
//
//  Created by Sem Moolenschot on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var api = API()
    @State private var amount: String = "0"
    @State private var pickerSelection = 0
    
    var total: Double {
        guard api.buyingPrice.count > 0 else {
            return 0
        }
        let buyingPrice = api.buyingPrice[pickerSelection]
        let doubleAmount = Double(amount.prefix(12)) ?? 0.0
        let totalAmount = buyingPrice * doubleAmount
        return totalAmount
    }
    
    var symbol: String {
        guard api.symbolArray.count > 0 else {
            return ""
        }
        let currentSymbol = api.symbolArray[pickerSelection]
        return currentSymbol
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(symbol)\(total, specifier: "%.2f")")
                .font(.system(size: 30))
            Text("\(amount) bitcoin is equal to \(symbol)\(total, specifier: "%.2f")")
                .font(.system(size: 20))
            Spacer()
            TextField("Enter amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            Picker("", selection: $pickerSelection) {
                ForEach(0..<api.currencyCode.count) {
                    let currency = api.currencyCode[$0]
                    Text(currency)
                }
            }
            .id(UUID())
            .labelsHidden()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
