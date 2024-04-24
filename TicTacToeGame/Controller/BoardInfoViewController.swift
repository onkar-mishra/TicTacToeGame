//
//  BoardInfoViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 09/04/24.
//

import UIKit

final class BoardInfoViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet private weak var firstPlayerTF: TicTocToeTextField!
    @IBOutlet private weak var secondPlayerTF: TicTocToeTextField!
    @IBOutlet private weak var boardSizeTF: TicTocToeTextField!
    @IBOutlet private weak var viewRoundHistoryButton: UIButton!
    @IBOutlet private weak var pressHereToContinueButton: UIButton!
    
    // MARK: - Properties
    
    private var allInputTextFields: [UITextField] = []
    private var coordinator: BoardCoordinator?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = BoardCoordinator(navigationController)
        setupSubviews()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        pressHereToContinueButton.isEnabled = shouldEnableContine(textField.text ?? GlobalConstants.empty)
    }
}

// MARK: - Actions

extension BoardInfoViewController {
    @IBAction private func onContinueTapped(_ sender: UIButton) {
        guard let firstPlayerName = firstPlayerTF.text, let secondPlayerName = secondPlayerTF.text , let boardSize = boardSizeTF.text else {
            return
        }
        coordinator?.navigateToGame(BoardInfo(firstPlayerName: firstPlayerName, secondPlayername: secondPlayerName, boardSize: Int(boardSize) ?? Constants.minBoardSize, winner: nil))
        reset()
    }
    
    @IBAction private func viewHistoryButtonAction(_ sender: Any) {
        coordinator?.navigateToHistory()
    }
}

// MARK: - Private Methods

extension BoardInfoViewController {
    
    private func setupSubviews() {
        view.applyGradient()
        pressHereToContinueButton.isEnabled = false
        firstPlayerTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        secondPlayerTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        boardSizeTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func reset() {
        allInputTextFields = [firstPlayerTF, secondPlayerTF, boardSizeTF]
        allInputTextFields.forEach({$0.text = GlobalConstants.empty})
        view.endEditing(true)
        pressHereToContinueButton.isEnabled = false
    }
}

private extension BoardInfoViewController {
    private func shouldEnableContine(_ text: String) -> Bool {
        let allPlayerValues: [String?] = allInputTextFields.map { $0.text}
        return isValidBoardSize(text) && !allPlayerValues.containsNilOrEmpty
    }
    
    private func isValidBoardSize(_ text: String?) -> Bool {
        guard let sizeString = text, let size = Int(sizeString) else {
            return false
        }
        return (Constants.minBoardSize...Constants.maxBoardsize).contains(size)
    } 
}

private extension BoardInfoViewController{
    enum Constants {
        static let minBoardSize = 3
        static let maxBoardsize = 10
    }
}
