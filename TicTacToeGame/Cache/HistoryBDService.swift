//
//  HistoryBDService.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import Foundation
import CoreData

final class HistoryBDService: DBServiceProvider {
    
    let serviceManager: CoreDataManager
    
    init(serviceManager: CoreDataManager = CoreDataManager.shared) {
        self.serviceManager = serviceManager
    }
    
    func fetchHistory() -> [RoundHistory] {
        return self.serviceManager.fetch()
    }
    
    func save(_ boardInfo: BoardInfo) {
        let history: RoundHistory = self.serviceManager.create()
        history.player1 = boardInfo.firstPlayerName
        history.player2 = boardInfo.secondPlayername
        history.winner = boardInfo.winner
        self.serviceManager.save()
    }
}
