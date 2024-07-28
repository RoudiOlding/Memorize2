//
//  ContentView.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 25/07/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
// The "View" thing indicates the contentview to "Behaves like a" view.
    //var i: Int, this are normal properties
    //var s: String
    var viewModel: EmojiMemoryGame
    
    let emojis = ["🤨", "💤", "🗿", "🕊️", "🦊", "🎸", "🤨", "💤", "🗿", "🕊️", "🦊", "🎸"]
    @State var cardCount: Int = 4
    
// Some view is say to act like view, but anythin view
    var body: some View {
        //this are computed properties
        ScrollView{
            cards
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.yellow)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}


#Preview {
    EmojiMemoryGameView()
}
