//
//  RoundHistoryViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 10/04/24.
//

import UIKit
import CoreData

class RoundTableViewCell: UITableViewCell {
    // Properties for UI elements
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var winnerName: UILabel!
    
    // Configure the cell UI elements with the given round
        func configure(with round: RoundHistory) {
            player1Name.text = round.player1
            player2Name.text = round.player2
            winnerName.text = round.winner
            
            
        }
}

class RoundHistoryViewController: UIViewController {
    
    @IBOutlet var historyTableView: UITableView!
    
    var rounds: [RoundHistory] = [] // Array to hold fetched rounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppGradient().applyGradient(view: self.view)
        
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.backgroundColor = .clear
        fetchRounds() // Fetch rounds from Core Data
    }
    
    
    // Function to fetch rounds from Core Data
    // Function to fetch rounds from Core Data
    func fetchRounds() {
        let fetchRequest: NSFetchRequest<RoundHistory> = RoundHistory.fetchRequest()
        
        do {
            rounds = try CoreDataManager.shared.mainContext.fetch(fetchRequest)
            historyTableView.reloadData()
        } catch {
            print("Error fetching rounds: \(error)")
        }
    }
}



extension RoundHistoryViewController:  UITableViewDataSource, UITableViewDelegate  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("round count: \(rounds.count)")
        return rounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoundCell", for: indexPath) as! RoundTableViewCell
        
        let round = rounds[indexPath.row]
        cell.configure(with: round)
        cell.backgroundColor = .clear
        
        return cell
    }
    
}
