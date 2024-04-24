//
//  GetStartedCoordinator.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import UIKit

final class GetStartedCoordinator: BaseCoordinator {
    func navigateToBoard(_ animated: Bool = true) {
        let boardVC = BoardInfoViewController.instantiate()
        navigation?.pushViewController(boardVC, animated: animated)
    }
    
    func exitGame() {
        exit(0)
    }
}
