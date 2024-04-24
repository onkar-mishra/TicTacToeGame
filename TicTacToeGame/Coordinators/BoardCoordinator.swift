//
//  BoardCoordinator.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import Foundation

final class BoardCoordinator: BaseCoordinator {
    
    func navigateToGame(_ boardInfo: BoardInfo,_ animated: Bool = true) {
        let gameVC = GameBoardViewController.instantiate()
        gameVC.boardInfo = boardInfo
        navigation?.pushViewController(gameVC, animated: animated)
    }
    
    func navigateToHistory(_ animated: Bool = true) {
        let historyVC = RoundHistoryViewController.instantiate()
        navigation?.pushViewController(historyVC, animated: animated)
    }
}
