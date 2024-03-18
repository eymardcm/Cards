//
//  CardView.swift
//  Cards
//
//  Created by Chad Eymard on 3/18/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROPERTIES
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("developer-no1")
                .resizable()
                .scaledToFit()
            VStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Better Apps.  Less Code")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .italic()
                Spacer()
            } //: VSTACK
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Learn".uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    Image(systemName: "arrow.right.circle")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.medium)
                        .accentColor(.white)
                    } //: HSTACK
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: .colorShadow, radius: 6, x: 0, y: 3)
                }
            ) //: BUTTON
            .offset(y: 210)
        } //: ZSTACK
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

// MARK: - PREVIEW
struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
