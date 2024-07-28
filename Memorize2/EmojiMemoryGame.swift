//
//  EmojiMemoryGame.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 27/07/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🤨", "💤", "🗿", "🕊️", "🦊", "🎸", "🧿", "⚗️", "⚰️", "🔫", "🪓", "💎"]
    //the private contrainst this model var to only be modified by this "model view"
    private static func createMemoryGame() -> MemoryGame<String>{
            return MemoryGame(numberOfPairOfCards: 13){ pairIndex in
                if emojis.indices.contains(pairIndex){
                    return emojis[pairIndex]
                } else {
                    return "❌"
                }
            }
    }
    
    //Para saber que es reactiva, que cambiara
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    // No hay external name
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
