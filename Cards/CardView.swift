//
//  CardView.swift
//  Cards
//
//  Created by Chad Eymard on 3/18/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROPERTIES
    var card: Card
    @State private var fadein: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .opacity(fadein ? 1.0 : 0.0)
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .italic()
                Spacer()
            } //: VSTACK
            .offset(y: moveDownward ? 15 : 2)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                feedback.impactOccurred()
                showAlert.toggle()
            }, label: {
                HStack {
                    Text(card.callToAction.uppercased())
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
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: .colorShadow, radius: 6, x: 0, y: 3)
                }
            ) //: BUTTON
            .offset(y: moveUpward ? 210 : 250)
        } //: ZSTACK
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2), {
                fadein = true
            })
            withAnimation(.linear(duration: 0.8), {
                moveDownward = true
                moveUpward = true
            })
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("Ok")))
        })
    }
}

// MARK: - PREVIEW
struct CardView_Preview: PreviewProvider {
    
    static var previews: some View {
        CardView(card: cardData[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
