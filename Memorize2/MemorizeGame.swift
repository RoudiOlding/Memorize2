//
//  MemorizeGame.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 27/07/24.
//

import Foundation

struct MemoryGame <cardContent>{
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: cardContent
    }
}
