//
//  GameBoardCoordinator.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import Foundation


final class GameBoardCoordinator: BaseCoordinator {
    
    func navigateToBoard(_ animated: Bool = true) {
        navigation?.popViewController(animated: animated)
    }
}
