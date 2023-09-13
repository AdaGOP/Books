//
//  ContentView.swift
//  Books
//
//  Created by khoirunnisa' rizky noor fatimah on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var items = 0
    @State var price = 10000.56
    private let numberFormatter: NumberFormatter
    
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.maximumFractionDigits = 2
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "note.text")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("items_found \(items)")
            Text("\(numberFormatter.string(from: price as NSNumber)!)")
            Button {
                items += 1
                print(numberFormatter.locale.identifier)
            } label: {
                Text("Add")
            }

        }
        .padding()
        .environment(\.layoutDirection, numberFormatter.locale.identifier == "ar_SA" ? .rightToLeft : .leftToRight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "ko"))
        ContentView()
            .environment(\.locale, .init(identifier: "en"))
        ContentView()
            .environment(\.locale, .init(identifier: "ar"))
        ContentView()
            .environment(\.locale, .init(identifier: "id"))
    }
}
