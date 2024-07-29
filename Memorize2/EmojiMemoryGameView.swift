//
//  ContentView.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 25/07/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //Se obvserva si se cambia, en caso sea el caso se re dibuja
    @ObservedObject var viewModel: EmojiMemoryGame
        
    private let aspectRatio: CGFloat = 2/3
    private let spacing  : CGFloat = 4
     
    var body: some View {
        VStack{
            cards
                .foregroundColor(viewModel.color)
                .animation(.default, value: viewModel.cards)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }.padding()
    }
    
    private var cards: some View{
        AspectGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(.yellow)
    }
} 

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
