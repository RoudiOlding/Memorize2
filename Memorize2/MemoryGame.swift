//
//  MemorizeGame.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 27/07/24.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable{
    // Allow to see, but not to read, called "access control"
    private (set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        //Add numberOfPairOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairOfCards){
            //Toma el index de la lista y crea con ellos 2 cartas
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)1b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{ cards.indices.filter { index in cards[index].isFaceUp }.only }
        set{ cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
     
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
