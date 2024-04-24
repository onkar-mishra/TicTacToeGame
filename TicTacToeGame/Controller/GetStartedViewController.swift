//
//  GetStartedViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 09/04/24.
//

import UIKit

final class GetStartedViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var getStaredButton: TicToeButton!
    @IBOutlet private weak var exitButton: TicToeButton!
    
    // MARK: - Properties
    private var coordinator: GetStartedCoordinator?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = GetStartedCoordinator(navigationController)
        setupSubviews()
    }
    // MARK: - Private Methods
    
    private func setupSubviews() {
        view.applyGradient()
    }
    // MARK: - Actions
    
    @IBAction private func onGetStartedTapped(_ sender: UIButton) {
        coordinator?.navigateToBoard()
    }
    
    @IBAction private func onExitTapped(_ sender: UIButton) {
        coordinator?.exitGame()
    }
}
