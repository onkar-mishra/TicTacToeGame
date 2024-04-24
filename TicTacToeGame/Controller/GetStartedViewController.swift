//
//  GetStartedViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 09/04/24.
//

import UIKit

<<<<<<< HEAD
class GetStartedViewController: UIViewController {
    
    @IBOutlet weak var getStaredButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
=======
final class GetStartedViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var getStaredButton: TicToeButton!
    @IBOutlet private weak var exitButton: TicToeButton!
    
    // MARK: - Properties
    private var coordinator: GetStartedCoordinator?
>>>>>>> dev
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        applyAppGradient()
        applyBorderAndShadow(to: getStaredButton)
        applyBorderAndShadow(to: exitButton)
    }
    
    private func applyAppGradient() {
        AppGradient().applyGradient(view: self.view)
    }
    
    private func applyBorderAndShadow(to button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
    }
    
    // MARK: - Actions
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        
        navigateToPlayersName()
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        exitApplication()
    }
    
    // MARK: - Navigation Methods
    
    private func navigateToPlayersName() {
        guard let playersNameViewController = storyboard?.instantiateViewController(withIdentifier: "PlayersNameViewController") as? PlayersNameViewController else {
            return
        }
        navigationController?.pushViewController(playersNameViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func exitApplication() {
        exit(0)
=======
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
>>>>>>> dev
    }
}
