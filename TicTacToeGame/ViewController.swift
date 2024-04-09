//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 08/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var btn_00: UIButton!
    @IBOutlet weak var btn_01: UIButton!
    @IBOutlet weak var btn_02: UIButton!
    @IBOutlet weak var btn_10: UIButton!
    @IBOutlet weak var btn_11: UIButton!
    @IBOutlet weak var btn_12: UIButton!
    @IBOutlet weak var btn_20: UIButton!
    @IBOutlet weak var btn_21: UIButton!
    @IBOutlet weak var btn_22: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var boards = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard() {
        boards.append(btn_00)
        boards.append(btn_01)
        boards.append(btn_02)
        boards.append(btn_10)
        boards.append(btn_11)
        boards.append(btn_12)
        boards.append(btn_20)
        boards.append(btn_21)
        boards.append(btn_22)
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkForVictory(CROSS)
        {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        
        if checkForVictory(NOUGHT)
        {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
    }
    
    func checkForVictory(_ s :String) -> Bool {
           // Horizontal Victory
           if thisSymbol(btn_00, s) && thisSymbol(btn_01, s) && thisSymbol(btn_02, s)
           {
               return true
           }
           if thisSymbol(btn_10, s) && thisSymbol(btn_11, s) && thisSymbol(btn_12, s)
           {
               return true
           }
           if thisSymbol(btn_20, s) && thisSymbol(btn_21, s) && thisSymbol(btn_22, s)
           {
               return true
           }
           
           // Vertical Victory
           if thisSymbol(btn_00, s) && thisSymbol(btn_01, s) && thisSymbol(btn_02, s)
           {
               return true
           }
           if thisSymbol(btn_10, s) && thisSymbol(btn_11, s) && thisSymbol(btn_12, s)
           {
               return true
           }
           if thisSymbol(btn_20, s) && thisSymbol(btn_21, s) && thisSymbol(btn_22, s)
           {
               return true
           }
           
           // Diagonal Victory
           if thisSymbol(btn_00, s) && thisSymbol(btn_11, s) && thisSymbol(btn_22, s)
           {
               return true
           }
           if thisSymbol(btn_02, s) && thisSymbol(btn_11, s) && thisSymbol(btn_20, s)
           {
               return true
           }
           
           return false
       }
       
       func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
           return button.title(for: .normal) == symbol
       }
           
       func resultAlert(title: String) {
           let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
           let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
           ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
               self.resetBoard()
           }))
           self.present(ac, animated: true)
       }
       
       func resetBoard() {
           for button in boards {
               button.setTitle(nil, for: .normal)
               button.isEnabled = true
           }
           if firstTurn == Turn.Nought {
               firstTurn = Turn.Cross
               turnLabel.text = CROSS
           } else if firstTurn == Turn.Cross {
               firstTurn = Turn.Nought
               turnLabel.text = NOUGHT
           }
           currentTurn = firstTurn
       }
       
       func fullBoard() -> Bool {
           for button in boards {
               if button.title(for: .normal) == nil {
                   return false
               }
           }
           return true
       }
           
       func addToBoard(_ sender: UIButton) {
           if(sender.title(for: .normal) == nil) {
               if(currentTurn == Turn.Nought) {
                   sender.setTitle(NOUGHT, for: .normal)
                   currentTurn = Turn.Cross
                   turnLabel.text = CROSS
               } else if(currentTurn == Turn.Cross) {
                   sender.setTitle(CROSS, for: .normal)
                   currentTurn = Turn.Nought
                   turnLabel.text = NOUGHT
               }
               sender.isEnabled = false
           }
       }
   }

