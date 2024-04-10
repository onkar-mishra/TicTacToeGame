//
//  PlayersNameViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 09/04/24.
//

import UIKit

class PlayersNameViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    @IBOutlet weak var boardSize: UITextField!
    @IBOutlet weak var viewRoundHistoryButton: UIButton!
    @IBOutlet weak var pressHereToContinueButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTextFields()
        setupButtonState()
        updateViewRoundHistoryButtonVisibility()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        AppGradient().applyGradient(view: self.view)
        customizeTextField(player1Name)
        customizeTextField(player2Name)
        customizeTextField(boardSize)
    }
    
    private func customizeTextField(_ textField: UITextField) {
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 8
    }
    
    // MARK: - Button State
    
    private func setupButtonState() {
        pressHereToContinueButton.isEnabled = false
        player1Name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        player2Name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        boardSize.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        pressHereToContinueButton.isEnabled = isValidBoardSize(boardSize.text) && !(player1Name.text?.isEmpty ?? true) && !(player2Name.text?.isEmpty ?? true)
    }
    
    private func isValidBoardSize(_ text: String?) -> Bool {
        guard let sizeString = text, let size = Int(sizeString) else {
            return false
        }
        return (3...10).contains(size)
    }
    
    // MARK: - Actions
    
    @IBAction func pressHereToContinueButtonAction(_ sender: UIButton) {
        guard let player1Name = player1Name.text, let player2Name = player2Name.text, let boardSize = boardSize.text else {
            return
        }
        navigateToGameBoard(player1Name: player1Name, player2Name: player2Name, boardSize: boardSize)
    }
    
    @IBAction func viewHistoryButtonAction(_ sender: Any) {
        navigateToRoundHistory()
    }
    
    // MARK: - Navigation
    
    private func navigateToGameBoard(player1Name: String, player2Name: String, boardSize: String) {
        guard let gameBoardVC = storyboard?.instantiateViewController(withIdentifier: "GameBoardViewController") as? GameBoardViewController,
              let size = Int(boardSize) else {
            return
        }
        gameBoardVC.player1 = player1Name
        gameBoardVC.player2 = player2Name
        gameBoardVC.boardSize = size
        navigationController?.pushViewController(gameBoardVC, animated: true)
    }
    
    private func navigateToRoundHistory() {
        guard let roundHistoryVC = storyboard?.instantiateViewController(withIdentifier: "RoundHistoryViewController") as? RoundHistoryViewController else {
            return
        }
        navigationController?.pushViewController(roundHistoryVC, animated: true)
    }
    
    // MARK: - Helper
    
    private func resetTextFields() {
        player1Name.text = ""
        player2Name.text = ""
        boardSize.text = ""
    }
    
    private func updateViewRoundHistoryButtonVisibility() {
        // Fetch rounds from Core Data
        let rounds = CoreDataManager.shared.fetchRounds()
        
        // Check if there are any rounds fetched
        if rounds.isEmpty {
            // No rounds fetched, hide the button
            viewRoundHistoryButton.isHidden = true
        } else {
            // Rounds fetched, show the button
            viewRoundHistoryButton.isHidden = false
        }
    }
}
