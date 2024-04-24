//
//  DBServiceProvider.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import Foundation

protocol DBServiceProvider {
    func fetchHistory() -> [RoundHistory]
    func save(_ boardInfo: BoardInfo)
}
