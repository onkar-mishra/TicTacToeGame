//
//  TicToeButton.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import UIKit

class TicToeButton: UIButton {
    
    private enum Constants {
        static let borderwidth: CGFloat = 1
        static let cornerRadius: CGFloat = 8
        static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
        static let shadowOpacity: Float = 0.5
        static let shadowRadius: CGFloat = 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.borderWidth = Constants.borderwidth
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = Constants.cornerRadius
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = Constants.shadowOffset
        layer.shadowOpacity = Constants.shadowOpacity
        layer.shadowRadius = Constants.shadowRadius
    }
}

