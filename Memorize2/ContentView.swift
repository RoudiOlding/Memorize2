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
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.red)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🗣️").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
            
        })
    }
}


#Preview {
    ContentView()
}
