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
    @IBOutlet weak var pressHereToConitnueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonState()
        applyGradient()
        
        // Customize player1Name text field
        customizeTextField(player1Name)
        
        // Customize player2Name text field
        customizeTextField(player2Name)
        
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
        pressHereToConitnueButton.isEnabled = false
           player1Name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
           player2Name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       }
       
       @objc func textFieldDidChange(_ textField: UITextField) {
           pressHereToConitnueButton.isEnabled = !(player1Name.text?.isEmpty ?? true) && !(player2Name.text?.isEmpty ?? true)
       }
    

    @IBAction func pressHereToContinueButtonAction(_ sender: UIButton) {
        guard let player1Name = player1Name.text, let player2Name = player2Name.text else {
                    return
                }
                if let gameBoardVC = storyboard?.instantiateViewController(withIdentifier: "GameBoardViewController") as? GameBoardViewController {
//                    gameBoardVC.player1Name = player1Name
//                    gameBoardVC.player2Name = player2Name
                    navigationController?.pushViewController(gameBoardVC, animated: true)
                }
            }
    
    
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 95/255, green: 61/255, blue: 125/255, alpha: 1.0).cgColor,
            UIColor(red: 0/255, green: 97/255, blue: 128/255, alpha: 1.0).cgColor,
            UIColor(red: 63/255, green: 106/255, blue: 74/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

        
    }
    
