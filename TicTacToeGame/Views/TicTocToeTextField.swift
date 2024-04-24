//
//  TicTocToeTextField.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import UIKit

class TicTocToeTextField: UITextField {
    
    private enum Constants {
        static let emptyString = ""
        static let cornerRadius: CGFloat = 8
        static let borderwidth: CGFloat = 1
        static let cursorLeftPadding: CGFloat = 8
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
        backgroundColor = .clear
        textColor = .white
        attributedPlaceholder = NSAttributedString(string: placeholder ?? Constants.emptyString, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        layer.borderWidth = Constants.borderwidth
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = Constants.cornerRadius
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: Constants.cursorLeftPadding, dy: .zero)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

