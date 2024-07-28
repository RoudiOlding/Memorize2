//
//  Memorize2App.swift
//  Memorize2
//
//  Created by Rodrigo De los Ríos Rojas on 25/07/24.
//

import SwiftUI

@main
struct Memorize2App: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
