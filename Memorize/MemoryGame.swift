//
//  MemoryGame.swift
//  Memorize
//
//  Created by DinDin on 2021/9/17.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let index = index(of: card)
        cards[index].isFaceUp.toggle()
        
    }
    
    func index(of card: Card) -> Int {
        for i in 0..<cards.count {
            if cards[i].id == card.id {
                return i
            }
        }
        return 0
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2 ))
            cards.append(Card(content: content, id: pairIndex*2 + 1))

        }
    }
    
    struct Card: Identifiable {
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
