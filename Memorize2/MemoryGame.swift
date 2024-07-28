//
//  MemorizeGame.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 27/07/24.
//

import Foundation

struct MemoryGame <CardContent>{
    // Allow to see, but not to read, called "access control"
    private (set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        //Add numberOfPairOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairOfCards){
            //Toma el index de la lista y crea con ellos 2 cartas
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
