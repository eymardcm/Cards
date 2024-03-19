//
//  ContentView.swift
//  Cards
//
//  Created by Chad Eymard on 3/17/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var cards: [Card] = cardData
    
    // MARK: - BODY
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 30) {
                ForEach(cards) { data in
                    CardView(card: data)
                } //: LOOP
            } //: HSTACK
            .padding(30)
        } //: HSTACK
    } //: BODY
}

// MARK: - PREVIEW
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
    }
}
