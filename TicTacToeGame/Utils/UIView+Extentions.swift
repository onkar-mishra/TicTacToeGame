//
//  UIView+Extentions.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 11/04/24.
//

import UIKit

extension UIView {
    func applyGradient(_ colors: [CGColor] = GlobalConstants.gradientColors,_ startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),_ endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.insertSublayer(gradientLayer, at: .zero)
    }
}
