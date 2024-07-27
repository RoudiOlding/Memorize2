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
    
// Some view is say to act like view, but anythin view
    var body: some View {
        //this are computed properties
        let emojis = ["🤨", "💤", "🗿", "🕊️"]
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.yellow)
        .padding()
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
