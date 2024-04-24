//
//  OtherUtils.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import UIKit

enum StoryBoardName: String {
    case main
    
    var realName: String {
        return "Main"
    }
}

struct BoardInfo {
    let firstPlayerName: String
    let secondPlayername: String
    let boardSize: Int
    let winner: String?
}

enum GlobalConstants {
    static let empty = ""
    static let gradientColors = [
        UIColor(red: 95/255, green: 61/255, blue: 125/255, alpha: 1.0).cgColor,
        UIColor(red: 0/255, green: 97/255, blue: 128/255, alpha: 1.0).cgColor,
        UIColor(red: 63/255, green: 106/255, blue: 74/255, alpha: 1.0).cgColor
    ]
}

extension Array where Element: OptionalType {
    var containsNilOrEmpty: Bool {
        return self.contains { $0.isEmptyOrNil }
    }
}

protocol OptionalType {
    var isEmptyOrNil: Bool { get }
}

extension Optional: OptionalType where Wrapped == String {
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}
