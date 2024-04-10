//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 08/04/24.
//

import UIKit
import CoreData


class GameBoardViewController: UIViewController {
    enum Turn{
        case nought
        case cross
    }
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    
    
    var firstTurn: Turn = .cross
    var currentTurn: Turn = .cross
    
    var boardButtons = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    var player1: String = ""
    var player2: String = ""
    var winnerName: String?
    var boardSize: Int?
    
    
    let NOUGHT = "O"
    let CROSS = "X"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        AppGradient().applyGradient(view: self.view)
        player1Name.text = player1
        player2Name.text = player2
    }
    
    private func initBoard() {
        let screenWidth = view.frame.width
        let totalPadding: CGFloat = 20 + 10 * CGFloat(boardSize! - 1) // Leading padding (10px) + trailing padding (10px) + padding between buttons
        let availableWidth = screenWidth - totalPadding
        let buttonSize = availableWidth / CGFloat(boardSize!)
        
        var topSpacePercentage: CGFloat = 0.3
        let bottomPadding: CGFloat = 20
        
        // Check if the device is an iPad
        if UIDevice.current.userInterfaceIdiom == .pad {
            topSpacePercentage = 0.25 // Adjust this value as needed for iPad
        }
        
        let topSpace = view.frame.height * topSpacePercentage
        _ = view.frame.height - topSpace - bottomPadding
        let yOffset = topSpace
        
        let leadingPadding: CGFloat = 10
        let _: CGFloat = 10
        
        for row in 0..<boardSize! {
            for col in 0..<boardSize! {
                let button = UIButton(type: .system)
                button.frame = CGRect(x: leadingPadding + CGFloat(col) * (buttonSize + 10),
                                      y: yOffset + CGFloat(row) * (buttonSize + 10),
                                      width: buttonSize,
                                      height: buttonSize)
                button.backgroundColor = .clear
                button.setTitleColor(.white, for: .normal)
                button.layer.borderWidth = 1.0
                button.layer.borderColor = UIColor.white.cgColor
                button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                button.addTarget(self, action: #selector(boardTapAction(_:)), for: .touchUpInside)
                view.addSubview(button)
                boardButtons.append(button)
            }
        }
    }


    @objc func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        // Check for victory after each move
        if checkForVictory(NOUGHT) {
            resultAlert(title: "\(player2) Wins!")
            return
        }
        
        if checkForVictory(CROSS) {
            resultAlert(title: "\(player1) Wins!")
            return
        }
        
        if fullBoard() {
            resultAlert(title: "Draw")
        }
    }
    
    
    private func checkForVictory(_ symbol: String) -> Bool {
        // Check rows for victory
        for row in 0..<boardSize! {
            var rowMatch = true
            for col in 0..<boardSize! {
                if !thisSymbol(boardButtons[row * boardSize! + col], symbol) {
                    rowMatch = false
                    break
                }
            }
            if rowMatch {
                return true
            }
        }
        
        // Check columns for victory
        for col in 0..<boardSize! {
            var colMatch = true
            for row in 0..<boardSize! {
                if !thisSymbol(boardButtons[row * boardSize! + col], symbol) {
                    colMatch = false
                    break
                }
            }
            if colMatch {
                return true
            }
        }
        
        // Check diagonal from top-left to bottom-right
        var diagonalMatch = true
        for i in 0..<boardSize! {
            if !thisSymbol(boardButtons[i * boardSize! + i], symbol) {
                diagonalMatch = false
                break
            }
        }
        if diagonalMatch {
            return true
        }
        
        // Check diagonal from top-right to bottom-left
        diagonalMatch = true
        for i in 0..<boardSize! {
            if !thisSymbol(boardButtons[i * boardSize! + (boardSize! - 1 - i)], symbol) {
                diagonalMatch = false
                break
            }
        }
        if diagonalMatch {
            return true
        }
        
        return false
    }
    
    
    
    private func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    
    private func resultAlert(title: String) {
           winnerName = title
           let message = "\(title)"
           let ac = UIAlertController(title: message, message: nil, preferredStyle: .alert)
           
           let resetAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
               if let navigationController = self?.navigationController {
                   navigationController.popViewController(animated: true)
               }
           }
           
           let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
               self.saveGameState()
           }
           
           ac.addAction(resetAction)
           ac.addAction(saveAction)
           
           present(ac, animated: true)
       }
   
    
    private func fullBoard() -> Bool {
        for button in boardButtons {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    
    private func addToBoard(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            // Set button title based on current turn
            sender.setTitle((currentTurn == .nought) ? NOUGHT : CROSS, for: .normal)
            // Switch turns
            currentTurn = (currentTurn == .nought) ? .cross : .nought
            sender.isEnabled = false
        }
    }
    
    
    private func saveGameState() {
        // Determine the winner based on the current game state
        let winner = winnerName ?? ""
        
        // Prepare parameters to save
        let parameters = ParametersToSave(player1: player1, player2: player2, winner: winner)
        
        // Save the game state
        CoreDataManager.shared.save(parameters: parameters)
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}


struct ParametersToSave {
    let player1: String
    let player2: String
    let winner: String
}
