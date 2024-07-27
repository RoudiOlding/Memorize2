//
//  ContentView.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 25/07/24.
//

import SwiftUI

struct ContentView: View {
// The "View" thing indicates the contentview to "Behaves like a" view.
    //var i: Int, this are normal properties
    //var s: String
    let emojis = ["🤨", "💤", "🗿", "🕊️", "🦊", "🎸"]
    @State var cardCount: Int = 4
    
// Some view is say to act like view, but anythin view
    var body: some View {
        //this are computed properties
        VStack{
            ScrollView{
                cards
            }
            cardCountAdjusters
        }.padding()
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.yellow)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
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
    ContentView()
}
