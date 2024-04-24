//
//  RoundHistoryViewController.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 10/04/24.
//

import UIKit
import CoreData

class RoundTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var winnerName: UILabel!
    
    // MARK: - Properties Configuration
    
    func configure(with round: RoundHistory) {
        player1Name.text = round.player1
        player2Name.text = round.player2
        winnerName.text = round.winner
    }
}

class RoundHistoryViewController: UIViewController {
    
    @IBOutlet var historyTableView: UITableView!
    
    // MARK: - Properties
    
    var rounds: [RoundHistory] = [] // Array to hold fetched rounds
    private let storageService: HistoryBDService = HistoryBDService()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Round History"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setUpSubViews()
        fetchRounds() // Fetch rounds from Core Data
    }
}

// MARK: - Private Methods

extension RoundHistoryViewController {
    
    private func setUpSubViews() {
        view.applyGradient()
        setUpTableView()
    }
    private func setUpTableView() {
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.backgroundColor = .clear
    }
    private func fetchRounds() {
        rounds = storageService.fetchHistory()
        if rounds.isEmpty {
            let noRoundsLabel = UILabel()
            noRoundsLabel.text = "No round history"
            noRoundsLabel.textColor = .white
            noRoundsLabel.textAlignment = .center
            noRoundsLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
            noRoundsLabel.center = view.center
            view.addSubview(noRoundsLabel)
        } else {
            historyTableView.reloadData()
        }
    }
    
}


// MARK: - Table View Delegates and Data Source

extension RoundHistoryViewController:  UITableViewDataSource, UITableViewDelegate  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
