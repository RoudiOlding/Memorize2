//
//  CardView.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 29/07/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center )
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration : 1), value: card.isMatched)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp) 
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants{
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset : CGFloat  = 5
        }
    }
}

extension Animation {
    static func spin(duration : TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    
    static var previews: some View {
        VStack{
            HStack{
                CardView(Card(isFaceUp: true, content: "A", id: "Test 1"))
                    .aspectRatio(4/3, contentMode: .fit)
                CardView(Card(content: "A", id: "Test 1"))
            }
            HStack{
                CardView(Card(isFaceUp: true, content: "This is a vere long string and I hopeit fits", id: "Test 1"))
                CardView(Card(content: "A", id: "Test 1"))
            }
        }
            .padding()
            .foregroundColor(.red)
        
    }
}
