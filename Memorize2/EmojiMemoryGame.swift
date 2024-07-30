//
//  EmojiMemoryGame.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 27/07/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🤨", "💤", "🗿", "🕊️", "🦊", "🎸", "⚗️", "⚰️", "🔫", "🪓"]
    //the private contrainst this model var to only be modified by this "model view"
    
    private static func createMemoryGame() -> MemoryGame<String>{
            return MemoryGame(numberOfPairOfCards: 8){ pairIndex in
                if emojis.indices.contains(pairIndex){
                    return emojis[pairIndex]
                } else {
                    return "❌" 
                }
            }
    }
    
    //Para saber que es reactiva, que cambiara
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
        model.cards
    }
    var color: Color  {
        .orange
    }
    
    var score : Int {
        model.score
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    // No hay external name
    func choose(_ card: Card){
        model.choose(card)
    }
}
