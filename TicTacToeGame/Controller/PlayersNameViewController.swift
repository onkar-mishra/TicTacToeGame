//
//  PlayersNameViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 09/04/24.
//

import UIKit

class PlayersNameViewController: UIViewController {
    
    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    @IBOutlet weak var boardSize: UITextField!
    
    @IBOutlet weak var pressHereToContinueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonState()
        AppGradient().applyGradient(view: self.view)
        
        // Customize player1Name text field
        customizeTextField(player1Name)
        
        // Customize player2Name text field
        customizeTextField(player2Name)
        
        customizeTextField(boardSize)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Reset text fields
        player1Name.text = ""
        player2Name.text = ""
        boardSize.text = ""
        
        // Update button state
        setupButtonState()
    }
    
    func customizeTextField(_ textField: UITextField) {
        // Set background color to transparent
        textField.backgroundColor = .clear
        
        // Set font color to white
        textField.textColor = .white
        
        // Set placeholder text color to white
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        // Set border color to white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        
        // Set corner radius
        textField.layer.cornerRadius = 8
    }
    
    func setupButtonState() {
        pressHereToContinueButton.isEnabled = false
        player1Name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        player2Name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        boardSize.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // Update button state based on text fields' contents
        pressHereToContinueButton.isEnabled = isValidBoardSize(boardSize.text) && !(player1Name.text?.isEmpty ?? true) && !(player2Name.text?.isEmpty ?? true)
    }
    
    func isValidBoardSize(_ text: String?) -> Bool {
        guard let sizeString = text, let size = Int(sizeString) else {
            return false
        }
        return (3...10).contains(size)
    }
    
    
    @IBAction func pressHereToContinueButtonAction(_ sender: UIButton) {
        guard let player1Name = player1Name.text, let player2Name = player2Name.text , let boardSize = boardSize.text else {
            return
        }
        if let gameBoardVC = storyboard?.instantiateViewController(withIdentifier: "GameBoardViewController") as? GameBoardViewController {
            gameBoardVC.player1 = player1Name
            gameBoardVC.player2 = player2Name
            gameBoardVC.boardSize = Int(boardSize)
            navigationController?.pushViewController(gameBoardVC, animated: true)
        }
    }
    
}
    
