//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by DinDin on 2021/9/17.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static var emojis: [String] = ["🍂","🐚","💐","🌖","🌎","⚡️","⛅️","❄️","☂️","🍋","🍑","🥑","🥨","🥩","🥘","🫓"]
    static func createMemoryGames() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 3) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGames()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
        
    }
}
