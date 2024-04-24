//
//  AppGradient.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 10/04/24.
//

import UIKit

struct AppGradient {
    
    func applyGradient(view: UIView) {
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
